/// Result của backup operation
class BackupResult {
  final bool success;
  final String? filePath;
  final String? errorMessage;
  final BackupMetadata? metadata;

  const BackupResult({
    required this.success,
    this.filePath,
    this.errorMessage,
    this.metadata,
  });

  factory BackupResult.success({
    required String filePath,
    required BackupMetadata metadata,
  }) {
    return BackupResult(success: true, filePath: filePath, metadata: metadata);
  }

  factory BackupResult.failure(String errorMessage) {
    return BackupResult(success: false, errorMessage: errorMessage);
  }
}

/// Metadata của backup file
class BackupMetadata {
  final String version;
  final String appVersion;
  final DateTime createdAt;
  final int dbVersion;
  final int totalBooks;
  final int totalCovers;

  const BackupMetadata({
    required this.version,
    required this.appVersion,
    required this.createdAt,
    required this.dbVersion,
    required this.totalBooks,
    required this.totalCovers,
  });

  Map<String, dynamic> toJson() => {
    'version': version,
    'app_version': appVersion,
    'created_at': createdAt.toIso8601String(),
    'db_version': dbVersion,
    'total_books': totalBooks,
    'total_covers': totalCovers,
  };

  factory BackupMetadata.fromJson(Map<String, dynamic> json) {
    return BackupMetadata(
      version: json['version'] as String,
      appVersion: json['app_version'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      dbVersion: json['db_version'] as int,
      totalBooks: json['total_books'] as int,
      totalCovers: json['total_covers'] as int,
    );
  }
}

/// Result của restore operation
class RestoreResult {
  final bool success;
  final String? errorMessage;
  final int booksRestored;
  final int coversRestored;

  const RestoreResult({
    required this.success,
    this.errorMessage,
    this.booksRestored = 0,
    this.coversRestored = 0,
  });

  factory RestoreResult.success({
    required int booksRestored,
    required int coversRestored,
  }) {
    return RestoreResult(
      success: true,
      booksRestored: booksRestored,
      coversRestored: coversRestored,
    );
  }

  factory RestoreResult.failure(String errorMessage) {
    return RestoreResult(success: false, errorMessage: errorMessage);
  }
}

/// Result của CSV export operation
class CsvExportResult {
  final bool success;
  final String? filePath;
  final String? errorMessage;
  final int recordsExported;

  const CsvExportResult({
    required this.success,
    this.filePath,
    this.errorMessage,
    this.recordsExported = 0,
  });

  factory CsvExportResult.success({
    required String filePath,
    required int recordsExported,
  }) {
    return CsvExportResult(
      success: true,
      filePath: filePath,
      recordsExported: recordsExported,
    );
  }

  factory CsvExportResult.failure(String errorMessage) {
    return CsvExportResult(success: false, errorMessage: errorMessage);
  }
}

/// Thông tin backup trên cloud
class CloudBackupInfo {
  final String id;
  final String name;
  final DateTime createdAt;
  final int sizeBytes;

  const CloudBackupInfo({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.sizeBytes,
  });
}
