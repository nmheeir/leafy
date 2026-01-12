import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/data/models/epub_cache/epub_cache_model.dart';

import 'epub_file_local_datasource.dart';

@LazySingleton(as: EpubFileLocalDataSource)
class EpubFileLocalDataSourceImpl implements EpubFileLocalDataSource {
  final Directory _documentsDir;

  EpubFileLocalDataSourceImpl(this._documentsDir);

  String _hash(String url) => md5.convert(utf8.encode(url)).toString();

  @override
  File epubFile(String url) => File('${_documentsDir.path}/${_hash(url)}.epub');

  @override
  File metaFile(String url) => File('${_documentsDir.path}/${_hash(url)}.json');

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

  @override
  Future<void> saveMeta(EpubCacheModel cache) async {
    final file = metaFile(cache.url);
    // NOTE: save meta vào trong database
    await file.writeAsString(jsonEncode(cache.toJson()));
  }

  @override
  Future<EpubCacheModel?> loadMeta(String url) async {
    final file = metaFile(url);
    if (!await file.exists()) return null;
    final content = await file.readAsString();
    if (content.isEmpty) return null;
    return EpubCacheModel.fromJson(jsonDecode(content));
  }
}
