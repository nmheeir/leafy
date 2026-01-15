import 'dart:io';

import 'package:diacritic/diacritic.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/utils/helpers/file_helper.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/file_import/entities/file_temporary_object.dart';
import 'package:leafy/domain/file_import/entities/processed_file.dart';
import 'package:leafy/domain/file_import/services/file_processing_service.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
      final appDocDir = await getApplicationDocumentsDirectory();

      for (final file in files) {
        // 1. Calculate Identification (MD5)
        final File ioFile = File(file.path);
        if (!ioFile.existsSync()) {
          continue;
        }

        final hash = await hashFile(ioFile);

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

        // 3. Sanitization
        final sanitizedName = _sanitizeFilename(file.name);
        // Requirement: "Input: Tên Sách #1 (Full).epub -> Output: ten_sach_1_full_171000123.epub"

        final targetPath = p.join(appDocDir.path, sanitizedName);

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

  String _sanitizeFilename(String originalName) {
    // 1. Remove extension for processing name part
    final extension = p.extension(originalName); // .epub
    final nameWithoutExt = p.basenameWithoutExtension(originalName);

    // 2. Remove special chars, replace space with underscore, lowercase
    // Vietnamese handling: "Tên Sách" -> "Ten Sach" -> "ten_sach"
    String clean = removeDiacritics(nameWithoutExt).toLowerCase();

    // Replace non-alphanumeric characters with underscore
    clean = clean.replaceAll(RegExp(r'[^a-z0-9]+'), '_');

    // Remote duplicate underscores if any
    clean = clean.replaceAll(RegExp(r'_+'), '_');

    // Remove leading/trailing underscores
    clean = clean.trim().replaceAll(RegExp(r'^_|_$'), '');

    // 3. Timestamp suffix
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    return '${clean}_$timestamp$extension';
  }
}
