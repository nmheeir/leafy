import 'dart:typed_data';

import 'package:blurhash/blurhash.dart' as blurhash;
import 'package:leafy/core/constants/constants.dart';

Future<String?> generateBlurHash(Uint8List? cover) async {
  if (cover == null) return null;

  return await blurhash.BlurHash.encode(
    cover,
    Constants.blurHashX,
    Constants.blurHashY,
  );
}
