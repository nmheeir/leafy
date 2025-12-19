import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart' show BookFormat;
import 'package:leafy/data/database/database_controller.dart';
import 'package:leafy/data/models/book.dart';

@lazySingleton
class Repository {
  final DatabaseController _dbController;

  Repository(this._dbController);

  Future<List<Book>> getAllNotDeletedBooks() =>
      _dbController.getAllNotDeletedBooks();

  Future<List<Book>> getAllBooks() => _dbController.getAllBooks();

  Future<List<Book>> getBooks(int status) =>
      _dbController.getBooks(status: status);

  Future<List<Book>> searchBooks(String query) =>
      _dbController.searchBooks(query: query);

  Future<int> countBooks(int status) =>
      _dbController.countBooks(status: status);

  Future<int> insertBook(Book book) => _dbController.createBook(book);

  Future updateBook(Book book) => _dbController.updateBook(book);

  Future bulkUpdateBookFormat(Set<int> ids, BookFormat bookFormat) =>
      _dbController.bulkUpdateBookFormat(ids, bookFormat);

  Future bulkUpdateBookAuthor(Set<int> ids, String author) =>
      _dbController.bulkUpdateBookAuthor(ids, author);

  Future deleteBook(int index) => _dbController.deleteBook(index);

  Future<Book?> getBook(int index) => _dbController.getBook(index);

  Future<List<Book>> getDeletedBooks() => _dbController.getDeletedBooks();

  Future<int> removeAllBooks() => _dbController.removeAllBooks();

  Future<List<Book>> getBooksWithSameTag(String tag) =>
      _dbController.getBooksWithSameTag(tag);

  Future<List<Book>> getBooksWithSameAuthor(String author) =>
      _dbController.getBooksWithSameAuthor(author);
}
