import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/utils/app_globals.dart';
import 'package:leafy/data/backup/backup_service.dart';
import 'package:leafy/data/backup/csv_service.dart';
import 'package:leafy/data/backup/google_drive_service.dart';
import 'package:leafy/domain/backup/entities/backup_result.dart';
import 'package:leafy/domain/backup/repositories/backup_repository.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton(as: BackupRepository)
class BackupRepositoryImpl implements BackupRepository {
  final BackupService _backupService;
  final CsvService _csvService;
  final GoogleDriveService _googleDriveService;
  final Logger _logger = Logger();

  BackupRepositoryImpl(
    this._backupService,
    this._csvService,
    this._googleDriveService,
  );

  @override
  Future<Either<Failure, BackupResult>> createLocalBackup({
    required String destinationPath,
  }) async {
    try {
      final result = await _backupService.createBackup(destinationPath);
      if (result.success) {
        return Right(result);
      } else {
        return Left(Failure.unexpected(result.errorMessage ?? 'Unknown error'));
      }
    } on Exception catch (e) {
      _logger.e('createLocalBackup failed', error: e);
      return Left(Failure.unexpected('Failed to create backup: $e'));
    }
  }

  @override
  Future<Either<Failure, RestoreResult>> restoreFromLocalBackup({
    required String backupFilePath,
  }) async {
    try {
      // Validate first
      final metadata = await _backupService.validateBackup(backupFilePath);
      if (metadata == null) {
        return Left(Failure.unexpected('Invalid backup file'));
      }

      final result = await _backupService.restoreBackup(backupFilePath);
      if (result.success) {
        return Right(result);
      } else {
        return Left(Failure.unexpected(result.errorMessage ?? 'Unknown error'));
      }
    } on Exception catch (e) {
      _logger.e('restoreFromLocalBackup failed', error: e);
      return Left(Failure.unexpected('Failed to restore backup: $e'));
    }
  }

  @override
  Future<Either<Failure, CsvExportResult>> exportToCsv({
    required String destinationPath,
  }) async {
    try {
      final result = await _csvService.exportBooksToCsv(destinationPath);
      if (result.success) {
        return Right(result);
      } else {
        return Left(Failure.unexpected(result.errorMessage ?? 'Unknown error'));
      }
    } on Exception catch (e) {
      _logger.e('exportToCsv failed', error: e);
      return Left(Failure.unexpected('Failed to export CSV: $e'));
    }
  }

  @override
  Future<Either<Failure, RestoreResult>> importFromCsv({
    required String csvFilePath,
  }) async {
    try {
      final result = await _csvService.importFromLeafyCsv(csvFilePath);
      if (result.success) {
        return Right(result);
      } else {
        return Left(Failure.unexpected(result.errorMessage ?? 'Unknown error'));
      }
    } on Exception catch (e) {
      _logger.e('importFromCsv failed', error: e);
      return Left(Failure.unexpected('Failed to import CSV: $e'));
    }
  }

