import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/services/notification_service.dart';
import 'package:leafy/domain/backup/repositories/backup_repository.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/logic/backup/backup_restore_state.dart';
import 'package:share_plus/share_plus.dart';

@Injectable()
class BackupRestoreCubit extends Cubit<BackupRestoreState> {
  final BackupRepository _backupRepository;
  final BookRepository _bookRepository;
  final NotificationService _notificationService;

  BackupRestoreCubit(
    this._backupRepository,
    this._bookRepository,
    this._notificationService,
  ) : super(const BackupRestoreState());

  /// Tạo local backup
  Future<void> createLocalBackup() async {
    emit(
      state.copyWith(
        status: BackupStatus.loading,
        message: 'Creating backup...',
      ),
    );

    // Pick folder
    final result = await FilePicker.platform.getDirectoryPath();
    if (result == null) {
      emit(
        state.copyWith(
          status: BackupStatus.initial,
          message: 'Backup cancelled',
        ),
      );
      return;
    }

    final backupResult = await _backupRepository.createLocalBackup(
      destinationPath: result,
    );

    backupResult.fold(
      (failure) {
        _notificationService.showBackupFailure(
          message: failure.message ?? 'Unknown error',
        );
        emit(
          state.copyWith(
            status: BackupStatus.failure,
            errorMessage: failure.message ?? 'Unknown error',
          ),
        );
      },
      (result) {
        final msg =
            'Backup created successfully!\n'
            '${result.metadata?.totalBooks ?? 0} books, '
            '${result.metadata?.totalCovers ?? 0} covers';
        _notificationService.showBackupSuccess(message: msg);
        emit(state.copyWith(status: BackupStatus.success, message: msg));
      },
    );
  }

  /// Restore từ local backup
  Future<void> restoreLocalBackup() async {
    emit(
      state.copyWith(
        status: BackupStatus.loading,
        message: 'Selecting backup file...',
      ),
    );

    // Pick file
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );

    if (result == null || result.files.isEmpty) {
      emit(
        state.copyWith(
          status: BackupStatus.initial,
          message: 'Restore cancelled',
        ),
      );
      return;
    }

    final filePath = result.files.first.path;
    if (filePath == null) {
      emit(
        state.copyWith(
          status: BackupStatus.failure,
          errorMessage: 'Could not access file',
        ),
      );
      return;
    }

    emit(state.copyWith(message: 'Restoring backup...'));

    final restoreResult = await _backupRepository.restoreFromLocalBackup(
      backupFilePath: filePath,
    );

    restoreResult.fold(
      (failure) => emit(
        state.copyWith(
          status: BackupStatus.failure,
          errorMessage: failure.message ?? 'Unknown error',
        ),
      ),
      (result) => emit(
        state.copyWith(
          status: BackupStatus.success,
          message:
              'Restore completed!\n'
              '${result.booksRestored} books, '
              '${result.coversRestored} covers restored',
        ),
      ),
    );
  }

  /// Tạo cloud backup (Google Drive)
  Future<void> createCloudBackup() async {
    emit(
      state.copyWith(
        status: BackupStatus.loading,
        message: 'Creating cloud backup...',
      ),
    );

    final result = await _backupRepository.createCloudBackup();

    result.fold(
      (failure) {
        _notificationService.showBackupFailure(
          message: failure.message ?? 'Unknown error',
        );
        emit(
          state.copyWith(
            status: BackupStatus.failure,
            errorMessage: failure.message ?? 'Unknown error',
          ),
        );
      },
      (result) {
        _notificationService.showBackupSuccess(
          message: 'Cloud backup created successfully!',
        );
        emit(
          state.copyWith(
            status: BackupStatus.success,
            message: 'Cloud backup created successfully!',
            isGoogleSignedIn: true,
          ),
        );
      },
    );
  }

  /// Load danh sách cloud backups
  Future<void> loadCloudBackups() async {
    emit(
      state.copyWith(
        status: BackupStatus.loading,
        message: 'Loading cloud backups...',
      ),
    );

    final result = await _backupRepository.listCloudBackups();

    result.fold(
      (failure) {
        print('loadCloudBackups FAILURE: ${failure.message}');
        emit(
          state.copyWith(
            status: BackupStatus.failure,
            errorMessage: failure.message ?? 'Unknown error',
          ),
        );
      },
      (backups) {
        print('loadCloudBackups SUCCESS: ${backups.length} backups');
        for (final b in backups) {
          print('  - ${b.name} (${b.id})');
        }
        // Use 'initial' status to prevent triggering success dialog
        // but still update cloudBackups list
        emit(
          BackupRestoreState(
            status: BackupStatus.initial,
            cloudBackups: backups,
            isGoogleSignedIn: true,
          ),
        );
        print(
          'State after emit: cloudBackups.length = ${state.cloudBackups.length}',
        );
      },
    );
  }

  /// Restore từ cloud backup
  Future<void> restoreCloudBackup(String backupId) async {
    emit(
      state.copyWith(
        status: BackupStatus.loading,
        message: 'Restoring from cloud...',
      ),
    );

    final result = await _backupRepository.restoreFromCloudBackup(
      backupId: backupId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: BackupStatus.failure,
          errorMessage: failure.message ?? 'Unknown error',
        ),
      ),
      (result) async {
        emit(
          state.copyWith(
            status: BackupStatus.success,
            message:
                'Cloud restore completed!\n'
                '${result.booksRestored} books restored',
          ),
        );
        _bookRepository.refresh();
      },
    );
  }

  /// Export CSV
  Future<void> exportCsv() async {
    emit(
      state.copyWith(status: BackupStatus.loading, message: 'Exporting CSV...'),
    );

    // Pick folder
    final result = await FilePicker.platform.getDirectoryPath();
    if (result == null) {
      emit(
        state.copyWith(
          status: BackupStatus.initial,
          message: 'Export cancelled',
        ),
      );
      return;
    }

    final exportResult = await _backupRepository.exportToCsv(
      destinationPath: result,
    );

    exportResult.fold(
      (failure) => emit(
        state.copyWith(
          status: BackupStatus.failure,
          errorMessage: failure.message ?? 'Unknown error',
        ),
      ),
      (result) async {
        emit(
          state.copyWith(
            status: BackupStatus.success,
            message: 'CSV exported!\n${result.recordsExported} books exported',
          ),
        );

        // Offer to share
        if (result.filePath != null) {
          await SharePlus.instance.share(
            ShareParams(files: [XFile(result.filePath!)]),
          );
        }
      },
    );
  }

  /// Import CSV (Leafy format)
  Future<void> importCsv() async {
    emit(
      state.copyWith(
        status: BackupStatus.loading,
        message: 'Selecting CSV file...',
      ),
    );

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result == null ||
        result.files.isEmpty ||
        result.files.first.path == null) {
      emit(
        state.copyWith(
          status: BackupStatus.initial,
          message: 'Import cancelled',
        ),
      );
      return;
    }

    emit(state.copyWith(message: 'Importing CSV...'));

    final importResult = await _backupRepository.importFromCsv(
      csvFilePath: result.files.first.path!,
    );

    importResult.fold(
      (failure) => emit(
        state.copyWith(
          status: BackupStatus.failure,
          errorMessage: failure.message ?? 'Unknown error',
        ),
      ),
      (result) => emit(
        state.copyWith(
          status: BackupStatus.success,
          message: 'Import completed!\n${result.booksRestored} books imported',
        ),
      ),
    );
  }

  /// Reset state
  void reset() {
    emit(const BackupRestoreState());
  }
}
