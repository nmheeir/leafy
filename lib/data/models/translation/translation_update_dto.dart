import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_update_dto.freezed.dart';

@freezed
class TranslationUpdateDto with _$TranslationUpdateDto {
  const factory TranslationUpdateDto.data({
    required String id,
    required String text,
  }) = _Data;

  const factory TranslationUpdateDto.summary({required String summary}) =
      _Summary;
}
