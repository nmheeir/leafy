import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';

import 'epub_file_local_datasource.dart';

/// Datasource để thao tác với epub, không liên quan gì tới database.
/// Các vấn đề liên quan tới database được xử lý trong book_resource_local_datasource
@LazySingleton(as: EpubFileLocalDataSource)
class EpubFileLocalDataSourceImpl implements EpubFileLocalDataSource {
  final Directory _documentsDir;

  EpubFileLocalDataSourceImpl(this._documentsDir);

  String _hash(String url) => md5.convert(utf8.encode(url)).toString();

  @override
  File epubFile(String url) => File('${_documentsDir.path}/${_hash(url)}.epub');

  @override
  Future<bool> isValidEpub(File file) async {
    if (!await file.exists()) return false;
    if (await file.length() < 100) return false;

    try {
      final bytes = await file.openRead(0, 4).first;
      return bytes.length >= 2 && bytes[0] == 0x50 && bytes[1] == 0x4B;
    } catch (_) {
      return false;
    }
  }
}
