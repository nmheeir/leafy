import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/models/book.dart';
import 'package:sqflite/sqflite.dart';

import 'book_local_datasource.dart';

@LazySingleton(as: BookLocalDataSource)
class BookLocalDataSourceImpl implements BookLocalDataSource {
  final DatabaseService _db;

  BookLocalDataSourceImpl(this._db);

  static const _table = 'booksTable';

  @override
  Future<int> create(Book book) async {
    final db = await _db.database;
    return db.insert(_table, book.toJSON());
  }

  @override
  Future<List<Book>> getAll({List<String>? columns}) async {
    final db = await _db.database;
    final result = await db.query(_table, columns: columns);
    return result.map(Book.fromJSON).toList();
  }

  @override
  Future<List<Book>> getAllNotDeleted({List<String>? columns}) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      columns: columns,
      where: 'deleted = 0',
    );
    return result.map(Book.fromJSON).toList();
  }

  @override
  Future<List<Book>> getByStatus({
    required int status,
    List<String>? columns,
  }) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      columns: columns,
      where: 'status = ? AND deleted = 0',
      whereArgs: [status],
    );
    return result.map(Book.fromJSON).toList();
  }

  @override
  Future<List<Book>> search({
    required String query,
    List<String>? columns,
  }) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      columns: columns,
      where:
          '(title LIKE ? OR subtitle LIKE ? OR author LIKE ?) AND deleted = 0',
      whereArgs: ['%$query%', '%$query%', '%$query%'],
    );
    return result.map(Book.fromJSON).toList();
  }

  @override
  Future<int> countByStatus(int status) async {
    final db = await _db.database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery(
        'SELECT COUNT(*) FROM $_table WHERE status = ? AND deleted = 0',
        [status],
      ),
    );
    return count ?? 0;
  }

  @override
  Future<Book?> getById(int id) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      limit: 1,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? Book.fromJSON(result.first) : null;
  }

  @override
  Future<List<Book>> getDeleted() async {
    final db = await _db.database;
    final result = await db.query(_table, where: 'deleted = 1');
    return result.map(Book.fromJSON).toList();
  }

  @override
  Future<int> update(Book book) async {
    final db = await _db.database;
    return db.update(
      _table,
      book.toJSON(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await _db.database;
    return db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> removeAll() async {
    final db = await _db.database;
    return db.delete(_table);
  }

  @override
  Future<List<Object?>> bulkUpdateFormat(
    Set<int> ids,
    BookFormat format,
  ) async {
    final db = await _db.database;
    final batch = db.batch();

    final formatString = switch (format) {
      BookFormat.audiobook => 'audiobook',
      BookFormat.ebook => 'ebook',
      BookFormat.paperback => 'paperback',
      BookFormat.hardcover => 'hardcover',
    };

    for (final id in ids) {
      batch.update(
        _table,
        {'book_type': formatString},
        where: 'id = ?',
        whereArgs: [id],
      );
    }

    return batch.commit();
  }

  @override
  Future<List<Object?>> bulkUpdateAuthor(
    Set<int> ids,
    String author,
  ) async {
    final db = await _db.database;
    final batch = db.batch();

    for (final id in ids) {
      batch.update(
        _table,
        {'author': author},
        where: 'id = ?',
        whereArgs: [id],
      );
    }

    return batch.commit();
  }

  @override
  Future<List<Book>> getByTag(String tag) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'tags IS NOT NULL AND deleted = 0',
      orderBy: 'publication_year ASC',
    );

    final books = result.map(Book.fromJSON);

    return books.where((book) {
      final tags = book.tags?.split('|||||') ?? [];
      return tags.contains(tag);
    }).toList();
  }

  @override
  Future<List<Book>> getByAuthor(String author) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'author = ? AND deleted = 0',
      whereArgs: [author],
      orderBy: 'publication_year ASC',
    );
    return result.map(Book.fromJSON).toList();
  }
}
