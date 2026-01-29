import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class RestoreTagUseCase implements UseCase<Unit, int> {
  final TagRepository _repository;

  const RestoreTagUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(int params) async {
    return _repository.restoreTag(params);
  }
}
