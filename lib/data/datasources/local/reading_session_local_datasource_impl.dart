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
}
