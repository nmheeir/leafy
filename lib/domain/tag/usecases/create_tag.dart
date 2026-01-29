import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class CreateTagUseCase implements UseCase<Tag, Tag> {
  final TagRepository _repository;

  const CreateTagUseCase(this._repository);

  @override
  Future<Either<Failure, Tag>> call(Tag params) async {
    return _repository.createTag(params);
  }
}
