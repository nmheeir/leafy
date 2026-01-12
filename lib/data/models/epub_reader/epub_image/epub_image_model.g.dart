// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epub_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpubImageModel _$EpubImageModelFromJson(Map<String, dynamic> json) =>
    _EpubImageModel(
      absPath: json['absPath'] as String,
      image: const Uint8ListConverter().fromJson(json['image'] as List<int>?),
    );

Map<String, dynamic> _$EpubImageModelToJson(_EpubImageModel instance) =>
    <String, dynamic>{
      'absPath': instance.absPath,
      'image': const Uint8ListConverter().toJson(instance.image),
    };
