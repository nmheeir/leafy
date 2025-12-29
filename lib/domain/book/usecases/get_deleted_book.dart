import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';

class GetDeletedBooksUseCase implements UseCase<List<Book>, NoParams> {
  final BookRepository bookRepository;

  GetDeletedBooksUseCase(this.bookRepository);

  @override
  Future<Either<Failure, List<Book>>> call(NoParams params) async {
    return await bookRepository.getDeletedBooks();
  }
}
