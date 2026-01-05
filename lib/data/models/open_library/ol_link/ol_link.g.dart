// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ol_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OLLink _$OLLinkFromJson(Map<String, dynamic> json) => _OLLink(
  url: json['url'] as String?,
  type: json['type'] == null
      ? null
      : OLType.fromJson(json['type'] as Map<String, dynamic>),
  title: json['title'] as String?,
);

Map<String, dynamic> _$OLLinkToJson(_OLLink instance) => <String, dynamic>{
  'url': instance.url,
  'type': instance.type,
  'title': instance.title,
};
