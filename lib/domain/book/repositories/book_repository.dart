import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:fpdart/fpdart.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getAllBooks();
  Future<Either<Failure, List<Book>>> getAllNotDeletedBooks();
  Future<Either<Failure, List<Book>>> getDeletedBooks();

  Future<Either<Failure, List<Book>>> getBooksByStatus(int status);
  Future<Either<Failure, List<Book>>> searchBooks(String query);

  Future<Either<Failure, Book?>> getBookById(int id);

  Future<Either<Failure, int>> countBooksByStatus(int status);

  Future<Either<Failure, int>> addBook(Book book);
  Future<Either<Failure, void>> updateBook(Book book);
  Future<Either<Failure, void>> deleteBook(int id);
  Future<Either<Failure, void>> removeAllBooks();

  Future<Either<Failure, void>> bulkUpdateBookFormat(
    Set<int> ids,
    BookFormat bookFormat,
  );

  Future<Either<Failure, void>> bulkUpdateBookAuthor(
    Set<int> ids,
    String author,
  );

  Future<Either<Failure, List<Book>>> getBooksWithSameTag(String tag);
  Future<Either<Failure, List<Book>>> getBooksWithSameAuthor(String author);
}
