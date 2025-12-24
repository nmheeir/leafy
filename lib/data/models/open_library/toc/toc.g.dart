// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableOfContent _$TableOfContentFromJson(Map<String, dynamic> json) =>
    _TableOfContent(
      level: (json['level'] as num?)?.toInt(),
      label: json['label'] as String?,
      title: json['title'] as String?,
      pagenum: json['pagenum'] as String?,
    );

Map<String, dynamic> _$TableOfContentToJson(_TableOfContent instance) =>
    <String, dynamic>{
      'level': instance.level,
      'label': instance.label,
      'title': instance.title,
      'pagenum': instance.pagenum,
    };
