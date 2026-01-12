import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/utils/converters/uint8list_converter.dart';
import 'package:leafy/domain/epub_reader/entities/epub_image.dart';

part 'epub_image_model.freezed.dart';
part 'epub_image_model.g.dart';

@freezed
abstract class EpubImageModel with _$EpubImageModel {
  factory EpubImageModel({
    required String absPath,
    @Uint8ListConverter() Uint8List? image,
  }) = _EpubImageModel;

  factory EpubImageModel.fromJson(Map<String, dynamic> json) =>
      _$EpubImageModelFromJson(json);

  const EpubImageModel._();

  EpubImage toEntity() => EpubImage(absPath: absPath, image: image);
}
