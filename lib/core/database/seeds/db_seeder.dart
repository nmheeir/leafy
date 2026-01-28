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
  Future<void> seed({int count = 200}) async {
    await _clearAllTables();

    // Seed tags first (referenced by book_tags)
    await _seedTags();

    // Seed books and resources
    await _seedBooksAndResources(count);

    // Assign random tags to books
    await _assignRandomTagsToBooks();

    print('Seed complete: $count books, tags, and related data inserted.');
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
    batch.delete('book_tags'); // Junction table
    // Parent tables
    batch.delete('book_resources');
    batch.delete('books');
    batch.delete('tags'); // Tag master table
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
    final sessionCount = 100 + random.nextInt(21);
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

  /// Seeds predefined tags (system + user examples)
  Future<void> _seedTags() async {
    final now = DateTime.now().toIso8601String();
    final batch = db.batch();

    // System tags (generated automatically)
    final systemTags = [
      {
        'name': 'Recently Read',
        'color': 0xFF2196F3, // Blue
        'icon': '📖',
        'priority': 100,
        'is_system': 1,
        'category': 'status',
        'deleted': 0,
        'created_at': now,
        'updated_at': now,
      },
      {
        'name': 'Favorite',
        'color': 0xFFE91E63, // Pink
        'icon': '❤️',
        'priority': 99,
        'is_system': 1,
        'category': 'status',
        'deleted': 0,
        'created_at': now,
        'updated_at': now,
      },
      {
        'name': 'Finished',
        'color': 0xFF4CAF50, // Green
        'icon': '✓',
        'priority': 98,
        'is_system': 1,
        'category': 'status',
        'deleted': 0,
        'created_at': now,
        'updated_at': now,
      },
    ];

    // User tags (thể loại phổ biến)
    final userTags = [
      // Fiction genres
      {
        'name': 'Fiction',
        'color': 0xFF9C27B0, // Purple (but acceptable since it's data)
        'icon': '📚',
        'priority': 10,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Science Fiction',
        'color': 0xFF00BCD4, // Cyan
        'icon': '🚀',
        'priority': 9,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Fantasy',
        'color': 0xFFFF9800, // Orange
        'icon': '🐉',
        'priority': 9,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Mystery',
        'color': 0xFF607D8B, // Blue Grey
        'icon': '🔍',
        'priority': 8,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Romance',
        'color': 0xFFFF4081, // Pink Accent
        'icon': '💕',
        'priority': 8,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Thriller',
        'color': 0xFFD32F2F, // Red
        'icon': '🔪',
        'priority': 8,
        'is_system': 0,
        'category': 'genre',
      },

      // Non-fiction genres
      {
        'name': 'Non-Fiction',
        'color': 0xFF4CAF50, // Green
        'icon': '📖',
        'priority': 10,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Biography',
        'color': 0xFF795548, // Brown
        'icon': '👤',
        'priority': 7,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'History',
        'color': 0xFF8D6E63, // Brown lighten
        'icon': '📜',
        'priority': 7,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Self-Help',
        'color': 0xFFFFC107, // Amber
        'icon': '💪',
        'priority': 8,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Business',
        'color': 0xFF3F51B5, // Indigo
        'icon': '💼',
        'priority': 7,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Philosophy',
        'color': 0xFF673AB7, // Deep Purple
        'icon': '🤔',
        'priority': 6,
        'is_system': 0,
        'category': 'genre',
      },
      {
        'name': 'Science',
        'color': 0xFF009688, // Teal
        'icon': '🔬',
        'priority': 7,
        'is_system': 0,
        'category': 'genre',
      },

      // Special categories
      {
        'name': 'Classic',
        'color': 0xFF5D4037, // Brown Darken
        'icon': '🎩',
        'priority': 6,
        'is_system': 0,
        'category': 'special',
      },
      {
        'name': 'Educational',
        'color': 0xFF1976D2, // Blue Darken
        'icon': '🎓',
        'priority': 5,
        'is_system': 0,
        'category': 'special',
      },
      {
        'name': 'Reference',
        'color': 0xFF455A64, // Blue Grey Darken
        'icon': '📋',
        'priority': 5,
        'is_system': 0,
        'category': 'special',
      },

      // Vietnamese specific
      {
        'name': 'Kinh tế',
        'color': 0xFF388E3C, // Green Darken
        'icon': '📈',
        'priority': 6,
        'is_system': 0,
        'category': 'vietnamese',
      },
      {
        'name': 'Tiểu thuyết',
        'color': 0xFFE64A19, // Deep Orange
        'icon': '📕',
        'priority': 6,
        'is_system': 0,
        'category': 'vietnamese',
      },
      {
        'name': 'Kỹ năng sống',
        'color': 0xFFF57C00, // Orange Darken
        'icon': '✨',
        'priority': 6,
        'is_system': 0,
        'category': 'vietnamese',
      },
    ];

    // Insert system tags
    for (final tag in systemTags) {
      batch.insert('tags', tag);
    }

    // Insert user tags
    for (final tag in userTags) {
      batch.insert('tags', {
        ...tag,
        'deleted': 0,
        'created_at': now,
        'updated_at': now,
      });
    }

    await batch.commit(noResult: true);
    print('Seeded ${systemTags.length + userTags.length} tags.');
  }

  /// Assigns 1-5 random tags to each book
  Future<void> _assignRandomTagsToBooks() async {
    // Get all book IDs
    final books = await db.query('books', columns: ['id']);

    // Get all tag IDs (excluding system tags for random assignment)
    final tags = await db.query(
      'tags',
      columns: ['id'],
      where: 'is_system = ? AND deleted = ?',
      whereArgs: [0, 0],
    );

    if (tags.isEmpty) {
      print('No user tags available for assignment.');
      return;
    }

    final batch = db.batch();
    final now = DateTime.now().toIso8601String();
    int relationshipCount = 0;

    for (final book in books) {
      final bookId = book['id'] as int;

      // Assign 1-5 random tags per book
      final tagCount = 1 + random.nextInt(5);
      final selectedTags = <int>{};

      // Randomly select unique tags
      while (selectedTags.length < tagCount &&
          selectedTags.length < tags.length) {
        final randomTag = tags[random.nextInt(tags.length)];
        selectedTags.add(randomTag['id'] as int);
      }

      // Insert book_tags relationships
      int orderIndex = 0;
      for (final tagId in selectedTags) {
        batch.insert('book_tags', {
          'book_id': bookId,
          'tag_id': tagId,
          'order_index': orderIndex++,
          'created_at': now,
        });
        relationshipCount++;
      }
    }

    await batch.commit(noResult: true);
    print(
      'Assigned $relationshipCount tag relationships to ${books.length} books.',
    );
  }
}
