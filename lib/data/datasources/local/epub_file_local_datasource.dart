import 'dart:io';

import 'package:leafy/data/models/epub_cache/epub_cache_model.dart';

abstract class EpubFileLocalDataSource {
  File epubFile(String url);
  File metaFile(String url);

  Future<bool> isValidEpub(File file);

  Future<void> saveMeta(EpubCacheModel cache);
  Future<EpubCacheModel?> loadMeta(String url);
}
