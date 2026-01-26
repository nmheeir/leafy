import 'dart:io';
import 'package:crypto/crypto.dart';

class CryptoUtils {
  static Future<String> getFileMd5(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('File not found: $filePath');
    }

    // For large files, stream processing is better to avoid OOM
    final stream = file.openRead();
    final digest = await md5.bind(stream).first;
    return digest.toString();
  }

  static String getStringMd5(String source) {
    return md5.convert(source.codeUnits).toString();
  }
}
