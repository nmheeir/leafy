import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/file_import/entities/processed_file.dart';
import 'package:leafy/domain/file_import/services/file_processing_service.dart';

import 'package:leafy/domain/file_import/usecases/params/process_local_files_params.dart';

@lazySingleton
class ProcessLocalFilesUseCase
    implements UseCase<List<ProcessedFile>, ProcessLocalFilesParams> {
  final FileProcessingService service;

  ProcessLocalFilesUseCase(this.service);

  @override
  Future<Either<Failure, List<ProcessedFile>>> call(
    ProcessLocalFilesParams params,
  ) {
    return service.processFiles(params.files, bookId: params.bookId);
  }
}
