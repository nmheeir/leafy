import 'dart:io';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/backup/entities/backup_result.dart';
import 'package:logger/logger.dart';

/// Service để tương tác với Google Drive
@LazySingleton()
class GoogleDriveService {
  final Logger _logger = Logger();

  GoogleSignInAccount? _currentUser;
  GoogleSignInClientAuthorization? _authorization;
  drive.DriveApi? _driveApi;

  static const _folderName = 'Leafy Backups';
  static const _mimeTypeFolder = 'application/vnd.google-apps.folder';
  static const _mimeTypeZip = 'application/zip';

  static const List<String> _scopes = <String>[drive.DriveApi.driveFileScope];

  /// Initialize Google Sign-In
  Future<bool> signIn() async {
    try {
      final signIn = GoogleSignIn.instance;

      // Initialize
      await signIn.initialize();

      // Try to authenticate
      if (signIn.supportsAuthenticate()) {
        _currentUser = await signIn.authenticate();
      } else {
        // Try lightweight authentication first
        _currentUser = await signIn.attemptLightweightAuthentication();
      }

      if (_currentUser == null) {
        _logger.w('Google Sign-In cancelled or failed');
        return false;
      }

      // Request authorization for Drive scope
      _authorization = await _currentUser!.authorizationClient.authorizeScopes(
        _scopes,
      );

      if (_authorization == null) {
        _logger.w('Google Drive authorization failed');
        return false;
      }

      // Get authenticated HTTP client
      final auth.AuthClient httpClient = _authorization!.authClient(
        scopes: _scopes,
      );

      _driveApi = drive.DriveApi(httpClient);

      _logger.i('Google Drive signed in: ${_currentUser!.email}');
      return true;
    } on Exception catch (e, st) {
      _logger.e('Google Sign-In failed', error: e, stackTrace: st);
      return false;
    }
  }

  /// Check if signed in
  bool get isSignedIn => _driveApi != null && _currentUser != null;

  /// Sign out
  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    _driveApi = null;
    _currentUser = null;
    _authorization = null;
    _logger.i('Google Drive signed out');
  }

  /// Upload backup file to Google Drive
  Future<BackupResult> uploadBackup(String localFilePath) async {
    if (_driveApi == null) {
      return BackupResult.failure('Not signed in to Google Drive');
    }

    try {
      final file = File(localFilePath);
      if (!file.existsSync()) {
        return BackupResult.failure('Backup file not found');
      }

      // Get or create Leafy Backups folder
      final folderId = await _getOrCreateFolder();
      if (folderId == null) {
        return BackupResult.failure('Failed to create backup folder on Drive');
      }

      // Upload file
      final fileName = localFilePath.split('/').last;
      final fileMetadata = drive.File()
        ..name = fileName
        ..parents = [folderId]
        ..mimeType = _mimeTypeZip;

      final media = drive.Media(file.openRead(), file.lengthSync());

      final uploadedFile = await _driveApi!.files.create(
        fileMetadata,
        uploadMedia: media,
      );

      _logger.i('Backup uploaded to Drive: ${uploadedFile.id}');

      return BackupResult.success(
        filePath: uploadedFile.id ?? '',
        metadata: BackupMetadata(
          version: '1.0',
          appVersion: '',
          createdAt: DateTime.now(),
          dbVersion: 0,
          totalBooks: 0,
          totalCovers: 0,
        ),
      );
    } on Exception catch (e, st) {
      _logger.e('Drive upload failed', error: e, stackTrace: st);
      return BackupResult.failure('Upload failed: $e');
    }
  }

  /// List backups on Google Drive
  Future<List<CloudBackupInfo>> listBackups() async {
    if (_driveApi == null) return [];

    try {
      final folderId = await _getFolderId();
      if (folderId == null) return [];

      final result = await _driveApi!.files.list(
        q: "'$folderId' in parents and mimeType='$_mimeTypeZip' and trashed=false",
        orderBy: 'createdTime desc',
        $fields: 'files(id, name, createdTime, size)',
      );

      return (result.files ?? []).map((f) {
        return CloudBackupInfo(
          id: f.id ?? '',
          name: f.name ?? '',
          createdAt: f.createdTime ?? DateTime.now(),
          sizeBytes: int.tryParse(f.size ?? '0') ?? 0,
        );
      }).toList();
    } on Exception catch (e, st) {
      _logger.e('Failed to list Drive backups', error: e, stackTrace: st);
      return [];
    }
  }

  /// Download backup from Google Drive
  Future<String?> downloadBackup(String fileId, String destinationPath) async {
    if (_driveApi == null) return null;

    try {
      final response = await _driveApi!.files.get(
        fileId,
        downloadOptions: drive.DownloadOptions.fullMedia,
      );

      if (response is! drive.Media) {
        return null;
      }

      final outputFile = File(destinationPath);
      final sink = outputFile.openWrite();

      await for (final chunk in response.stream) {
        sink.add(chunk);
      }

      await sink.close();

      _logger.i('Backup downloaded: $destinationPath');
      return destinationPath;
    } on Exception catch (e, st) {
      _logger.e('Drive download failed', error: e, stackTrace: st);
      return null;
    }
  }

  /// Delete backup from Google Drive
  Future<bool> deleteBackup(String fileId) async {
    if (_driveApi == null) return false;

    try {
      await _driveApi!.files.delete(fileId);
      _logger.i('Backup deleted from Drive: $fileId');
      return true;
    } on Exception catch (e, st) {
      _logger.e('Failed to delete Drive backup', error: e, stackTrace: st);
      return false;
    }
  }

  Future<String?> _getOrCreateFolder() async {
    var folderId = await _getFolderId();
    if (folderId != null) return folderId;

    // Create folder
    final folderMetadata = drive.File()
      ..name = _folderName
      ..mimeType = _mimeTypeFolder;

    final folder = await _driveApi!.files.create(folderMetadata);
    return folder.id;
  }

  Future<String?> _getFolderId() async {
    if (_driveApi == null) return null;

    try {
      final result = await _driveApi!.files.list(
        q: "name='$_folderName' and mimeType='$_mimeTypeFolder' and trashed=false",
        $fields: 'files(id)',
      );

      if (result.files?.isNotEmpty ?? false) {
        return result.files!.first.id;
      }
      return null;
    } on Exception {
      return null;
    }
  }
}
