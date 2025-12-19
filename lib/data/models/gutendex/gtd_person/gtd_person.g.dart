// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gtd_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GtdPerson _$GtdPersonFromJson(Map<String, dynamic> json) => _GtdPerson(
  name: json['name'] as String?,
  birthYear: (json['birthYear'] as num?)?.toInt(),
  deathYear: (json['deathYear'] as num?)?.toInt(),
);

Map<String, dynamic> _$GtdPersonToJson(_GtdPerson instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthYear': instance.birthYear,
      'deathYear': instance.deathYear,
    };
