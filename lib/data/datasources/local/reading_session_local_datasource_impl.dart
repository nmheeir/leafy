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

  static const _table = 'reading_sessions';

  @override
  Future<void> insertSession(ReadingSessionModel session) async {
    final db = await _db.database;
    await db.insert(
      _table,
      session.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<ReadingSessionModel>> getSessionsByBookId(int bookId) async {
    final db = await _db.database;
    final result = await db.query(
      _table,
      where: 'resource_id = ?',
      whereArgs: [bookId],
      orderBy: 'start_time DESC',
    );
    return result.map((e) => ReadingSessionModel.fromJson(e)).toList();
  }

  @override
  Future<List<ReadingSessionModel>> getAllSessions() async {
    final db = await _db.database;
    final result = await db.query(_table, orderBy: 'start_time DESC');
    return result.map((e) => ReadingSessionModel.fromJson(e)).toList();
  }

  @override
  Future<void> deleteSessionsByBookId(int bookId) async {
    final db = await _db.database;
    await db.delete(_table, where: 'resource_id = ?', whereArgs: [bookId]);
  }
}
