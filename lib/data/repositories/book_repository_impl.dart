import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/book_local_datasource.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';

@LazySingleton(as: BookRepository)
class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource _bookLocalDataSource;

  BookRepositoryImpl(this._bookLocalDataSource);

  @override
  Future<Either<Failure, List<Book>>> getAllBooks() {
    // TODO: implement getAllBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getAllNotDeletedBooks() {
    // TODO: implement getAllNotDeletedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksByStatus(int status) {
    // TODO: implement getBooksByStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getDeletedBooks() {
    // TODO: implement getDeletedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> searchBooks(String query) {
    // TODO: implement searchBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> addBook(Book book) async {
    try {
      // TODO: add book -> save cover to storage
      // final bookId = await _bookLocalDataSource.create();
      return Left(Failure.unexpected('Not Implement'));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> bulkUpdateBookAuthor(
    Set<int> ids,
    String author,
  ) {
    // TODO: implement bulkUpdateBookAuthor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> bulkUpdateBookFormat(
    Set<int> ids,
    BookFormat bookFormat,
  ) {
    // TODO: implement bulkUpdateBookFormat
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> countBooksByStatus(int status) {
    // TODO: implement countBooksByStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteBook(int id) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Book?>> getBookById(int id) {
    // TODO: implement getBookById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksWithSameAuthor(String author) {
    // TODO: implement getBooksWithSameAuthor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksWithSameTag(String tag) {
    // TODO: implement getBooksWithSameTag
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> removeAllBooks() {
    // TODO: implement removeAllBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateBook(Book book) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }
}
