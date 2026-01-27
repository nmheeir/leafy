import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/database/db_constants.dart';
import 'package:leafy/core/utils/app_globals.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/domain/backup/entities/backup_result.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Service để tạo và restore backup
@LazySingleton()
class BackupService {
  final DatabaseService _databaseService;
  final Logger _logger = Logger();

  BackupService(this._databaseService);

  /// Tạo backup ZIP file
  Future<BackupResult> createBackup(String destinationPath) async {
    try {
      final archive = Archive();

      // Get database data
      final db = await _databaseService.database;

      // Export all tables
      final tables = [
        'books',
        'book_resources',
        'reader_progress',
        'reading_sessions',
        'epub_translations',
        'epub_summary',
        'book_marks',
      ];

      for (final table in tables) {
        try {
          final data = await db.query(table);
          final jsonString = jsonEncode(data);
          final bytes = utf8.encode(jsonString);
          archive.addFile(
            ArchiveFile('database/$table.json', bytes.length, bytes),
          );
        } on Exception catch (e) {
          _logger.w('Table $table not found or error: $e');
        }
      }

      // Get all cover images
      final coversDir = Directory(appDocumentsDirectory.path);
      var coverCount = 0;

      if (coversDir.existsSync()) {
        final coverFiles = coversDir.listSync().whereType<File>().where(
          (f) => f.path.endsWith('.jpg'),
        );

        for (final coverFile in coverFiles) {
          final fileName = coverFile.path.split('/').last;
          final bytes = await coverFile.readAsBytes();
          archive.addFile(ArchiveFile('covers/$fileName', bytes.length, bytes));
          coverCount++;
        }
      }

      // Get book count
      final booksCount = (await db.rawQuery(
        'SELECT COUNT(*) as count FROM books',
      )).first;
      final totalBooks = (booksCount['count'] as int?) ?? 0;

      // Create manifest
      final packageInfo = await PackageInfo.fromPlatform();
      final metadata = BackupMetadata(
        version: '1.0',
        appVersion: packageInfo.version,
        createdAt: DateTime.now(),
        dbVersion: DbConstants.dbVersion,
        totalBooks: totalBooks,
        totalCovers: coverCount,
      );

      final manifestJson = jsonEncode(metadata.toJson());
      final manifestBytes = utf8.encode(manifestJson);
      archive.addFile(
        ArchiveFile('manifest.json', manifestBytes.length, manifestBytes),
      );

      // Encode to ZIP
      final zipData = ZipEncoder().encode(archive);

      // Write to file
      final timestamp = DateTime.now()
          .toIso8601String()
          .replaceAll(':', '')
          .replaceAll('-', '')
          .split('.')
          .first;
      final fileName = 'leafy_backup_$timestamp.zip';
      final filePath = '$destinationPath/$fileName';
      final outputFile = File(filePath);
      await outputFile.writeAsBytes(zipData);

      _logger.i(
        'Backup created: $filePath ($totalBooks books, $coverCount covers)',
      );

      return BackupResult.success(filePath: filePath, metadata: metadata);
    } on Exception catch (e, st) {
      _logger.e('Backup failed', error: e, stackTrace: st);
      return BackupResult.failure('Backup failed: $e');
    }
  }

  /// Restore từ backup ZIP file
  Future<RestoreResult> restoreBackup(String backupFilePath) async {
    try {
      final file = File(backupFilePath);
      if (!file.existsSync()) {
        return RestoreResult.failure('Backup file not found');
      }

      final bytes = await file.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      // Validate manifest
      final manifestFile = archive.findFile('manifest.json');
      if (manifestFile == null) {
        return RestoreResult.failure('Invalid backup: manifest.json not found');
      }

      final manifestJson = utf8.decode(manifestFile.content as List<int>);
      final manifest = BackupMetadata.fromJson(
        jsonDecode(manifestJson) as Map<String, dynamic>,
      );

      _logger.i('Restoring backup: ${manifest.totalBooks} books');

      final db = await _databaseService.database;

      // Clear existing data
      await _clearAllData(db);

      var booksRestored = 0;
      var coversRestored = 0;

      // Restore database tables
      for (final file in archive.files) {
        if (file.isFile && file.name.startsWith('database/')) {
          final tableName = file.name
              .replaceFirst('database/', '')
              .replaceFirst('.json', '');
          try {
            final jsonString = utf8.decode(file.content as List<int>);
            final data = (jsonDecode(jsonString) as List)
                .cast<Map<String, dynamic>>();

            for (final row in data) {
              await db.insert(tableName, row);
            }

            if (tableName == 'books') {
              booksRestored = data.length;
            }
          } on Exception catch (e) {
            _logger.w('Failed to restore table $tableName: $e');
          }
        }

        // Restore cover images
        if (file.isFile && file.name.startsWith('covers/')) {
          final fileName = file.name.replaceFirst('covers/', '');
          final coverPath = '${appDocumentsDirectory.path}/$fileName';
          final coverFile = File(coverPath);
          await coverFile.writeAsBytes(file.content as List<int>);
          coversRestored++;
        }
      }

      _logger.i(
        'Restore complete: $booksRestored books, $coversRestored covers',
      );

      return RestoreResult.success(
        booksRestored: booksRestored,
        coversRestored: coversRestored,
      );
    } on Exception catch (e, st) {
      _logger.e('Restore failed', error: e, stackTrace: st);
      return RestoreResult.failure('Restore failed: $e');
    }
  }

  /// Validate backup file trước khi restore
  Future<BackupMetadata?> validateBackup(String backupFilePath) async {
    try {
      final file = File(backupFilePath);
      if (!file.existsSync()) return null;

      final bytes = await file.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      final manifestFile = archive.findFile('manifest.json');
      if (manifestFile == null) return null;

      final manifestJson = utf8.decode(manifestFile.content as List<int>);
      return BackupMetadata.fromJson(
        jsonDecode(manifestJson) as Map<String, dynamic>,
      );
    } on Exception catch (e) {
      _logger.e('Backup validation failed', error: e);
      return null;
    }
  }

  Future<void> _clearAllData(dynamic db) async {
    final tables = [
      'book_marks',
      'epub_summary',
      'epub_translations',
      'reading_sessions',
      'reader_progress',
      'book_resources',
      'books',
    ];

    for (final table in tables) {
      try {
        await db.delete(table);
      } on Exception catch (e) {
        _logger.w('Failed to clear table $table: $e');
      }
    }

    // Clear cover images
    final coversDir = Directory(appDocumentsDirectory.path);
    if (coversDir.existsSync()) {
      final coverFiles = coversDir.listSync().whereType<File>().where(
        (f) => f.path.endsWith('.jpg'),
      );

      for (final coverFile in coverFiles) {
        try {
          await coverFile.delete();
        } on Exception catch (e) {
          _logger.w('Failed to delete cover: $e');
        }
      }
    }
  }
}
