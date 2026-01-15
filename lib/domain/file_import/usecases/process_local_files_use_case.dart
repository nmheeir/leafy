import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/file_import/entities/file_temporary_object.dart';
import 'package:leafy/domain/file_import/entities/processed_file.dart';
import 'package:leafy/domain/file_import/services/file_processing_service.dart';

@lazySingleton
class ProcessLocalFilesUseCase
    implements UseCase<List<ProcessedFile>, List<FileTemporaryObject>> {
  final FileProcessingService service;

  ProcessLocalFilesUseCase(this.service);

  @override
  Future<Either<Failure, List<ProcessedFile>>> call(
    List<FileTemporaryObject> params,
  ) {
    return service.processFiles(params);
  }
}
