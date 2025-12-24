// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ol_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OLSearchResultModel _$OLSearchResultModelFromJson(Map<String, dynamic> json) =>
    _OLSearchResultModel(
      docs: (json['docs'] as List<dynamic>)
          .map(
            (e) => OLSearchResultDocModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      numFound: (json['numFound'] as num?)?.toInt(),
      start: (json['start'] as num?)?.toInt(),
      numFoundExact: json['numFoundExact'] as bool?,
      openLibrarySearchResultNumFound:
          (json['openLibrarySearchResultNumFound'] as num?)?.toInt(),
      q: json['q'] as String?,
      offset: json['offset'],
    );

Map<String, dynamic> _$OLSearchResultModelToJson(
  _OLSearchResultModel instance,
) => <String, dynamic>{
  'docs': instance.docs,
  'numFound': instance.numFound,
  'start': instance.start,
  'numFoundExact': instance.numFoundExact,
  'openLibrarySearchResultNumFound': instance.openLibrarySearchResultNumFound,
  'q': instance.q,
  'offset': instance.offset,
};
