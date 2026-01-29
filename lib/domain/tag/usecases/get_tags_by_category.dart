import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class GetTagsByCategoryUseCase implements UseCase<List<Tag>, String> {
  final TagRepository _repository;

  const GetTagsByCategoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<Tag>>> call(String params) async {
    return _repository.getTagsByCategory(params);
  }
}
