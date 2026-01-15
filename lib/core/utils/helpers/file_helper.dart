import 'dart:io';

import 'package:crypto/crypto.dart';

Future<String> hashFile(File file) async {
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

String formatSize(int bytes) {
  if (bytes <= 0) return "0 B";
  if (bytes < 1024) return "$bytes B";
  if (bytes < 1024 * 1024) return "${(bytes / 1024).toStringAsFixed(1)} KB";
  return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB";
}
