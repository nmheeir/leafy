import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/datasources/local/tag_local_datasource.dart';
import 'package:leafy/data/models/tag/tag_model.dart';

@LazySingleton(as: TagLocalDataSource)
class TagLocalDataSourceImpl implements TagLocalDataSource {
  final DatabaseService _db;

  TagLocalDataSourceImpl(this._db);

  static const _table = 'tags';

  @override
  Future<int> create(TagModel tag) async {
    final db = await _db.database;
    return db.insert(_table, tag.toJson());
  }

  @override
  Future<List<TagModel>> getAllActive() async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'deleted = 0',
      orderBy: 'priority DESC, name ASC',
    );
    return result.map(TagModel.fromJson).toList();
  }

  @override
  Future<List<TagModel>> getAll() async {
    final db = await _db.database;
    final result = await db.query(_table, orderBy: 'priority DESC, name ASC');
    return result.map(TagModel.fromJson).toList();
  }

  @override
  Future<TagModel?> getById(int id) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? TagModel.fromJson(result.first) : null;
  }

  @override
  Future<TagModel?> getByName(String name) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'name = ? AND deleted = 0',
      whereArgs: [name],
      limit: 1,
    );
    return result.isNotEmpty ? TagModel.fromJson(result.first) : null;
  }

  @override
  Future<List<TagModel>> getSystemTags() async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'is_system = 1 AND deleted = 0',
      orderBy: 'priority DESC, name ASC',
    );
    return result.map(TagModel.fromJson).toList();
  }

  @override
  Future<List<TagModel>> getUserTags() async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'is_system = 0 AND deleted = 0',
      orderBy: 'priority DESC, name ASC',
    );
    return result.map(TagModel.fromJson).toList();
  }

  @override
  Future<List<TagModel>> getByCategory(String category) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'category = ? AND deleted = 0',
      whereArgs: [category],
      orderBy: 'priority DESC, name ASC',
    );
    return result.map(TagModel.fromJson).toList();
  }

  @override
  Future<int> update(TagModel tag) async {
    final db = await _db.database;
    return db.update(
      _table,
      tag.toJson(),
      where: 'id = ?',
      whereArgs: [tag.id],
    );
  }

  @override
  Future<int> softDelete(int id) async {
    final db = await _db.database;
    return db.update(
      _table,
      {'deleted': 1, 'updated_at': DateTime.now().toIso8601String()},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<int> hardDelete(int id) async {
    final db = await _db.database;
    return db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> restore(int id) async {
    final db = await _db.database;
    return db.update(
      _table,
      {'deleted': 0, 'updated_at': DateTime.now().toIso8601String()},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<TagModel>> findOrphanedTags() async {
    final db = await _db.database;
    final result = await db.rawQuery('''
      SELECT t.* FROM $_table t
      LEFT JOIN book_tags bt ON t.id = bt.tag_id
      WHERE bt.id IS NULL 
        AND t.is_system = 0 
        AND t.deleted = 0
      ORDER BY t.priority DESC, t.name ASC
    ''');
    return result.map(TagModel.fromJson).toList();
  }

  @override
  Future<Map<int, int>> getTagStatistics() async {
    final db = await _db.database;
    final result = await db.rawQuery('''
      SELECT bt.tag_id, COUNT(DISTINCT bt.book_id) as book_count
      FROM book_tags bt
      JOIN books b ON bt.book_id = b.id
      WHERE b.deleted = 0
      GROUP BY bt.tag_id
    ''');

    final Map<int, int> stats = {};
    for (final row in result) {
      final tagId = row['tag_id'] as int;
      final count = row['book_count'] as int;
      stats[tagId] = count;
    }
    return stats;
  }

  @override
  Future<void> mergeTags(int sourceTagId, int targetTagId) async {
    final db = await _db.database;

    await db.transaction((txn) async {
      // Step 1: Update all book_tags from source to target
      // Handle potential UNIQUE constraint violations
      // First, get all book_ids that have source tag
      final sourceAssignments = await txn.query(
        'book_tags',
        columns: ['book_id'],
        where: 'tag_id = ?',
        whereArgs: [sourceTagId],
      );

      for (final assignment in sourceAssignments) {
        final bookId = assignment['book_id'] as int;

        // Check if target tag already exists for this book
        final existingTarget = await txn.query(
          'book_tags',
          where: 'book_id = ? AND tag_id = ?',
          whereArgs: [bookId, targetTagId],
          limit: 1,
        );

        if (existingTarget.isEmpty) {
          // Update source to target
          await txn.update(
            'book_tags',
            {'tag_id': targetTagId},
            where: 'book_id = ? AND tag_id = ?',
            whereArgs: [bookId, sourceTagId],
          );
        } else {
          // Delete source (target already exists)
          await txn.delete(
            'book_tags',
            where: 'book_id = ? AND tag_id = ?',
            whereArgs: [bookId, sourceTagId],
          );
        }
      }

      // Step 2: Soft delete source tag
      await txn.update(
        _table,
        {'deleted': 1, 'updated_at': DateTime.now().toIso8601String()},
        where: 'id = ?',
        whereArgs: [sourceTagId],
      );
    });
  }
}
