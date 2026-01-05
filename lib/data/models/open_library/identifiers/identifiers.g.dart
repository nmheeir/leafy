// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifiers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Identifiers _$IdentifiersFromJson(Map<String, dynamic> json) => _Identifiers(
  amazon: (json['amazon'] as List<dynamic>?)?.map((e) => e as String).toList(),
  google: (json['google'] as List<dynamic>?)?.map((e) => e as String).toList(),
  librarything: (json['librarything'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  goodreads: (json['goodreads'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  projectGutenberg: (json['project_gutenberg'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  isbn13: (json['isbn_13'] as List<dynamic>?)?.map((e) => e as String).toList(),
  isbn10: (json['isbn_10'] as List<dynamic>?)?.map((e) => e as String).toList(),
  oclc: (json['oclc'] as List<dynamic>?)?.map((e) => e as String).toList(),
  lccn: (json['lccn'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$IdentifiersToJson(_Identifiers instance) =>
    <String, dynamic>{
      'amazon': instance.amazon,
      'google': instance.google,
      'librarything': instance.librarything,
      'goodreads': instance.goodreads,
      'project_gutenberg': instance.projectGutenberg,
      'isbn_13': instance.isbn13,
      'isbn_10': instance.isbn10,
      'oclc': instance.oclc,
      'lccn': instance.lccn,
    };
