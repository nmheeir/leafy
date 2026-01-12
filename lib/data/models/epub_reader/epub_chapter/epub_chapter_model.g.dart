// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epub_chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpubChapterModel _$EpubChapterModelFromJson(Map<String, dynamic> json) =>
    _EpubChapterModel(
      id: json['chapterId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$EpubChapterModelToJson(_EpubChapterModel instance) =>
    <String, dynamic>{
      'chapterId': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
