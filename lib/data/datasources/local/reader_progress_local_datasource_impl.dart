import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/datasources/local/reader_progress_local_datasource.dart';
import 'package:leafy/data/models/reader_progress.dart/reader_progress_model.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ReaderProgressLocalDatasource)
class ReaderProgressLocalDatasourceImpl
    implements ReaderProgressLocalDatasource {
  final DatabaseService _db;

  ReaderProgressLocalDatasourceImpl(this._db);

  static const _table = 'reader_progress';

  @override
  Future<void> deleteByResourceId(int resourceId) async {
    final db = await _db.database;

    await db.delete(_table, where: 'resource_id = ?', whereArgs: [resourceId]);
  }

  @override
  Future<void> upsert(ReaderProgressModel model) async {
    final db = await _db.database;

    await db.insert(
      _table,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
