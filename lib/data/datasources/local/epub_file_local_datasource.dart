import 'dart:io';

abstract class EpubFileLocalDataSource {
  File epubFile(String url);

  Future<bool> isValidEpub(File file);
}
