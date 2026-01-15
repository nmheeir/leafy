import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/file_import/entities/file_temporary_object.dart';
import 'package:leafy/domain/file_import/entities/processed_file.dart';

abstract class FileProcessingService {
  Future<Either<Failure, List<ProcessedFile>>> processFiles(
    List<FileTemporaryObject> files,
  );
}
