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
    try {
      if (!_googleDriveService.isSignedIn) {
        final signedIn = await _googleDriveService.signIn();
        if (!signedIn) {
          return Left(Failure.unexpected('Google Sign-In failed or cancelled'));
        }
      }

      final backups = await _googleDriveService.listBackups();
      return Right(backups);
    } on Exception catch (e) {
      _logger.e('listCloudBackups failed', error: e);
      return Left(Failure.unexpected('Failed to list cloud backups: $e'));
    }
  }

  @override
  Future<Either<Failure, RestoreResult>> restoreFromCloudBackup({
    required String backupId,
  }) async {
    try {
      if (!_googleDriveService.isSignedIn) {
        final signedIn = await _googleDriveService.signIn();
        if (!signedIn) {
          return Left(Failure.unexpected('Google Sign-In failed or cancelled'));
        }
      }

      // Download to temp
      final tempPath = '${appDocumentsDirectory.path}/temp_restore.zip';
      final downloadedPath = await _googleDriveService.downloadBackup(
        backupId,
        tempPath,
      );

      if (downloadedPath == null) {
        return Left(Failure.unexpected('Failed to download backup from Drive'));
      }

      // Restore
      final result = await _backupService.restoreBackup(downloadedPath);

      // Clean up
      try {
        await File(downloadedPath).delete();
      } on Exception catch (_) {}

      if (result.success) {
        return Right(result);
      } else {
        return Left(
          Failure.unexpected(result.errorMessage ?? 'Restore failed'),
        );
      }
    } on Exception catch (e) {
      _logger.e('restoreFromCloudBackup failed', error: e);
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
