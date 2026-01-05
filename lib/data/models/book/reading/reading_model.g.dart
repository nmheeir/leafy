// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadingModel _$ReadingModelFromJson(Map<String, dynamic> json) =>
    _ReadingModel(
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      finishDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      readingTimeMs: (json['reading_time_ms'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ReadingModelToJson(_ReadingModel instance) =>
    <String, dynamic>{
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.finishDate?.toIso8601String(),
      'reading_time_ms': instance.readingTimeMs,
    };
