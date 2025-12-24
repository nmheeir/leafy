import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/entities/book.dart';
import 'package:fpdart/fpdart.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getAllBooks();
  Future<Either<Failure, List<Book>>> getAllNotDeletedBooks();
  Future<Either<Failure, List<Book>>> getDeletedBooks();

  Future<Either<Failure, List<Book>>> getBooksByStatus(int status);
  Future<Either<Failure, List<Book>>> searchBooks(String query);

  // Future<Book?> getBookById(int id);

  // Future<int> countBooksByStatus(int status);

  // Future<int> addBook(Book book);
  // Future<void> updateBook(Book book);
  // Future<void> deleteBook(int id);
  // Future<void> removeAllBooks();

  // Future<void> bulkUpdateBookFormat(Set<int> ids, BookFormat bookFormat);

  // Future<void> bulkUpdateBookAuthor(Set<int> ids, String author);

  // Future<List<Book>> getBooksWithSameTag(String tag);
  // Future<List<Book>> getBooksWithSameAuthor(String author);
}
