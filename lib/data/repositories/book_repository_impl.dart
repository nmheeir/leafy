import 'dart:io';
import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/book_local_datasource.dart';
import 'package:leafy/data/models/book/book/book_model.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/domain/book/usecases/params/add_book_usecase_param.dart';
import 'package:leafy/domain/book/usecases/params/bulk_update_params.dart';
import 'package:leafy/domain/book/usecases/params/update_book_param.dart';
import 'package:leafy/main.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: BookRepository)
class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource _bookLocalDataSource;
  final _booksStreamController = BehaviorSubject<List<Book>>();

  BookRepositoryImpl(this._bookLocalDataSource) {
    _refreshBooks();
  }

  Future<void> _refreshBooks() async {
    try {
      final books = await _bookLocalDataSource.getAllNotDeleted();
      _booksStreamController.add(books.map((e) => e.toEntity()).toList());
    } catch (e) {
      _booksStreamController.addError(e);
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getAllBooks() {
    // TODO: implement getAllBooks
    throw UnimplementedError();
  }

  // NOTE: not use
  @override
  Future<Either<Failure, List<Book>>> getAllNotDeletedBooks() async {
    try {
      final books = await _bookLocalDataSource.getAllNotDeleted();

      return Right(books.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksByStatus(int status) {
    // TODO: implement getBooksByStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getDeletedBooks() async {
    try {
      final book = await _bookLocalDataSource.getDeleted();

      return Right(book.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> searchBooks(String query) async {
    try {
      late final List<BookModel> books;
      if (query.isEmpty) {
        books = await _bookLocalDataSource.getAll();
      } else {
        books = await _bookLocalDataSource.search(query: query);
      }

      return Right(books.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, int>> addBook(AddBookParams params) async {
    try {
      final bookId = await _bookLocalDataSource.create(
        BookModel.fromEntity(params.book),
      );

      if (params.cover == null) {
        return Left(Failure.unexpected('Cover cannot be null'));
      }

      _saveCoverToStorage(bookId, params.cover);

      _refreshBooks();

      return Right(bookId);
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> bulkUpdateBookAuthor(
    Set<int> ids,
    String author,
  ) {
    // TODO: implement bulkUpdateBookAuthor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> bulkUpdateBookFormat(
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
  Future<Either<Failure, Unit>> deleteBook(int id) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Book>> getBookById(int id) async {
    try {
      final book = await _bookLocalDataSource.getById(id);
      if (book == null) {
        return Left(Failure.notFound());
      }
      return Right(book.toEntity());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
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
  Future<Either<Failure, Unit>> removeAllBooks() {
    // TODO: implement removeAllBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateBook(UpdateBookParams params) async {
    try {
      final bookId = await _bookLocalDataSource.update(
        BookModel.fromEntity(params.book),
      );

      if (params.cover == null) {
        return Left(Failure.unexpected('Cover cannot be null'));
      }

      _saveCoverToStorage(bookId, params.cover);

      _refreshBooks();

      return right(unit);
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Stream<List<Book>> watchAllNotDeletedBooks() {
    return _booksStreamController;
  }

  @override
  Future<Either<Failure, Unit>> bulkUpdateBooks(
    BulkUpdateBooksParams params,
  ) async {
    try {
      if (params.format != null) {
        await _bookLocalDataSource.bulkUpdateFormat(params.ids, params.format!);
      }

      if (params.author != null) {
        await _bookLocalDataSource.bulkUpdateAuthor(params.ids, params.author!);
      }

      _refreshBooks();

      return const Right(unit);
    } catch (e) {
      return Left(Failure.server());
    }
  }

  Future _saveCoverToStorage(int? bookID, Uint8List? cover) async {
    if (bookID == null || cover == null) return;

    final file = File('${appDocumentsDirectory.path}/$bookID.jpg');
    await file.writeAsBytes(cover);
  }
}
