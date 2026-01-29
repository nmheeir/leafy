import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class GetTagByNameUseCase implements UseCase<Tag?, String> {
  final TagRepository _repository;

  const GetTagByNameUseCase(this._repository);

  @override
  Future<Either<Failure, Tag?>> call(String params) async {
    return _repository.getTagByName(params);
  }
}
