import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/book_resource_local_datasource.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/models/book_resource/book_resource_model.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: BookResourceLocalDatasource)
class BookResourceLocalDatasourceImpl implements BookResourceLocalDatasource {
  final DatabaseService _db;

  BookResourceLocalDatasourceImpl(this._db);

  static const _table = 'book_resources';

  /* --------------------------------------------------
   * Delete
   * -------------------------------------------------- */

  @override
  Future<void> deleteByUuid(String uuid) async {
    final db = await _db.database;
    await db.delete(_table, where: 'uuid = ?', whereArgs: [uuid]);
  }

  /* --------------------------------------------------
   * Exists
   * -------------------------------------------------- */

  @override
  Future<bool> existsByFileHash(String hash) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      columns: ['id'],
      where: 'file_hash = ?',
      whereArgs: [hash],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  @override
  Future<bool> existsByUuid(String uuid) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      columns: ['id'],
      where: 'uuid = ?',
      whereArgs: [uuid],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  /* --------------------------------------------------
   * Query
   * -------------------------------------------------- */

  @override
  Future<List<BookResourceModel>> getByBookId(int bookId) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'book_id = ?',
      whereArgs: [bookId],
      orderBy: 'created_at ASC',
    );

    return result.map((e) => BookResourceModel.fromJson(e)).toList();
  }

  /// Trả về book resource dựa vào uuid
  @override
  Future<BookResourceModel?> getByUuid(String uuid) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'uuid = ?',
      whereArgs: [uuid],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return BookResourceModel.fromJson(result.first);
  }

  /// Trả về book resource đã được đọc gần nhất dựa vào book id
  @override
  Future<BookResourceModel?> getLastReadByBookId(int bookId) async {
    final db = await _db.database;

    final result = await db.rawQuery(
      '''
      SELECT r.*
      FROM book_resources r
      JOIN reader_progress p ON p.resource_id = r.id
      WHERE r.book_id = ?
      ORDER BY p.last_read_at DESC
      LIMIT 1
    ''',
      [bookId],
    );

    if (result.isEmpty) return null;
    return BookResourceModel.fromJson(result.first);
  }

  /// Trả về list book resource bị hỏng
  @override
  Future<List<BookResourceModel>> getBrokenResources() async {
    final db = await _db.database;

    // Broken = file_path NULL hoặc rỗng
    final result = await db.query(
      _table,
      where: 'file_path IS NULL OR file_path = ""',
    );

    return result.map((e) => BookResourceModel.fromJson(e)).toList();
  }

  /* --------------------------------------------------
   * Insert / Update
   * -------------------------------------------------- */

  @override
  Future<int> insert(BookResourceModel model) async {
    final db = await _db.database;

    final data = model.toJson()..remove('id'); // AUTOINCREMENT

    return db.insert(_table, data, conflictAlgorithm: ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateFilePath({
    required String uuid,
    required String path,
    String? hash,
    int? size,
  }) async {
    final db = await _db.database;

    final values = <String, Object?>{'file_path': path};

    if (hash != null) values['file_hash'] = hash;
    if (size != null) values['file_size'] = size;

    await db.update(_table, values, where: 'uuid = ?', whereArgs: [uuid]);
  }
}
