import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';

@injectable
class GetAllBooksUseCase implements UseCase<List<Book>, NoParams> {
  final BookRepository bookRepository;

  GetAllBooksUseCase(this.bookRepository);

  @override
  Future<Either<Failure, List<Book>>> call(NoParams params) {
    return bookRepository.getAllBooks();
  }
}
