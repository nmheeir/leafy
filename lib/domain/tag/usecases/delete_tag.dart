import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class DeleteTagUseCase implements UseCase<Unit, int> {
  final TagRepository _repository;

  const DeleteTagUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(int params) async {
    return _repository.deleteTag(params);
  }
}
