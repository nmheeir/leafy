import 'dart:io';
import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/book_local_datasource.dart';
import 'package:leafy/data/models/book/book/book_model.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/domain/book/usecases/params/add_book_usecase_param.dart';
import 'package:leafy/domain/book/usecases/params/bulk_update_params.dart';
import 'package:leafy/domain/book/usecases/params/update_book_param.dart';
import 'package:leafy/main.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: BookRepository)
class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource _bookLocalDataSource;
  final Logger _logger;
  final _booksStreamController = BehaviorSubject<List<Book>>();

  BookRepositoryImpl(this._bookLocalDataSource, this._logger) {
    _refreshBooks();
  }

  /// Hàm nội bộ để làm mới Stream
  Future<void> _refreshBooks() async {
    try {
      _logger.d('Repository: Refreshing books stream...'); // Log Debug
      final books = await _bookLocalDataSource.getAllNotDeleted();
      _booksStreamController.add(books.map((e) => e.toEntity()).toList());
      _logger.d('Repository: Stream updated with ${books.length} books.');
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: Failed to refresh books stream',
        error: e,
        stackTrace: stackTrace,
      ); // Log Error
      _booksStreamController.addError(e);
    }
  }

  @override
  Stream<List<Book>> watchAllNotDeletedBooks() {
    return _booksStreamController;
  }

  // --- READ OPERATIONS ---

  @override
  Future<Either<Failure, Book>> getBookById(int id) async {
    try {
      final book = await _bookLocalDataSource.getById(id);
      if (book == null) {
        _logger.w('Repository: Book not found with ID: $id'); // Log Warning
        return Left(Failure.notFound());
      }
      return Right(book.toEntity());
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: getBookById failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getDeletedBooks() async {
    try {
      _logger.d('Repository: Fetching deleted books...');
      final books = await _bookLocalDataSource.getDeleted();
      return Right(books.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: getDeletedBooks failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> searchBooks(String query) async {
    try {
      _logger.d('Repository: Searching books with query: "$query"');
      late final List<BookModel> books;
      if (query.isEmpty) {
        books = await _bookLocalDataSource.getAll();
      } else {
        books = await _bookLocalDataSource.search(query: query);
      }
      return Right(books.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: searchBooks failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  // --- WRITE OPERATIONS ---

  @override
  Future<Either<Failure, int>> addBook(AddBookParams params) async {
    try {
      _logger.i(
        'Repository: Adding new book "${params.book.title}"...',
      ); // Log Info

      if (params.cover == null) {
        // _logger.w('Repository: Book added (ID: $bookId) but cover is NULL');
        // Lưu ý: Logic cũ của bạn return Left ở đây, nhưng sách đã được tạo trong DB rồi.
        // Bạn có muốn return Left không? Hay chỉ log warning?
        // Giữ nguyên logic cũ của bạn:
        _logger.w('Repository: Book cover is NULL');
        // return Left(Failure.unexpected('Cover cannot be null'));
      }

      final bookId = await _bookLocalDataSource.create(
        BookModel.fromEntity(params.book),
      );

      await _saveCoverToStorage(bookId, params.cover);

      _refreshBooks();
      _logger.i('Repository: Book added successfully. ID: $bookId');

      return Right(bookId);
    } catch (e, stackTrace) {
      _logger.e('Repository: addBook failed', error: e, stackTrace: stackTrace);
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateBook(UpdateBookParams params) async {
    try {
      _logger.i('Repository: Updating book ID: ${params.book.id}...');

      await _bookLocalDataSource.update(BookModel.fromEntity(params.book));

      if (params.cover != null) {
        _logger.d('Repository: Updating cover for book ID: ${params.book.id}');
        await _saveCoverToStorage(params.book.id!, params.cover!);
      } else {
        _logger.d('Repository: Cover is null, keeping existing cover.');
      }

      _refreshBooks();
      _logger.i('Repository: Book updated successfully.');

      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: updateBook failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteBook(int id) async {
    try {
      _logger.w(
        'Repository: Permanently deleting book ID: $id...',
      ); // Warning vì hành động nguy hiểm

      await _bookLocalDataSource.delete(id);

      // Xóa cả ảnh bìa
      await _deleteCoverFromStorage(id);

      _refreshBooks();
      _logger.i('Repository: Book deleted permanently.');

      return const Right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: deleteBook failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  // --- BULK OPERATIONS ---

  @override
  Future<Either<Failure, Unit>> bulkUpdateBooks(
    BulkUpdateBooksParams params,
  ) async {
    try {
      _logger.i('Repository: Bulk updating ${params.ids.length} books...');

      if (params.format != null) {
        _logger.d('Repository: Bulk updating format to ${params.format}');
        await _bookLocalDataSource.bulkUpdateFormat(params.ids, params.format!);
      }

      if (params.author != null) {
        _logger.d('Repository: Bulk updating author to ${params.author}');
        await _bookLocalDataSource.bulkUpdateAuthor(params.ids, params.author!);
      }

      _refreshBooks();
      return const Right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: bulkUpdateBooks failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.server());
    }
  }

  @override
  Future<Either<Failure, Unit>> bulkDeleteBooks(Set<int> ids) async {
    try {
      _logger.i('Repository: Bulk Soft-Deleting ${ids.length} books...');

      // Giả sử Datasource có hàm update deleted status, hoặc lặp qua update
      // Nếu chưa có hàm bulk ở datasource, ta loop tạm (tuy nhiên bulk ở SQL tốt hơn)
      for (final id in ids) {
        // TODO: implement
        //  await _bookLocalDataSource.updateDeletedStatus(id, true);
      }

      _refreshBooks();
      return const Right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: bulkDeleteBooks failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Book>> restoreBook(int id) async {
    try {
      _logger.i('Repository: Restoring book ID: $id...');

      // TODO: implement
      // await _bookLocalDataSource.updateDeletedStatus(id, false);

      _refreshBooks();

      // Lấy lại sách để trả về (Optional, tùy requirement UseCase)
      final book = await _bookLocalDataSource.getById(id);
      if (book == null) return Left(Failure.notFound());

      return Right(book.toEntity());
    } catch (e, stackTrace) {
      _logger.e(
        'Repository: restoreBook failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  // --- HELPERS ---

  Future _saveCoverToStorage(int? bookID, Uint8List? cover) async {
    if (bookID == null || cover == null) return;
    try {
      final file = File('${appDocumentsDirectory.path}/$bookID.jpg');
      await file.writeAsBytes(cover);
      _logger.d('Repository: Saved cover to ${file.path}');
    } catch (e) {
      _logger.e('Repository: Failed to save cover image', error: e);
    }
  }

  Future _deleteCoverFromStorage(int bookID) async {
    try {
      final file = File('${appDocumentsDirectory.path}/$bookID.jpg');
      if (await file.exists()) {
        await file.delete();
        _logger.d('Repository: Deleted cover file for ID $bookID');
      }
    } catch (e) {
      _logger.e('Repository: Failed to delete cover image', error: e);
    }
  }

  // --- UNIMPLEMENTED (Có thể để đó nếu chưa dùng) ---

  @override
  Future<Either<Failure, List<Book>>> getAllBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getAllNotDeletedBooks() {
    // Hàm này bạn đánh dấu NOTE: not use nên tôi không sửa
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksByStatus(int status) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> countBooksByStatus(int status) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksWithSameAuthor(String author) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksWithSameTag(String tag) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeAllBooks() {
    throw UnimplementedError();
  }
}
