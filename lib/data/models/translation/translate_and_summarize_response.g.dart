// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_and_summarize_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslateAndSummarizeResponse _$TranslateAndSummarizeResponseFromJson(
  Map<String, dynamic> json,
) => _TranslateAndSummarizeResponse(
  summary: json['summary'] as String,
  translation: Map<String, String>.from(json['translation'] as Map),
);

Map<String, dynamic> _$TranslateAndSummarizeResponseToJson(
  _TranslateAndSummarizeResponse instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'translation': instance.translation,
};
