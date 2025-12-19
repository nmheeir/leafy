// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gtd_books_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GtdBooksResult _$GtdBooksResultFromJson(Map<String, dynamic> json) =>
    _GtdBooksResult(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => GtdBookResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GtdBooksResultToJson(_GtdBooksResult instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