  @override
  Future<Either<Failure, BackupResult>> createCloudBackup() async {
    try {
      // Sign in if not already
      if (!_googleDriveService.isSignedIn) {
        final signedIn = await _googleDriveService.signIn();
        if (!signedIn) {
          return Left(Failure.unexpected('Google Sign-In failed or cancelled'));
        }
      }

      // Create local backup first
      final tempDir = await getTemporaryDirectory();
      final localResult = await _backupService.createBackup(tempDir.path);
      if (!localResult.success) {
        return Left(
          Failure.unexpected(
            localResult.errorMessage ?? 'Failed to create backup',
          ),
        );
      }

      // Upload to Drive
      final cloudResult = await _googleDriveService.uploadBackup(
        localResult.filePath!,
      );

      // Clean up temp file
      try {
        await File(localResult.filePath!).delete();
      } on Exception catch (_) {}

      if (cloudResult.success) {
        return Right(cloudResult);
      } else {
        return Left(
          Failure.unexpected(cloudResult.errorMessage ?? 'Upload failed'),
        );
      }
    } on Exception catch (e) {
      _logger.e('createCloudBackup failed', error: e);
      return Left(Failure.unexpected('Failed to create cloud backup: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CloudBackupInfo>>> listCloudBackups() async {
    _logger.d('listCloudBackups: Starting...');
    try {
      if (!_googleDriveService.isSignedIn) {
        _logger.d('listCloudBackups: Not signed in, attempting sign in...');
        final signedIn = await _googleDriveService.signIn();
        if (!signedIn) {
          _logger.e('listCloudBackups: Sign in failed');
          return Left(Failure.unexpected('Google Sign-In failed or cancelled'));
        }
        _logger.d('listCloudBackups: Sign in successful');
      }

      _logger.d('listCloudBackups: Fetching backups list...');
      final backups = await _googleDriveService.listBackups();
      _logger.i('listCloudBackups: Found ${backups.length} backups');
      return Right(backups);
    } on Exception catch (e, st) {
      _logger.e('listCloudBackups failed', error: e, stackTrace: st);
      return Left(Failure.unexpected('Failed to list cloud backups: $e'));
    }
  }

  @override
  Future<Either<Failure, RestoreResult>> restoreFromCloudBackup({
    required String backupId,
  }) async {
    _logger.d('restoreFromCloudBackup: Starting...');
    _logger.d('restoreFromCloudBackup: backupId = $backupId');

    try {
      if (!_googleDriveService.isSignedIn) {
        _logger.d(
          'restoreFromCloudBackup: Not signed in, attempting sign in...',
        );
        final signedIn = await _googleDriveService.signIn();
        if (!signedIn) {
          _logger.e('restoreFromCloudBackup: Sign in failed');
          return Left(Failure.unexpected('Google Sign-In failed or cancelled'));
        }
        _logger.d('restoreFromCloudBackup: Sign in successful');
      }

      // Download to temp
      final tempPath = '${appDocumentsDirectory.path}/temp_restore.zip';
      _logger.d('restoreFromCloudBackup: Downloading to $tempPath');

      final downloadedPath = await _googleDriveService.downloadBackup(
        backupId,
        tempPath,
      );

      if (downloadedPath == null) {
        _logger.e('restoreFromCloudBackup: Download returned null');
        return Left(Failure.unexpected('Failed to download backup from Drive'));
      }

      _logger.d('restoreFromCloudBackup: Download complete: $downloadedPath');

      // Check if file exists and size
      final downloadedFile = File(downloadedPath);
      if (downloadedFile.existsSync()) {
        final fileSize = downloadedFile.lengthSync();
        _logger.d(
          'restoreFromCloudBackup: Downloaded file size = $fileSize bytes',
        );
      } else {
        _logger.e('restoreFromCloudBackup: Downloaded file does not exist!');
        return Left(Failure.unexpected('Downloaded file not found'));
      }

      // Restore
      _logger.d('restoreFromCloudBackup: Starting restore...');
      final result = await _backupService.restoreBackup(downloadedPath);
      _logger.d('restoreFromCloudBackup: Restore result = ${result.success}');

      // Clean up
      try {
        await File(downloadedPath).delete();
        _logger.d('restoreFromCloudBackup: Temp file cleaned up');
      } on Exception catch (e) {
        _logger.w('restoreFromCloudBackup: Failed to clean up temp file: $e');
      }

      if (result.success) {
        _logger.i(
          'restoreFromCloudBackup: Success! ${result.booksRestored} books, ${result.coversRestored} covers',
        );
        return Right(result);
      } else {
        _logger.e(
          'restoreFromCloudBackup: Restore failed - ${result.errorMessage}',
        );
        return Left(
          Failure.unexpected(result.errorMessage ?? 'Restore failed'),
        );
      }
    } on Exception catch (e, st) {
      _logger.e('restoreFromCloudBackup: Exception', error: e, stackTrace: st);
      return Left(Failure.unexpected('Failed to restore from cloud: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCloudBackup({
    required String backupId,
  }) async {
    try {
      if (!_googleDriveService.isSignedIn) {
        final signedIn = await _googleDriveService.signIn();
        if (!signedIn) {
          return Left(Failure.unexpected('Google Sign-In failed or cancelled'));
        }
      }

      final success = await _googleDriveService.deleteBackup(backupId);
      if (success) {
        return const Right(unit);
      } else {
        return Left(Failure.unexpected('Failed to delete backup'));
      }
    } on Exception catch (e) {
      _logger.e('deleteCloudBackup failed', error: e);
      return Left(Failure.unexpected('Failed to delete cloud backup: $e'));
    }
  }
}
