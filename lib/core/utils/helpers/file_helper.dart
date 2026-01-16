import 'dart:io';
import 'package:diacritic/diacritic.dart';
import 'package:leafy/core/utils/app_globals.dart';
import 'package:path/path.dart' as p;
import 'package:crypto/crypto.dart';

abstract final class FileHelper {
  static Future<String> hashFile(File file) async {
    try {
      // Chunked reading for memory efficiency
      final stream = file.openRead();
      final digest = await md5.bind(stream).first;
      return digest.toString();
    } catch (e) {
      // Fallback or rethrow
      return '';
    }
  }

  static String formatSize(int bytes) {
    if (bytes <= 0) return "0 B";
    if (bytes < 1024) return "$bytes B";
    if (bytes < 1024 * 1024) return "${(bytes / 1024).toStringAsFixed(1)} KB";
    return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB";
  }

  static String _sanitizeFilename(String originalName) {
    // 1. Remove extension for processing name part
    final extension = p.extension(originalName); // .epub
    final nameWithoutExt = p.basenameWithoutExtension(originalName);

    // 2. Remove special chars, replace space with underscore, lowercase
    // handling: "Tên Sách" -> "Ten Sach" -> "ten_sach"
    String clean = removeDiacritics(nameWithoutExt).toLowerCase();

    // Replace non-alphanumeric characters with underscore
    clean = clean.replaceAll(RegExp(r'[^a-z0-9]+'), '_');

    // Remote duplicate underscores if any
    clean = clean.replaceAll(RegExp(r'_+'), '_');

    // Remove leading/trailing underscores
    clean = clean.trim().replaceAll(RegExp(r'^_|_$'), '');

    // 3. Timestamp suffix
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    return '${clean}_$timestamp$extension';
  }

  static String generateEpubFilePath(String originalName) {
    final sanitizedName = _sanitizeFilename(originalName);
    return p.join(appDocumentsDirectory.path, 'epub', sanitizedName);
  }
}
