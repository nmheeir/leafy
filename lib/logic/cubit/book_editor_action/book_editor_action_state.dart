part of 'book_editor_action_cubit.dart';

@freezed
abstract class BookEditorActionState with _$BookEditorActionState {
  const factory BookEditorActionState({
    @Default(false) bool isCoverDownloading,
    @Default(false) bool isWorkDownloading,
    Uint8List? coverBytes,
    String? coverBlurHash,
    OLWorkResult? olWorkResult,
    String? errorMessage,
  }) = _BookEditorActionState;
}
