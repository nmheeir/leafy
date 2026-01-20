// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslationModel _$TranslationModelFromJson(Map<String, dynamic> json) =>
    _TranslationModel(
      id: (json['id'] as num?)?.toInt(),
      fileHash: json['file_hash'] as String,
      chapterIndex: (json['chapter_index'] as num).toInt(),
      targetLang: json['target_lang'] as String? ?? 'vi',
      translatedContent: Map<String, String>.from(
        json['translated_content'] as Map,
      ),
      lastUpdated: (json['last_updated'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TranslationModelToJson(_TranslationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_hash': instance.fileHash,
      'chapter_index': instance.chapterIndex,
      'target_lang': instance.targetLang,
      'translated_content': instance.translatedContent,
      'last_updated': instance.lastUpdated,
    };
