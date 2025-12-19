import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  late final Future<Database> db = _createDatabase();

  Future<Database> _createDatabase() async {
    final docDirectory = await getApplicationDocumentsDirectory();
    final path = join(docDirectory.path, "Books.db");

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE booksTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            subtitle TEXT,
            author TEXT,
            description TEXT,
            book_type TEXT,
            status INTEGER,
            rating INTEGER,
            favorite INTEGER,
            deleted INTEGER,
            start_date TEXT,
            finish_date TEXT,
            pages INTEGER,
            publication_year INTEGER,
            isbn TEXT,
            olid TEXT,
            tags TEXT,
            my_review TEXT,
            notes TEXT,
            has_cover INTEGER DEFAULT 0,
            blur_hash TEXT,
            reading_time INTEGER,
            readings TEXT,
            date_added TEXT DEFAULT '${DateTime.now().toIso8601String()}',
            date_modified TEXT DEFAULT '${DateTime.now().toIso8601String()}'
          )
        """);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (newVersion > oldVersion) {
          var batch = db.batch();

          switch (oldVersion) {
            case 1:
              _updateDatabaseV1toLatest(batch);
              break;
          }

          await batch.commit();
        }
      },
    );
  }

  void _executeBatch(Batch batch, List<String> scripts) {
    for (var script in scripts) {
      batch.execute(script);
    }
  }

  void _updateDatabaseV1toLatest(Batch batch) {
    _executeBatch(batch, migrationScriptV2);
  }

  final migrationScriptV2 = [
    """
      CREATE TABLE epub_cache (
        id TEXT PRIMARY KEY,
        url TEXT,
        title TEXT,
        lastReadCfi TEXT,
        progress REAL
      )
    """,
  ];

  Future<void> close() async {
    final database = await db;
    await database.close();
  }
}
