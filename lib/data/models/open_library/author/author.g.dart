// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Author _$AuthorFromJson(Map<String, dynamic> json) => _Author(
  type: json['type'] == null
      ? null
      : OLType.fromJson(json['type'] as Map<String, dynamic>),
  author: json['author'] == null
      ? null
      : OLType.fromJson(json['author'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
  'type': instance.type,
  'author': instance.author,
};
