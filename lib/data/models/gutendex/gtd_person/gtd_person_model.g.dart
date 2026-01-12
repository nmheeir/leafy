// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gtd_person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GtdPersonModel _$GtdPersonModelFromJson(Map<String, dynamic> json) =>
    _GtdPersonModel(
      name: json['name'] as String?,
      birthYear: (json['birth_year'] as num?)?.toInt(),
      deathYear: (json['death_year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GtdPersonModelToJson(_GtdPersonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birth_year': instance.birthYear,
      'death_year': instance.deathYear,
    };
