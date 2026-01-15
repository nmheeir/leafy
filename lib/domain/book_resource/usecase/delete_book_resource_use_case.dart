import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';

@lazySingleton
class DeleteBookResourceUseCase implements UseCase<Unit, String> {
  final BookResourceRepository _repository;

  DeleteBookResourceUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String resourceUuid) {
    return _repository.deleteResource(resourceUuid);
  }
}
