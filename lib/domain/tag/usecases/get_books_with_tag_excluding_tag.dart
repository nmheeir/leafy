import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/get_books_with_tag_excluding_params.dart';

@injectable
class GetBooksWithTagExcludingTagUseCase
    implements UseCase<List<Book>, GetBooksWithTagExcludingParams> {
  final BookTagRepository _repository;

  const GetBooksWithTagExcludingTagUseCase(this._repository);

  @override
  Future<Either<Failure, List<Book>>> call(
    GetBooksWithTagExcludingParams params,
  ) async {
    return _repository.getBooksWithTagExcludingTag(
      params.includeTagId,
      params.excludeTagId,
    );
  }
}
