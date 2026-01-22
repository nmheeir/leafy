import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/constants/enums/translation_language.dart';
import 'package:leafy/core/utils/converters/int_to_datetime_coverter.dart';
import 'package:leafy/core/utils/converters/map_string_converter.dart';
import 'package:leafy/core/utils/converters/translation_language_converter.dart';

part 'translation_model.freezed.dart';
part 'translation_model.g.dart';

@freezed
abstract class TranslationModel with _$TranslationModel {
  const factory TranslationModel({
    int? id,
    @JsonKey(name: 'file_hash') required String fileHash,
    @JsonKey(name: 'chapter_index') required int chapterIndex,
    @JsonKey(name: 'target_lang')
    @TranslationLanguageConverter()
    @Default(TranslationLanguage.vietnamese)
    TranslationLanguage targetLang,
    @JsonKey(name: 'translated_content')
    @MapStringConverter()
    required Map<String, String> translatedContent,
    @JsonKey(name: 'last_updated')
    @IntToDatetimeCoverter()
    DateTime? lastUpdated,
  }) = _TranslationModel;

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);
}
