// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadingSessionModel _$ReadingSessionModelFromJson(Map<String, dynamic> json) =>
    _ReadingSessionModel(
      id: json['id'] as String,
      resourceId: (json['resource_id'] as num).toInt(),
      startTime: (json['start_time'] as num).toInt(),
      endTime: (json['end_time'] as num).toInt(),
      durationMs: (json['duration_ms'] as num).toInt(),
      chapterIndex: (json['chapter_index'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReadingSessionModelToJson(
  _ReadingSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'resource_id': instance.resourceId,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'duration_ms': instance.durationMs,
  'chapter_index': instance.chapterIndex,
};
