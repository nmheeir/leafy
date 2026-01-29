import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class GetTagByIdUseCase implements UseCase<Tag, int> {
  final TagRepository _repository;

  const GetTagByIdUseCase(this._repository);

  @override
  Future<Either<Failure, Tag>> call(int params) async {
    return _repository.getTagById(params);
  }
}
