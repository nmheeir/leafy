import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class GetAllActiveTagsUseCase implements UseCase<List<Tag>, NoParams> {
  final TagRepository _repository;

  const GetAllActiveTagsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Tag>>> call(NoParams params) async {
    return _repository.getAllActiveTags();
  }
}
