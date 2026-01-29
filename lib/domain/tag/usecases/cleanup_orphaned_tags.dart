import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class CleanupOrphanedTagsUseCase implements UseCase<int, NoParams> {
  final TagRepository _repository;

  const CleanupOrphanedTagsUseCase(this._repository);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return _repository.cleanupOrphanedTags();
  }
}
