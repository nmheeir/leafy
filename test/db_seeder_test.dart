import 'package:flutter_test/flutter_test.dart';
import 'package:leafy/core/database/db_constants.dart';
import 'package:leafy/core/database/seeds/db_seeder.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Setup sqflite_common_ffi for testing on desktop/CI
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;

  setUp(() async {
    db = await openDatabase(
      inMemoryDatabasePath,
      version: 1,
      onCreate: (db, version) async {
        // Create all tables manually for the test context
        await db.execute(DbConstants.createBooksTable);
        await db.execute(
          DbConstants.createBookResoucesTable,
        ); // Typo in constant name maintained
        await db.execute(DbConstants.createReadingSessionsTable);
        await db.execute(DbConstants.createReaderProgressTable);
        await db.execute(DbConstants.createBookMarksTable);
        await db.execute(DbConstants.createEpubTranslationsTable);
        await db.execute(DbConstants.createEpubSummaryTable);
      },
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('DbSeeder populates tables with data', () async {
    final seeder = DbSeeder(db);

    // Seed 10 books
    await seeder.seed(count: 10);

    // Verify Books
    final books = await db.query('books');
    expect(books.length, 10);
    expect(books.first['title'], isNotNull);

    // Verify Resources (Each book has 1-2 resources)
    final resources = await db.query('book_resources');
    expect(resources.length, greaterThanOrEqualTo(10));

    // Check FK relationship
    final firstBookId = books.first['id'] as int;
    final resourcesForFirstBook = await db.query(
      'book_resources',
      where: 'book_id = ?',
      whereArgs: [firstBookId],
    );
    expect(resourcesForFirstBook, isNotEmpty);

    // Verify Sessions (Random generation, but likely > 0 across 10 books)
    // Note: It's possible to have 0 sessions, but unlikely with 10 books x (1-2 resources) x (0-10 chances).
    // If it fails, we can adjust the test or seeder probability.
    // For specific test determinism, we could mock Random, but here we just check if tables are accessible.

    // Just ensure no crash and queryability
    final sessions = await db.query('reading_sessions');
    print('Generated ${sessions.length} reading sessions');

    final progress = await db.query('reader_progress');
    print('Generated ${progress.length} progress entries');
  });
}
