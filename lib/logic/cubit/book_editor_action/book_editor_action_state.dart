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

    @Default(0.0) double downloadProgress, // 0.0 đến 1.0
    String? downloadedFilePath, // Đường dẫn sau khi tải xong
    String? fileDownloadError, // Lỗi nếu có
  }) = _BookEditorActionState;
}
