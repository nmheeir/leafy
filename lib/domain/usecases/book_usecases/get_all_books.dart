import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/entities/book.dart';
import 'package:leafy/domain/repositories/book_repository.dart';

class GetAllBooks {
  final BookRepository bookRepository;

  GetAllBooks(this.bookRepository);

  Future<Either<Failure, List<Book>>> call() async {
    return await bookRepository.getAllBooks();
  }
}
