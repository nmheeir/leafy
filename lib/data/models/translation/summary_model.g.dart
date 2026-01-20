// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummaryModel _$SummaryModelFromJson(Map<String, dynamic> json) =>
    _SummaryModel(
      id: (json['id'] as num?)?.toInt(),
      fileHash: json['file_hash'] as String,
      chapterIndex: (json['chapter_index'] as num).toInt(),
      summaryContent: json['summary_content'] as String,
      lastUpdated: (json['last_updated'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SummaryModelToJson(_SummaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_hash': instance.fileHash,
      'chapter_index': instance.chapterIndex,
      'summary_content': instance.summaryContent,
      'last_updated': instance.lastUpdated,
    };
