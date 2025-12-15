// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epub_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpubCache _$EpubCacheFromJson(Map<String, dynamic> json) => _EpubCache(
  id: json['id'] as String,
  url: json['url'] as String,
  title: json['title'] as String,
  lastReadCfi: json['lastReadCfi'] as String,
  progress: (json['progress'] as num).toDouble(),
);

Map<String, dynamic> _$EpubCacheToJson(_EpubCache instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'lastReadCfi': instance.lastReadCfi,
      'progress': instance.progress,
    };
