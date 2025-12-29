import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/usecases/params/add_book_usecase_param.dart';
import 'package:leafy/domain/book/usecases/params/bulk_update_params.dart';
import 'package:leafy/domain/book/usecases/params/update_book_param.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getAllBooks();
  Future<Either<Failure, List<Book>>> getAllNotDeletedBooks();
  Stream<List<Book>> watchAllNotDeletedBooks();
  Future<Either<Failure, List<Book>>> getDeletedBooks();

  Future<Either<Failure, List<Book>>> getBooksByStatus(int status);
  Future<Either<Failure, List<Book>>> searchBooks(String query);

  Future<Either<Failure, Book>> getBookById(int id);

  Future<Either<Failure, int>> countBooksByStatus(int status);

  Future<Either<Failure, int>> addBook(AddBookParams params);

  Future<Either<Failure, Unit>> updateBook(UpdateBookParams params);
  Future<Either<Failure, Unit>> bulkUpdateBooks(BulkUpdateBooksParams params);

  Future<Either<Failure, Unit>> deleteBook(int id);
  Future<Either<Failure, Unit>> removeAllBooks();

  Future<Either<Failure, Unit>> bulkUpdateBookFormat(
    Set<int> ids,
    BookFormat bookFormat,
  );

  Future<Either<Failure, Unit>> bulkUpdateBookAuthor(
    Set<int> ids,
    String author,
  );

  Future<Either<Failure, List<Book>>> getBooksWithSameTag(String tag);
  Future<Either<Failure, List<Book>>> getBooksWithSameAuthor(String author);
}
