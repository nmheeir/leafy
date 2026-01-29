import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';

@injectable
class GetBooksWithTagUseCase implements UseCase<List<Book>, int> {
  final BookTagRepository _repository;

  const GetBooksWithTagUseCase(this._repository);

  @override
  Future<Either<Failure, List<Book>>> call(int params) async {
    return _repository.getBooksWithTag(params);
  }
}
