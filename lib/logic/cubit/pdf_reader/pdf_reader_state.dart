part of 'pdf_reader_cubit.dart';

@freezed
class PdfReaderState with _$PdfReaderState {
  const factory PdfReaderState.initial() = _Initial;
  const factory PdfReaderState.loading() = _Loading;
  const factory PdfReaderState.error(String message) = _Error;
  const factory PdfReaderState.loaded({
    required PdfDocument document,
    @Default(1) int currentPage,
    @Default(0) int totalPages,
    @Default([]) List<PdfOutlineNode> outline,
    @Default(true) bool controlsVisible,
    // @Default([]) List<PdfTextSearchResult> searchResults,
  }) = _Loaded;
}
