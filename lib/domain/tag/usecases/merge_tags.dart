import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/merge_tags_params.dart';

@injectable
class MergeTagsUseCase implements UseCase<Unit, MergeTagsParams> {
  final TagRepository _repository;

  const MergeTagsUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(MergeTagsParams params) async {
    return _repository.mergeTags(params.sourceTagId, params.targetTagId);
  }
}
