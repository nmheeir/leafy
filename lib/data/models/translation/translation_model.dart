import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_model.freezed.dart';
part 'translation_model.g.dart';

@freezed
abstract class TranslationModel with _$TranslationModel {
  const factory TranslationModel({
    int? id,
    @JsonKey(name: 'file_hash') required String fileHash,
    @JsonKey(name: 'chapter_index') required int chapterIndex,
    @JsonKey(name: 'target_lang') @Default('vi') String targetLang,
    // JSON string -> Map<String, String> conversion handles at DB layer usually,
    // but here we model the generic key-value map for content.
    // For sqflite, we might need a custom converter if we want automatic string<->map.
    // Let's assume we pass the Map directly here and handle stringify in DataSource.
    @JsonKey(name: 'translated_content')
    required Map<String, String> translatedContent,
    @JsonKey(name: 'last_updated') int? lastUpdated,
  }) = _TranslationModel;

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);
}
