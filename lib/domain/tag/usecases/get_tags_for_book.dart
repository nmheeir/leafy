import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';

@injectable
class GetTagsForBookUseCase implements UseCase<List<Tag>, int> {
  final BookTagRepository _repository;

  const GetTagsForBookUseCase(this._repository);

  @override
  Future<Either<Failure, List<Tag>>> call(int params) async {
    return _repository.getTagsForBook(params);
  }
}
