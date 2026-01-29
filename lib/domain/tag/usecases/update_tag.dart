import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class UpdateTagUseCase implements UseCase<Unit, Tag> {
  final TagRepository _repository;

  const UpdateTagUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(Tag params) async {
    return _repository.updateTag(params);
  }
}
