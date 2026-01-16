import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/constants/enums/storage_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/file_import/entities/processed_file.dart';
import 'package:uuid/uuid.dart';

class SaveImportedResourceParams {
  final List<ProcessedFile> processedFiles;
  final int bookId;

  const SaveImportedResourceParams({
    required this.processedFiles,
    required this.bookId,
  });
}

@lazySingleton
class SaveImportedResourceUseCase
    implements UseCase<List<BookResource>, SaveImportedResourceParams> {
  final BookResourceRepository _repository;
  final Uuid _uuidGenerator;

  SaveImportedResourceUseCase(this._repository) : _uuidGenerator = const Uuid();

  @override
  Future<Either<Failure, List<BookResource>>> call(
    SaveImportedResourceParams params,
  ) async {
    final List<BookResource> addedResources = [];

    // Loop through each processed file
    for (final file in params.processedFiles) {
      final resourceUuid = _uuidGenerator.v4();
      final format = _mapExtensionToFormat(file.extension);

      // 1. Insert into 'book_resources'
      final addResult = await _repository.addResource(
        bookId: params.bookId,
        uuid: resourceUuid,
        format: format,
        filePath: file.savedPath,
        storageType: StorageType.local,
        fileHash: file.hash,
        fileSize: file.size,
      );

      // Handling Either with fold or extensions
      if (addResult.isLeft()) {
        continue;
      }

      final resource = addResult.getOrElse(
        (l) => throw l,
      ); // Should not throw due to isLeft check

      // 2. Insert into 'reader_progress' with 0% logic
      // final progressResult = await _repository.saveReaderProgress(
      //   resourceUuid: resourceUuid,
      //   locator: '', // Empty locator for start
      //   progress: 0.0,
      //   lastReadAt: DateTime.now(),
      // );

      addedResources.add(resource);
    }

    if (addedResources.isEmpty && params.processedFiles.isNotEmpty) {
      // If inputs existed but no outputs -> Everything failed
      return const Left(
        Failure.database('Could not save any files to database'),
      );
    }

    return Right(addedResources);
  }

  BookResourceFormat _mapExtensionToFormat(String extension) {
    // extension includes dot, e.g. '.epub'
    final ext = extension.toLowerCase().replaceAll('.', '');
    switch (ext) {
      case 'epub':
        return BookResourceFormat.epub;
      case 'pdf':
        return BookResourceFormat.pdf;
      case 'html':
      case 'htm':
        return BookResourceFormat.html;
      case 'mp3':
      case 'm4a':
      case 'wav':
        return BookResourceFormat.audio;
      default:
        return BookResourceFormat.epub;
    }
  }
}
