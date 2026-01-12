import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/book_resource/usecase/params/delete_book_resource_params.dart';

@injectable
class DeleteBookResourceUseCase implements UseCase<Unit, DeleteBookResourceParams> {
  final BookResourceRepository repository;

  DeleteBookResourceUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteBookResourceParams params) {
    return repository.deleteResource(params.resourceUuid);
  }
}
