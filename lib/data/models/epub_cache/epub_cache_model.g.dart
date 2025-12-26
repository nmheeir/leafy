// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epub_cache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpubCacheModel _$EpubCacheModelFromJson(Map<String, dynamic> json) =>
    _EpubCacheModel(
      id: json['id'] as String,
      url: json['url'] as String,
      title: json['title'] as String,
      lastReadCfi: json['lastReadCfi'] as String,
      progress: (json['progress'] as num).toDouble(),
    );

Map<String, dynamic> _$EpubCacheModelToJson(_EpubCacheModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'lastReadCfi': instance.lastReadCfi,
      'progress': instance.progress,
    };
