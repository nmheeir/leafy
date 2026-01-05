// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ol_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OLWork _$OLWorkFromJson(Map<String, dynamic> json) => _OLWork(
  firstPublishDate: json['first_publish_date'] as String?,
  description: json['description'] == null
      ? null
      : Created.fromJson(json['description'] as Map<String, dynamic>),
  links: (json['links'] as List<dynamic>?)
      ?.map((e) => OLLink.fromJson(e as Map<String, dynamic>))
      .toList(),
  title: json['title'] as String?,
  created: json['created'] == null
      ? null
      : Created.fromJson(json['created'] as Map<String, dynamic>),
  lastModified: json['last_modified'] == null
      ? null
      : Created.fromJson(json['last_modified'] as Map<String, dynamic>),
  covers: (json['covers'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  lcClassifications: (json['lc_classifications'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  latestRevision: (json['latest_revision'] as num?)?.toInt(),
  key: json['key'] as String?,
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
      .toList(),
  deweyNumber: (json['dewey_number'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  type: json['type'] == null
      ? null
      : OLType.fromJson(json['type'] as Map<String, dynamic>),
  subjects: (json['subjects'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$OLWorkToJson(_OLWork instance) => <String, dynamic>{
  'first_publish_date': instance.firstPublishDate,
  'description': instance.description,
  'links': instance.links,
  'title': instance.title,
  'created': instance.created,
  'last_modified': instance.lastModified,
  'covers': instance.covers,
  'lc_classifications': instance.lcClassifications,
  'latest_revision': instance.latestRevision,
  'key': instance.key,
  'authors': instance.authors,
  'dewey_number': instance.deweyNumber,
  'type': instance.type,
  'subjects': instance.subjects,
  'revision': instance.revision,
};
