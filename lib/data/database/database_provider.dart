import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  late final Future<Database> db = _createDatabase();

  Future<Database> _createDatabase() async {
    final docDirectory = await getApplicationDocumentsDirectory();
    final path = join(docDirectory.path, "Books.db");

    return await openDatabase(
      path,
      version: 1,
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
    );
  }

  Future<void> close() async {
    final database = await db;
    await database.close();
  }
}
