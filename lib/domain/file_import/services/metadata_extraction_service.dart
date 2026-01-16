import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/file_import/entities/processed_file.dart';

class FileMetadata {
  final String? title;
  final String? author;
  final String? description;
  final List<int>? coverBytes;
  final int? pages;
  final int? durationSeconds;

  const FileMetadata({
    this.title,
    this.author,
    this.description,
    this.coverBytes,
    this.pages,
    this.durationSeconds,
  });
}

abstract class MetadataExtractionService {
  Future<Either<Failure, FileMetadata>> extractMetadata({
    required ProcessedFile file,
    required BookResourceFormat format,
  });
}
