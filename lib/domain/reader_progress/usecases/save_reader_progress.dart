import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/reader_progress/usecases/params/save_reader_progress_params.dart';

@injectable
class SaveReaderProgress
    implements UseCase<void, SaveReaderProgressParams> {
  final BookResourceRepository repository;

  SaveReaderProgress(this.repository);

  @override
  Future<Either<Failure, void>> call(
    SaveReaderProgressParams params,
  ) {
    return repository.saveReaderProgress(
      resourceUuid: params.resourceUuid,
      locator: params.locator,
      progress: params.progress,
      lastReadAt: params.lastReadAt,
    );
  }
}


