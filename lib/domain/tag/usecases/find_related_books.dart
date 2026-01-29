import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/find_related_books_params.dart';

@injectable
class FindRelatedBooksUseCase
    implements UseCase<List<Map<String, dynamic>>, FindRelatedBooksParams> {
  final BookTagRepository _repository;

  const FindRelatedBooksUseCase(this._repository);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> call(
    FindRelatedBooksParams params,
  ) async {
    return _repository.findRelatedBooks(params.bookId, limit: params.limit);
  }
}
