import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/reader_progress/usecases/params/clear_reader_progress_params.dart';

@injectable
class ClearReaderProgressUseCase
    implements UseCase<void, ClearReaderProgressParams> {
  final BookResourceRepository repository;

  ClearReaderProgressUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ClearReaderProgressParams params) {
    return repository.clearReaderProgress(params.resourceUuid);
  }
}
