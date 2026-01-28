import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/datasources/local/reading_session_local_datasource.dart';
import 'package:leafy/data/models/reading_session/reading_session_model.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ReadingSessionLocalDatasource)
class ReadingSessionLocalDatasourceImpl
    implements ReadingSessionLocalDatasource {
  final DatabaseService _db;

  ReadingSessionLocalDatasourceImpl(this._db);

  static const _sessionsTable = 'reading_sessions';
  static const _resourcesTable = 'book_resources';

  @override
  Future<void> insertSession(ReadingSessionModel session) async {
    final db = await _db.database;
    await db.insert(
      _sessionsTable,
      session.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<ReadingSessionModel>> getSessionsByBookId(int bookId) async {
    final db = await _db.database;
    // Join with book_resources to get sessions by book_id
    final result = await db.rawQuery(
      '''
      SELECT rs.* FROM $_sessionsTable rs
      INNER JOIN $_resourcesTable br ON rs.resource_id = br.id
      WHERE br.book_id = ?
      ORDER BY rs.start_time DESC
    ''',
      [bookId],
    );
    return result.map((e) => ReadingSessionModel.fromJson(e)).toList();
  }

  @override
  Future<List<ReadingSessionModel>> getAllSessions() async {
    final db = await _db.database;
    final result = await db.query(_sessionsTable, orderBy: 'start_time DESC');
    return result.map((e) => ReadingSessionModel.fromJson(e)).toList();
  }

  @override
  Future<void> deleteSessionsByBookId(int bookId) async {
    final db = await _db.database;
    // Delete via subquery through book_resources
    await db.rawDelete(
      '''
      DELETE FROM $_sessionsTable
      WHERE resource_id IN (
        SELECT id FROM $_resourcesTable WHERE book_id = ?
      )
    ''',
      [bookId],
    );
  }

  @override
  Future<int> getTotalDurationByBookId(int bookId) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT COALESCE(SUM(rs.duration_ms), 0) as total
      FROM $_sessionsTable rs
      INNER JOIN $_resourcesTable br ON rs.resource_id = br.id
      WHERE br.book_id = ?
    ''',
      [bookId],
    );
    return (result.first['total'] as int?) ?? 0;
  }

  @override
  Future<int> getSessionCountByBookId(int bookId) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT COUNT(*) as count
      FROM $_sessionsTable rs
      INNER JOIN $_resourcesTable br ON rs.resource_id = br.id
      WHERE br.book_id = ?
    ''',
      [bookId],
    );
    return (result.first['count'] as int?) ?? 0;
  }

  @override
  Future<ReadingSessionModel?> getLastSessionByBookId(int bookId) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT rs.* FROM $_sessionsTable rs
      INNER JOIN $_resourcesTable br ON rs.resource_id = br.id
      WHERE br.book_id = ?
      ORDER BY rs.end_time DESC
      LIMIT 1
    ''',
      [bookId],
    );
    if (result.isEmpty) return null;
    return ReadingSessionModel.fromJson(result.first);
  }

  @override
  Future<List<Map<String, dynamic>>> getSessionsWithResourceByBookId(
    int bookId,
  ) async {
    final db = await _db.database;
    // Get sessions with resource format info
    final result = await db.rawQuery(
      '''
      SELECT 
        rs.*,
        br.format as resource_format,
        br.id as resource_id
      FROM $_sessionsTable rs
      INNER JOIN $_resourcesTable br ON rs.resource_id = br.id
      WHERE br.book_id = ?
      ORDER BY rs.start_time DESC
    ''',
      [bookId],
    );
    return result;
  }
}
