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
    await db.execute(DbConstants.createBookResoucesTable);
    await db.execute(DbConstants.createReaderProgressTable);
    await db.execute(DbConstants.createReadingSessionsTable);
    await db.execute(DbConstants.createEpubTranslationsTable);
    await db.execute(DbConstants.createEpubSummaryTable);

    await db.execute(DbConstants.createEpubTranslationIndex);
    await db.execute(DbConstants.createSessionTimeIndex);
    await db.execute(DbConstants.createEpubSummaryIndex);

    if (version >= 2) {
      for (final script in DbConstants.migrateV1toV2) {
        await db.execute(script);
      }
    }

    if (version >= 3) {
      for (final script in DbConstants.migrateV2toV3) {
        await db.execute(script);
      }
    }
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    final batch = db.batch();

    if (oldVersion < 2) {
      for (final script in DbConstants.migrateV1toV2) {
        batch.execute(script);
      }
    }

    if (oldVersion < 3) {
      for (final script in DbConstants.migrateV2toV3) {
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
