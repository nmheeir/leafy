import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/book.dart';

abstract class BookLocalDataSource {
  Future<int> create(Book book);

  Future<List<Book>> getAll({List<String>? columns});
  Future<List<Book>> getAllNotDeleted({List<String>? columns});
  Future<List<Book>> getByStatus({
    required int status,
    List<String>? columns,
  });

  Future<List<Book>> search({
    required String query,
    List<String>? columns,
  });

  Future<int> countByStatus(int status);

  Future<Book?> getById(int id);

  Future<List<Book>> getDeleted();

  Future<int> update(Book book);
  Future<int> delete(int id);
  Future<int> removeAll();

  Future<List<Object?>> bulkUpdateFormat(
    Set<int> ids,
    BookFormat format,
  );

  Future<List<Object?>> bulkUpdateAuthor(
    Set<int> ids,
    String author,
  );

  Future<List<Book>> getByTag(String tag);
  Future<List<Book>> getByAuthor(String author);
}
