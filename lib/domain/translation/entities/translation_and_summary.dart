import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/translation/summary_model.dart';
import 'package:leafy/data/models/translation/translation_model.dart';

part 'translation_and_summary.freezed.dart';

@freezed
abstract class TranslationAndSummary with _$TranslationAndSummary {
  const factory TranslationAndSummary({
    required TranslationModel translation,
    required SummaryModel summary,
  }) = _TranslationAndSummary;
}
