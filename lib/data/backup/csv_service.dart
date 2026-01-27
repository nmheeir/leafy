import 'dart:io';

import 'package:csv/csv.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/domain/backup/entities/backup_result.dart';
import 'package:logger/logger.dart';

/// Service để export/import CSV
@LazySingleton()
class CsvService {
  final DatabaseService _databaseService;
  final Logger _logger = Logger();

  CsvService(this._databaseService);

  /// Export books table sang CSV
  Future<CsvExportResult> exportBooksToCsv(String destinationPath) async {
    try {
      final db = await _databaseService.database;
      final books = await db.query('books');

      if (books.isEmpty) {
        return CsvExportResult.failure('No books to export');
      }

      // CSV headers
      final headers = [
        'id',
        'title',
        'subtitle',
        'author',
        'description',
        'book_format',
        'status',
        'rating',
        'favorite',
        'deleted',
        'start_date',
        'finish_date',
        'pages',
        'publication_year',
        'tags',
        'my_review',
        'notes',
        'has_cover',
        'blur_hash',
        'date_added',
        'date_modified',
      ];

      // Convert books to rows
      final rows = <List<dynamic>>[headers];
      for (final book in books) {
        rows.add([
          book['id'],
          book['title'] ?? '',
          book['subtitle'] ?? '',
          book['author'] ?? '',
          book['description'] ?? '',
          book['book_format'] ?? '',
          book['status'] ?? 0,
          book['rating'] ?? 0,
          book['favorite'] ?? 0,
          book['deleted'] ?? 0,
          book['start_date'] ?? '',
          book['finish_date'] ?? '',
          book['pages'] ?? 0,
          book['publication_year'] ?? 0,
          book['tags'] ?? '',
          book['my_review'] ?? '',
          book['notes'] ?? '',
          book['has_cover'] ?? 0,
          book['blur_hash'] ?? '',
          book['date_added'] ?? '',
          book['date_modified'] ?? '',
        ]);
      }

      // Convert to CSV string
      const converter = ListToCsvConverter();
      final csvString = converter.convert(rows);

      // Write to file
      final timestamp = DateTime.now()
          .toIso8601String()
          .replaceAll(':', '')
          .replaceAll('-', '')
          .split('.')
          .first;
      final fileName = 'leafy_books_$timestamp.csv';
      final filePath = '$destinationPath/$fileName';
      final outputFile = File(filePath);
      await outputFile.writeAsString(csvString);

      _logger.i('CSV exported: $filePath (${books.length} books)');

      return CsvExportResult.success(
        filePath: filePath,
        recordsExported: books.length,
      );
    } on Exception catch (e, st) {
      _logger.e('CSV export failed', error: e, stackTrace: st);
      return CsvExportResult.failure('Export failed: $e');
    }
  }

  /// Import books từ Leafy CSV
  Future<RestoreResult> importFromLeafyCsv(String csvFilePath) async {
    try {
      final file = File(csvFilePath);
      if (!file.existsSync()) {
        return RestoreResult.failure('CSV file not found');
      }

      final csvString = await file.readAsString();
      const converter = CsvToListConverter();
      final rows = converter.convert(csvString);

      if (rows.isEmpty) {
        return RestoreResult.failure('CSV file is empty');
      }

      // Skip header row
      final dataRows = rows.skip(1).toList();
      if (dataRows.isEmpty) {
        return RestoreResult.failure('No data in CSV file');
      }

      final db = await _databaseService.database;
      var imported = 0;

      for (final row in dataRows) {
        if (row.length < 21) continue;

        try {
          await db.insert('books', {
            'title': row[1]?.toString() ?? '',
            'subtitle': row[2]?.toString(),
            'author': row[3]?.toString() ?? '',
            'description': row[4]?.toString(),
            'book_format': row[5]?.toString(),
            'status': _parseInt(row[6]),
            'rating': _parseInt(row[7]),
            'favorite': _parseInt(row[8]),
            'deleted': _parseInt(row[9]),
            'start_date': row[10]?.toString(),
            'finish_date': row[11]?.toString(),
            'pages': _parseInt(row[12]),
            'publication_year': _parseInt(row[13]),
            'tags': row[14]?.toString(),
            'my_review': row[15]?.toString(),
            'notes': row[16]?.toString(),
            'has_cover': _parseInt(row[17]),
            'blur_hash': row[18]?.toString(),
            'date_added':
                row[19]?.toString() ?? DateTime.now().toIso8601String(),
            'date_modified':
                row[20]?.toString() ?? DateTime.now().toIso8601String(),
          });
          imported++;
        } on Exception catch (e) {
          _logger.w('Failed to import row: $e');
        }
      }

      _logger.i('CSV imported: $imported books');

      return RestoreResult.success(booksRestored: imported, coversRestored: 0);
    } on Exception catch (e, st) {
      _logger.e('CSV import failed', error: e, stackTrace: st);
      return RestoreResult.failure('Import failed: $e');
    }
  }

  int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? 0;
  }
}
