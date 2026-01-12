import 'dart:typed_data';

class EpubImage {
  final String absPath;
  final Uint8List? image;
  EpubImage({required this.absPath, this.image});
}
