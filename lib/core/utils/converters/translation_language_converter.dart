import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/constants/enums/translation_language.dart';

class TranslationLanguageConverter
    implements JsonConverter<TranslationLanguage, String> {
  const TranslationLanguageConverter();

  @override
  TranslationLanguage fromJson(String json) {
    return TranslationLanguage.values.firstWhere(
      (e) => e.code == json,
      orElse: () => TranslationLanguage.vietnamese,
    );
  }

  @override
  String toJson(TranslationLanguage object) {
    return object.code;
  }
}
