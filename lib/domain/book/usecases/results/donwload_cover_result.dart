import 'dart:typed_data';

class DownloadCoverResult {
  final Uint8List imageBytes;
  final String blurHash;

  DownloadCoverResult(this.imageBytes, this.blurHash);
}
