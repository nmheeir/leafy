import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';

@injectable
class GetBooksWithAllTagsUseCase implements UseCase<List<Book>, List<int>> {
  final BookTagRepository _repository;

  const GetBooksWithAllTagsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Book>>> call(List<int> params) async {
    return _repository.getBooksWithAllTags(params);
  }
}
