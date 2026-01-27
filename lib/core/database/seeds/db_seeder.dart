// ignore_for_file: avoid_print

import 'dart:math';

import 'package:faker/faker.dart';
import 'package:sqflite/sqflite.dart';

class DbSeeder {
  final Database db;
  final Faker faker = Faker();
  final Random random = Random();

  DbSeeder(this.db);

  /// Main method to seed all data.
  /// [count] is the number of books to generate.
  Future<void> seed({int count = 20}) async {
    await _clearAllTables();
    await _seedBooksAndResources(count);
    print('Seed complete: $count books and related derived data inserted.');
  }

  /// Deletes all data from tables in reverse dependency order.
  Future<void> _clearAllTables() async {
    final batch = db.batch();
    // Child tables first
    batch.delete('book_marks');
    batch.delete('reader_progress');
    batch.delete('reading_sessions');
    batch.delete('epub_translations');
    batch.delete('epub_summary');
    // Parent tables
    batch.delete('book_resources');
    batch.delete('books');
    await batch.commit(noResult: true);
  }

  Future<void> _seedBooksAndResources(int count) async {
    for (int i = 0; i < count; i++) {
      // 1. Insert Book
      final bookId = await _insertBook();

      // 2. Insert Resource (1-2 per book)
      final resourceCount = 1 + random.nextInt(2); // 1 or 2
      for (int r = 0; r < resourceCount; r++) {
        final resourceId = await _insertResource(bookId);

        // 3. Generate related data for this resource
        await _seedReadingSessions(resourceId);
        await _seedReaderProgress(resourceId);
        await _seedBookMarks(resourceId);

        // Sometimes seed epub extras
        if (random.nextBool()) {
          // We need a file hash for these, let's just make one up or use the resource's if we had it handy
          // Re-fetching or just passing a mock hash is fine.
          // In _insertResource we generated a fake hash (not stored in var).
          // Let's generate a hash to pass down.
          final fileHash = faker.guid.guid();
          // Update resource with this hash to be consistent (optional but good)
          await db.update(
            'book_resources',
            {'file_hash': fileHash},
            where: 'id = ?',
            whereArgs: [resourceId],
          );

          await _seedEpubExtras(fileHash);
        }
      }
    }
  }

  Future<int> _insertBook() async {
    final title = faker.lorem.sentence();
    // 30% chance of having a cover
    final hasCover = random.nextBool() && random.nextBool() ? 1 : 0;

    final bookData = {
      'title': title.substring(0, min(title.length, 50)), // Trim if too long
      'subtitle': random.nextBool() ? faker.lorem.sentence() : null,
      'author': faker.person.name(),
      'description': faker.lorem.sentences(3).join('\n'),
      'book_format': [
        'paperback',
        'hardcover',
        'audiobook',
        'ebook',
      ][random.nextInt(4)],
      'status': [
        'finished',
        'inProgress',
        'forLater',
        'unfinished',
      ][random.nextInt(4)], // Map to strings expected by BookModel
      'rating': 1 + random.nextInt(5), // 1-5
      'favorite': random.nextBool() ? 1 : 0,
      'deleted': 0,
      'start_date': random.nextBool()
          ? DateTime.now()
                .subtract(Duration(days: random.nextInt(365)))
                .toIso8601String()
          : null,
      'finish_date': random.nextBool()
          ? DateTime.now().toIso8601String()
          : null,
      'pages': 100 + random.nextInt(900),
      'publication_year': 1900 + random.nextInt(124),
      'has_cover': hasCover,
      'date_added': DateTime.now().toIso8601String(),
      'date_modified': DateTime.now().toIso8601String(),
    };

    return await db.insert('books', bookData);
  }

  Future<int> _insertResource(int bookId) async {
    final format = ['epub', 'pdf'][random.nextInt(2)];
    final storageType = ['local', 'remote'][random.nextInt(2)];

    final resourceData = {
      'uuid': faker.guid.guid(),
      'book_id': bookId,
      'format': format,
      'storage_type': storageType,
      'url': storageType == 'remote' ? faker.internet.httpsUrl() : null,
      'file_path': storageType == 'local'
          ? '/storage/emulated/0/Books/${faker.lorem.word()}.$format'
          : null,
      'file_hash': faker.guid
          .guid(), // Placeholder, updated later if used for epub extras
      'file_size': 1000000 + random.nextInt(5000000), // 1MB - 6MB
      'created_at': DateTime.now().millisecondsSinceEpoch,
    };

    return await db.insert('book_resources', resourceData);
  }

  Future<void> _seedReadingSessions(int resourceId) async {
    // Generate 0-10 sessions
    final sessionCount = random.nextInt(11);
    if (sessionCount == 0) return;

    final batch = db.batch();
    for (int i = 0; i < sessionCount; i++) {
      final duration = 5 + random.nextInt(60); // 5-65 mins
      final endTime = DateTime.now()
          .subtract(Duration(days: random.nextInt(30)))
          .subtract(Duration(minutes: random.nextInt(1000)));
      final startTime = endTime.subtract(Duration(minutes: duration));

      batch.insert('reading_sessions', {
        'id': faker.guid.guid(),
        'resource_id': resourceId,
        'start_time': startTime.millisecondsSinceEpoch,
        'end_time': endTime.millisecondsSinceEpoch,
        'duration_ms': duration * 60 * 1000,
        'chapter_index': random.nextInt(20),
        'start_locator': 'loc_${random.nextInt(1000)}',
        'end_locator': 'loc_${random.nextInt(1000) + 1000}',
      });
    }
    await batch.commit(noResult: true);
  }

  Future<void> _seedReaderProgress(int resourceId) async {
    // 50% chance to have progress
    if (random.nextBool()) return;

    await db.insert('reader_progress', {
      'resource_id': resourceId,
      'locator': 'epubcfi(/6/${random.nextInt(100)}!/4/2/1:0)',
      'progress_pct': random.nextDouble(), // 0.0 - 1.0
      'last_read_at': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<void> _seedBookMarks(int resourceId) async {
    // 0-5 bookmarks
    final count = random.nextInt(6);
    if (count == 0) return;

    final batch = db.batch();
    for (int i = 0; i < count; i++) {
      batch.insert('book_marks', {
        'resource_id': resourceId,
        'page_index': random.nextInt(500),
        'color': 0xFFFF0000 + random.nextInt(0xFFFFFF),
        'text': faker.lorem.sentence(),
        'created_at': DateTime.now().millisecondsSinceEpoch,
      });
    }
    await batch.commit(noResult: true);
  }

  Future<void> _seedEpubExtras(String fileHash) async {
    // Translation
    if (random.nextBool()) {
      await db.insert('epub_translations', {
        'file_hash': fileHash,
        'chapter_index': 1,
        'target_lang': 'vi',
        'translated_content':
            '{"paragraphs": ["Xin chào", "Đây là bản dịch mẫu"]}',
        'last_updated': DateTime.now().millisecondsSinceEpoch,
      });
    }

    // Summary
    if (random.nextBool()) {
      await db.insert('epub_summary', {
        'file_hash': fileHash,
        'chapter_index': 1,
        'summary_content':
            '{"points": ["Nội dung chính 1", "Nội dung chính 2"]}',
        'last_updated': DateTime.now().millisecondsSinceEpoch,
      });
    }
  }
}
