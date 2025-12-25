class DbConstants {
  static const dbName = 'Books.db';
  static const dbVersion = 2;

  static const createBooksTable = '''
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
      date_added TEXT,
      date_modified TEXT
    )
  ''';

  static const createEpubCacheTable = '''
    CREATE TABLE epub_cache (
      id TEXT PRIMARY KEY,
      url TEXT,
      title TEXT,
      lastReadCfi TEXT,
      progress REAL
    )
  ''';

  static const migrationV1toV2 = [
    createEpubCacheTable,
  ];
}
