import 'package:equatable/equatable.dart';
import 'package:leafy/domain/backup/entities/backup_result.dart';

enum BackupStatus { initial, loading, success, failure }

class BackupRestoreState extends Equatable {
  final BackupStatus status;
  final String? message;
  final String? errorMessage;
  final List<CloudBackupInfo> cloudBackups;
  final bool isGoogleSignedIn;
  final double progress;

  const BackupRestoreState({
    this.status = BackupStatus.initial,
    this.message,
    this.errorMessage,
    this.cloudBackups = const [],
    this.isGoogleSignedIn = false,
    this.progress = 0.0,
  });

  BackupRestoreState copyWith({
    BackupStatus? status,
    String? message,
    String? errorMessage,
    List<CloudBackupInfo>? cloudBackups,
    bool? isGoogleSignedIn,
    double? progress,
  }) {
    return BackupRestoreState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage,
      cloudBackups: cloudBackups ?? this.cloudBackups,
      isGoogleSignedIn: isGoogleSignedIn ?? this.isGoogleSignedIn,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object?> get props => [
    status,
    message,
    errorMessage,
    cloudBackups,
    isGoogleSignedIn,
    progress,
  ];
}
