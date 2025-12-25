import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/database/db_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton()
class DatabaseService {
  Database? _database;
  final Completer<Database> _openCompleter = Completer();

  Future<Database> get database async {
    if (_database != null) return _database!;

    if (!_openCompleter.isCompleted) {
      _initDatabase()
          .then((db) {
            _database = db;
            _openCompleter.complete(db);
          })
          .catchError((e, s) {
            _openCompleter.completeError(e, s);
          });
    }

    return _openCompleter.future;
  }

  Future<Database> _initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, DbConstants.dbName);

    return openDatabase(
      path,
      version: DbConstants.dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(DbConstants.createBooksTable);

    if (version >= 2) {
      for (final script in DbConstants.migrationV1toV2) {
        await db.execute(script);
      }
    }
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    final batch = db.batch();

    if (oldVersion < 2) {
      for (final script in DbConstants.migrationV1toV2) {
        batch.execute(script);
      }
    }

    await batch.commit(noResult: true);
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
