// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Created _$CreatedFromJson(Map<String, dynamic> json) => _Created(
  type: json['type'] as String?,
  value: json['value'] == null ? null : DateTime.parse(json['value'] as String),
);

Map<String, dynamic> _$CreatedToJson(_Created instance) => <String, dynamic>{
  'type': instance.type,
  'value': instance.value?.toIso8601String(),
};
