import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/utils/helpers/file_helper.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/file_import/entities/file_temporary_object.dart';
import 'package:leafy/domain/file_import/entities/processed_file.dart';
import 'package:leafy/domain/file_import/services/file_processing_service.dart';
import 'package:path/path.dart' as p;

@LazySingleton(as: FileProcessingService)
class FileProcessingServiceImpl implements FileProcessingService {
  final BookResourceRepository _resourceRepository;

  FileProcessingServiceImpl(this._resourceRepository);

  @override
  Future<Either<Failure, List<ProcessedFile>>> processFiles(
    List<FileTemporaryObject> files, {
    int? bookId,
  }) async {
    final List<ProcessedFile> processedFiles = [];

    try {
      for (final file in files) {
        // 1. Calculate Identification (MD5)
        final File ioFile = File(file.path);
        if (!ioFile.existsSync()) {
          continue;
        }

        final hash = await FileHelper.hashFile(ioFile);

        // 2. Duplicate Check
        final existsResult = await _resourceRepository.existsByFileHash(
          hash,
          bookId: bookId,
        );

        // Handling Either:
        final exists = existsResult.getOrElse(
          (l) => false,
        ); // If DB error, assume not exists to avoid block? Or fail?
        // Safer to maybe fail or log. Assuming false for now to proceed, but if strict:
        if (existsResult.isLeft()) {
          // Skip or log error? Let's skip this file to be safe.
          continue;
        }

        if (exists) {
          // Duplicate found. Requirement: "Skip: Ignore this file, continue loop"
          continue;
        }

        final targetPath = FileHelper.generateEpubFilePath(file.name);

        final targetDir = Directory(p.dirname(targetPath));
        if (!targetDir.existsSync()) {
          await targetDir.create(recursive: true);
        }

        // 4. Persistence
        try {
          await ioFile.copy(targetPath);
        } catch (e) {
          // "If IO error / Disk full -> Report 'Not enough memory' -> Break Loop"
          // For now, we return failure for this batch or partial?
          // Flow says "Break Loop".
          return Left(Failure.unexpected('Lỗi lưu trữ file: ${e.toString()}'));
        }

        // 5. Categorization -> ProcessedFile
        processedFiles.add(
          ProcessedFile(
            originalPath: file.path,
            savedPath: targetPath,
            hash: hash,
            size: file.size,
            extension: file.extension,
            originalName: file.name,
          ),
        );
      }

      return Right(processedFiles);
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}
