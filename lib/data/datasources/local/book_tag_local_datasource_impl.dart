import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/book_tag_local_datasource.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/models/book/book/book_model.dart';
import 'package:leafy/data/models/tag/book_tag_model.dart';
import 'package:leafy/data/models/tag/tag_model.dart';

@LazySingleton(as: BookTagLocalDataSource)
class BookTagLocalDataSourceImpl implements BookTagLocalDataSource {
  final DatabaseService _db;

  BookTagLocalDataSourceImpl(this._db);

  static const _table = 'book_tags';

  @override
  Future<int> addTagToBook(BookTagModel bookTag) async {
    final db = await _db.database;
    return db.insert(_table, bookTag.toJson());
  }

  @override
  Future<int> removeTagFromBook(int bookId, int tagId) async {
    final db = await _db.database;
    return db.delete(
      _table,
      where: 'book_id = ? AND tag_id = ?',
      whereArgs: [bookId, tagId],
    );
  }

  @override
  Future<List<TagModel>> getTagsForBook(int bookId) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT t.* FROM tags t
      JOIN $_table bt ON t.id = bt.tag_id
      WHERE bt.book_id = ? AND t.deleted = 0
      ORDER BY bt.order_index ASC, t.priority DESC
    ''',
      [bookId],
    );
    return result.map(TagModel.fromJson).toList();
  }

  @override
  Future<List<BookModel>> getBooksWithTag(int tagId) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT b.* FROM books b
      JOIN $_table bt ON b.id = bt.book_id
      WHERE bt.tag_id = ? AND b.deleted = 0
      ORDER BY b.title ASC
    ''',
      [tagId],
    );
    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<List<BookModel>> getBooksWithAllTags(List<int> tagIds) async {
    if (tagIds.isEmpty) return [];

    final db = await _db.database;
    final placeholders = List.filled(tagIds.length, '?').join(',');

    // Find books that have ALL specified tags
    final result = await db.rawQuery(
      '''
      SELECT b.* FROM books b
      WHERE b.deleted = 0
        AND (
          SELECT COUNT(DISTINCT bt.tag_id)
          FROM $_table bt
          WHERE bt.book_id = b.id AND bt.tag_id IN ($placeholders)
        ) = ?
      ORDER BY b.title ASC
    ''',
      [...tagIds, tagIds.length],
    );

    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<List<BookModel>> getBooksWithAnyTag(List<int> tagIds) async {
    if (tagIds.isEmpty) return [];

    final db = await _db.database;
    final placeholders = List.filled(tagIds.length, '?').join(',');

    final result = await db.rawQuery('''
      SELECT DISTINCT b.* FROM books b
      JOIN $_table bt ON b.id = bt.book_id
      WHERE bt.tag_id IN ($placeholders) AND b.deleted = 0
      ORDER BY b.title ASC
    ''', tagIds);

    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<List<BookModel>> getBooksWithTagExcludingTag(
    int includeTagId,
    int excludeTagId,
  ) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT DISTINCT b.* FROM books b
      JOIN $_table bt ON b.id = bt.book_id
      WHERE bt.tag_id = ? 
        AND b.deleted = 0
        AND b.id NOT IN (
          SELECT book_id FROM $_table WHERE tag_id = ?
        )
      ORDER BY b.title ASC
    ''',
      [includeTagId, excludeTagId],
    );

    return result.map(BookModel.fromJson).toList();
  }

  @override
  Future<int> removeAllTagsFromBook(int bookId) async {
    final db = await _db.database;
    return db.delete(_table, where: 'book_id = ?', whereArgs: [bookId]);
  }

  @override
  Future<void> updateTagOrder(int bookId, List<int> tagIds) async {
    final db = await _db.database;

    await db.transaction((txn) async {
      for (int i = 0; i < tagIds.length; i++) {
        await txn.update(
          _table,
          {'order_index': i},
          where: 'book_id = ? AND tag_id = ?',
          whereArgs: [bookId, tagIds[i]],
        );
      }
    });
  }

  @override
  Future<List<Map<String, dynamic>>> findRelatedBooks(
    int bookId, {
    int limit = 10,
  }) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT 
        b.id,
        b.title,
        b.author,
        b.rating,
        COUNT(*) as shared_tags
      FROM books b
      JOIN $_table bt ON b.id = bt.book_id
      WHERE bt.tag_id IN (
        SELECT tag_id FROM $_table WHERE book_id = ?
      )
      AND b.id != ?
      AND b.deleted = 0
      GROUP BY b.id, b.title, b.author, b.rating
      ORDER BY shared_tags DESC, b.rating DESC
      LIMIT ?
    ''',
      [bookId, bookId, limit],
    );

    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getFrequentlyTaggedTogether(
    int tagId, {
    int limit = 5,
  }) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT 
        t.id,
        t.name,
        t.color,
        t.icon,
        COUNT(*) as co_occurrence
      FROM $_table bt1
      JOIN $_table bt2 ON bt1.book_id = bt2.book_id
      JOIN tags t ON bt2.tag_id = t.id
      WHERE bt1.tag_id = ?
        AND bt2.tag_id != ?
        AND t.deleted = 0
      GROUP BY t.id, t.name, t.color, t.icon
      ORDER BY co_occurrence DESC
      LIMIT ?
    ''',
      [tagId, tagId, limit],
    );

    return result;
  }

  @override
  Future<Map<int, int>> countBooksPerTag() async {
    final db = await _db.database;
    final result = await db.rawQuery('''
      SELECT bt.tag_id, COUNT(DISTINCT bt.book_id) as book_count
      FROM $_table bt
      JOIN books b ON bt.book_id = b.id
      WHERE b.deleted = 0
      GROUP BY bt.tag_id
    ''');

    final Map<int, int> counts = {};
    for (final row in result) {
      final tagId = row['tag_id'] as int;
      final count = row['book_count'] as int;
      counts[tagId] = count;
    }
    return counts;
  }

  @override
  Future<int> countBooksForTag(int tagId) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT COUNT(DISTINCT bt.book_id) as count
      FROM $_table bt
      JOIN books b ON bt.book_id = b.id
      WHERE bt.tag_id = ? AND b.deleted = 0
    ''',
      [tagId],
    );

    return (result.first['count'] as int?) ?? 0;
  }
}
