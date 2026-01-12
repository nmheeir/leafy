import 'dart:io';
import 'dart:typed_data';

import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/book/book/book_model.dart';

abstract class BookLocalDataSource {
  Future<int> create(BookModel book);

  Future<List<BookModel>> getAll({List<String>? columns});
  Future<List<BookModel>> getAllNotDeleted({List<String>? columns});
  Future<List<BookModel>> getByStatus({
    required int status,
    List<String>? columns,
  });

  Future<List<BookModel>> search({
    required String query,
    List<String>? columns,
  });

  Future<int> countByStatus(int status);

  Future<BookModel?> getById(int id);

  /// Get only soft-deleted records
  Future<List<BookModel>> getSoftDeleted();

  Future<int> update(BookModel book);

  /// Hard delete (delete permanently from DB)
  Future<int> hardDelete(int id);

  /// Soft delete = deleted = true
  Future<int> softDelete(int id);

  Future<int> removeAll();

  Future<int> restore(int id);

  Future<List<Object?>> bulkUpdateFormat(Set<int> ids, BookFormat format);
  Future<List<Object?>> bulkUpdateAuthor(Set<int> ids, String author);

  Future<int> bulkSoftDetele(Set<int> ids);
  Future<int> bulkHardDelete(Set<int> ids);

  Future<List<BookModel>> getByTag(String tag);
  Future<List<BookModel>> getByAuthor(String author);

  Future<void> saveCoverToStorage(int bookId, Uint8List cover);
  Future<File?> getCover(int bookId);
  Future<Uint8List?> getCoverByte(int bookId);
}
