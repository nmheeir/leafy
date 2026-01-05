part of 'book_editor_action_cubit.dart';

@freezed
abstract class BookEditorActionState with _$BookEditorActionState {
  const factory BookEditorActionState.idle() = _Idle;
  const factory BookEditorActionState.coverDownloading() = _CoverDownloading;
  const factory BookEditorActionState.coverDownloaded({
    required Uint8List bytes,
    required String blurHash,
  }) = _CoverDownloaded;
  const factory BookEditorActionState.workDownloaded({
    required OLWorkResult olWorkResult,
  }) = _WorkDownloaded;
  const factory BookEditorActionState.validationFailure(String message) =
      _ValidationFailure;
  const factory BookEditorActionState.failure(String message) = _Failure;
}
