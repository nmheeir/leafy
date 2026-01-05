// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ol_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlAuthor _$OlAuthorFromJson(Map<String, dynamic> json) => _OlAuthor(
  name: json['name'] as String?,
  links: (json['links'] as List<dynamic>?)
      ?.map((e) => OLLink.fromJson(e as Map<String, dynamic>))
      .toList(),
  personalName: json['personal_name'] as String?,
  created: json['created'] == null
      ? null
      : Created.fromJson(json['created'] as Map<String, dynamic>),
  lastModified: json['last_modified'] == null
      ? null
      : Created.fromJson(json['last_modified'] as Map<String, dynamic>),
  latestRevision: (json['latest_revision'] as num?)?.toInt(),
  key: json['key'] as String?,
  type: json['type'] == null
      ? null
      : OLType.fromJson(json['type'] as Map<String, dynamic>),
  id: (json['id'] as num?)?.toInt(),
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$OlAuthorToJson(_OlAuthor instance) => <String, dynamic>{
  'name': instance.name,
  'links': instance.links,
  'personal_name': instance.personalName,
  'created': instance.created,
  'last_modified': instance.lastModified,
  'latest_revision': instance.latestRevision,
  'key': instance.key,
  'type': instance.type,
  'id': instance.id,
  'revision': instance.revision,
};
