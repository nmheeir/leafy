import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:leafy/data/models/epub_cache/epub_cache.dart';
import 'package:path_provider/path_provider.dart';

class EpubCachedService {
  final Dio _dio;

  Directory? _cachedDir;

  // Cho phép inject Dio instance từ bên ngoài (tốt cho testing và global config)
  EpubCachedService({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
            ),
          );

  Future<Directory> get _dir async {
    if (_cachedDir != null) return _cachedDir!;
    _cachedDir = await getApplicationDocumentsDirectory();
    return _cachedDir!;
  }

  String _hash(String url) => md5.convert(utf8.encode(url)).toString();

  Future<File> _epubFile(String url) async {
    final dir = await _dir;
    return File('${dir.path}/${_hash(url)}.epub');
  }

  Future<File> _metaFile(String url) async {
    final dir = await _dir;
    return File('${dir.path}/${_hash(url)}.json');
  }

  // ===============================
  // VALIDATE FILE
  // ===============================
  Future<bool> _isValidEpub(File file) async {
    // 1. Kiểm tra file tồn tại
    if (!await file.exists()) return false;

    // 2. Kiểm tra dung lượng file (Epub thật thường > 1KB)
    // Nếu file quá nhỏ (vd: 0 byte hoặc vài byte lỗi mạng), coi như lỗi.
    if (await file.length() < 100) return false;

    try {
      // 3. Kiểm tra Header (Magic Bytes)
      // Epub là định dạng ZIP. 4 byte đầu tiên của file ZIP chuẩn luôn là:
      // 0x50, 0x4B, 0x03, 0x04 (Tương ứng ký tự 'PK..')
      final List<int> bytes = await file.openRead(0, 4).first;

      if (bytes.length < 4) return false;

      // Kiểm tra xem 2 byte đầu có phải là 'PK' (50 4B) không
      if (bytes[0] == 0x50 && bytes[1] == 0x4B) {
        return true;
      }

      return false;
    } catch (e) {
      print('Lỗi kiểm tra file: $e');
      return false;
    }
  }

  // ===============================
  // GET OR DOWNLOAD EPUB
  // ===============================
  /// [cancelToken]: Dùng để hủy download nếu user thoát màn hình
  Future<File> getEpub({
    required String url,
    bool forceReload = false,
    Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final file = await _epubFile(url);

    // Nếu không bắt buộc tải lại và file hợp lệ thì trả về ngay
    if (!forceReload && await _isValidEpub(file)) {
      return file;
    }

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
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        throw Exception('Download cancelled');
      }
      rethrow;
    }

    // Kiểm tra lại lần cuối sau khi tải
    if (!await _isValidEpub(file)) {
      throw Exception('EPUB file corrupt or invalid');
    }

    return file;
  }

  // ===============================
  // METADATA
  // ===============================
  Future<void> saveMeta(EpubCache epubCache) async {
    try {
      final file = await _metaFile(epubCache.url);
      await file.writeAsString(jsonEncode(epubCache.toJson()));
    } catch (e) {
      // Log error nếu cần, không nên để crash app vì lỗi lưu cache phụ
      print('Error saving meta: $e');
    }
  }

  Future<EpubCache?> loadMeta(String url) async {
    try {
      final file = await _metaFile(url);
      if (!await file.exists()) return null;

      final content = await file.readAsString();
      if (content.isEmpty) return null;

      final json = jsonDecode(content);
      return EpubCache.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}
