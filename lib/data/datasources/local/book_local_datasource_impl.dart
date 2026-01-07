import 'dart:io';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/models/book/book/book_model.dart';
import 'package:leafy/main.dart';
import 'package:sqflite/sqflite.dart';

import 'book_local_datasource.dart';

@LazySingleton(as: BookLocalDataSource)
class BookLocalDataSourceImpl implements BookLocalDataSource {
  final DatabaseService _db;

  BookLocalDataSourceImpl(this._db);

  static const _table = 'books';

  @override
  Future<int> create(BookModel book) async {
    final db = await _db.database;
    return db.insert(_table, book.toJson());
  }

  @override
  Future<List<BookModel>> getAll({List<String>? columns}) async {
    final db = await _db.database;
    final result = await db.query(_table, columns: columns);
    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<List<BookModel>> getAllNotDeleted({List<String>? columns}) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      columns: columns,
      where: 'deleted = 0',
    );
    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<List<BookModel>> getByStatus({
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
    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<List<BookModel>> search({
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
    return result.map(BookModel.fromJson).toList();
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
  Future<BookModel?> getById(int id) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      limit: 1,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? BookModel.fromJson(result.first) : null;
  }

  @override
  Future<List<BookModel>> getSoftDeleted() async {
    final db = await _db.database;
    final result = await db.query(_table, where: 'deleted = 1');
    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<int> update(BookModel book) async {
    final db = await _db.database;
    return db.update(
      _table,
      book.toJson(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  @override
  Future<int> hardDelete(int id) async {
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
  Future<List<Object?>> bulkUpdateAuthor(Set<int> ids, String author) async {
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
  Future<List<BookModel>> getByTag(String tag) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'tags IS NOT NULL AND deleted = 0',
      orderBy: 'publication_year ASC',
    );

    final books = result.map(BookModel.fromJson);

    return books.where((book) {
      final tags = book.tags?.split('|||||') ?? [];
      return tags.contains(tag);
    }).toList();
  }

  @override
  Future<List<BookModel>> getByAuthor(String author) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'author = ? AND deleted = 0',
      whereArgs: [author],
      orderBy: 'publication_year ASC',
    );
    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<File?> getCover(int bookId) async {
    final fileExists = File(
      '${appDocumentsDirectory.path}/$bookId.jpg',
    ).existsSync();

    if (fileExists) {
      return File('${appDocumentsDirectory.path}/$bookId.jpg');
    } else {
      return null;
    }
  }

  @override
  Future<void> saveCoverToStorage(int bookId, Uint8List cover) async {
    final file = File('${appDocumentsDirectory.path}/$bookId.jpg');
    await file.writeAsBytes(cover);
  }

  @override
  Future<Uint8List?> getCoverByte(int bookId) async {
    final fileExists = File(
      '${appDocumentsDirectory.path}/$bookId.jpg',
    ).existsSync();

    if (fileExists) {
      return File(
        '${appDocumentsDirectory.path}/$bookId.jpg',
      ).readAsBytesSync();
    } else {
      return null;
    }
  }

  @override
  Future<int> restore(int id) async {
    final db = await _db.database;
    final result = db.update(
      _table,
      {'deleted': 0},
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  @override
  Future<int> bulkSoftDetele(Set<int> ids) async {
    final db = await _db.database;
    final batch = db.batch();

    for (final id in ids) {
      batch.update(_table, {'deleted': 1}, where: 'id = ?', whereArgs: [id]);
    }

    final results = await batch.commit(noResult: false);
    return results.length;
  }

  @override
  Future<int> softDelete(int id) async {
    final db = await _db.database;
    final result = db.update(
      _table,
      {'deleted': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  @override
  Future<int> bulkHardDelete(Set<int> ids) async {
    final db = await _db.database;
    final batch = db.batch();

    for (final id in ids) {
      batch.delete(_table, where: 'id = ?', whereArgs: [id]);
    }

    final results = await batch.commit(noResult: false);
    return results.length;
  }
}
