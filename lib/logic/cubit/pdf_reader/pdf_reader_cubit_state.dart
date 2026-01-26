import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/book_marks/entities/book_mark.dart';

part 'pdf_reader_cubit_state.freezed.dart';

@freezed
class PdfReaderCubitState with _$PdfReaderCubitState {
  const factory PdfReaderCubitState.initial() = _Initial;

  const factory PdfReaderCubitState.loading() = _Loading;

  const factory PdfReaderCubitState.loaded({
    required String filePath,
    required int resourceId,
    required List<BookMark> markers,
    required bool isLeftPaneShown,
    required int totalPages,
    required int currentPage,
  }) = _Loaded;

  const factory PdfReaderCubitState.error(String message) = _Error;
}
