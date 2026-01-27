import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/backup/entities/backup_result.dart';

/// Repository interface cho backup/restore operations
abstract class BackupRepository {
  /// Tạo local backup (ZIP file)
  Future<Either<Failure, BackupResult>> createLocalBackup({
    required String destinationPath,
  });

  /// Restore từ local backup file
  Future<Either<Failure, RestoreResult>> restoreFromLocalBackup({
    required String backupFilePath,
  });

  /// Export database sang CSV file
  Future<Either<Failure, CsvExportResult>> exportToCsv({
    required String destinationPath,
  });

  /// Import từ CSV file (Leafy format)
  Future<Either<Failure, RestoreResult>> importFromCsv({
    required String csvFilePath,
  });

  /// Upload backup lên Google Drive
  Future<Either<Failure, BackupResult>> createCloudBackup();

  /// Lấy danh sách backup trên Google Drive
  Future<Either<Failure, List<CloudBackupInfo>>> listCloudBackups();

  /// Restore từ Google Drive
  Future<Either<Failure, RestoreResult>> restoreFromCloudBackup({
    required String backupId,
  });

  /// Xóa backup trên cloud
  Future<Either<Failure, Unit>> deleteCloudBackup({required String backupId});
}
