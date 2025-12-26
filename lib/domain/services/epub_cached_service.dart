import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:leafy/data/models/epub_cache/epub_cache_model.dart';

@lazySingleton
class EpubCachedService {
  final Dio _dio;
  final Logger _logger;
  final Directory _documentsDir;

  EpubCachedService(this._dio, this._logger, this._documentsDir);

  String _hash(String url) => md5.convert(utf8.encode(url)).toString();

  File _epubFile(String url) {
    return File('${_documentsDir.path}/${_hash(url)}.epub');
  }

  File _metaFile(String url) {
    return File('${_documentsDir.path}/${_hash(url)}.json');
  }

  // ===============================
  // VALIDATE FILE
  // ===============================
  Future<bool> _isValidEpub(File file) async {
    if (!await file.exists()) {
      _logger.d('Validate EPUB: File not found at ${file.path}');
      return false;
    }

    if (await file.length() < 100) {
      _logger.w('Validate EPUB: File too small (<100 bytes) at ${file.path}');
      return false;
    }

    try {
      final List<int> bytes = await file.openRead(0, 4).first;
      if (bytes.length < 4) return false;

      final isValid = bytes[0] == 0x50 && bytes[1] == 0x4B;

      if (!isValid) {
        _logger.w(
          'Validate EPUB: Invalid Magic Bytes [${bytes[0]}, ${bytes[1]}]',
        );
      }

      return isValid;
    } catch (e, st) {
      _logger.e(
        'Validate EPUB: Error reading header',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }

  // ===============================
  // GET OR DOWNLOAD EPUB
  // ===============================
  Future<File> getEpub({
    required String url,
    bool forceReload = false,
    Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final file = _epubFile(url);
    final fileName = file.uri.pathSegments.last;

    // Check Cache
    if (!forceReload && await _isValidEpub(file)) {
      _logger.d('Cache hit: $fileName');
      return file;
    }

    _logger.i('Start downloading EPUB: $url -> $fileName');

    try {
      await _dio.download(
        url,
        file.path,
        cancelToken: cancelToken,
        deleteOnError: true,
        onReceiveProgress: (received, total) {
          if (total > 0 && onProgress != null) {
            onProgress((received / total).clamp(0.0, 1.0));
          }
        },
      );

      _logger.i('Download complete: $fileName');
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        _logger.i('Download cancelled by user');
        throw Exception('Download cancelled');
      }
      _logger.e('DioError downloading EPUB', error: e);
      rethrow;
    } catch (e, st) {
      _logger.e('Error downloading EPUB', error: e, stackTrace: st);
      rethrow;
    }

    // Validate post-download
    if (!await _isValidEpub(file)) {
      _logger.e('Download finished but file is invalid/corrupt');
      // Xóa file lỗi để tránh lần sau nhận diện nhầm
      if (await file.exists()) await file.delete();
      throw Exception('EPUB file corrupt or invalid');
    }

    return file;
  }

  // ===============================
  // METADATA
  // ===============================
  Future<void> saveMeta(EpubCacheModel epubCache) async {
    try {
      final file = _metaFile(epubCache.url);
      await file.writeAsString(jsonEncode(epubCache.toJson()));
      _logger.d('Saved metadata for ${epubCache.url}');
    } catch (e, st) {
      _logger.e('Error saving meta', error: e, stackTrace: st);
    }
  }

  Future<EpubCacheModel?> loadMeta(String url) async {
    try {
      final file = _metaFile(url);
      if (!await file.exists()) return null;

      final content = await file.readAsString();
      if (content.isEmpty) return null;

      final json = jsonDecode(content);
      return EpubCacheModel.fromJson(json);
    } catch (e, st) {
      _logger.w(
        'Error loading meta (might be corrupt json)',
        error: e,
        stackTrace: st,
      );
      return null;
    }
  }
}
