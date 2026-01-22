import 'package:freezed_annotation/freezed_annotation.dart';

part 'translate_and_summarize_response.freezed.dart';
part 'translate_and_summarize_response.g.dart';

@freezed
abstract class TranslateAndSummarizeResponse
    with _$TranslateAndSummarizeResponse {
  const factory TranslateAndSummarizeResponse({
    required String summary,
    required Map<String, String> translation,
  }) = _TranslateAndSummarizeResponse;

  factory TranslateAndSummarizeResponse.fromJson(Map<String, dynamic> json) =>
      _$TranslateAndSummarizeResponseFromJson(json);
}
