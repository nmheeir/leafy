import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';
import 'package:pdfrx/pdfrx.dart';

part 'pdf_reader_state.dart';
part 'pdf_reader_cubit.freezed.dart';

@injectable
class PdfReaderCubit extends Cubit<PdfReaderState> {
  final Logger _logger;

  PdfReaderCubit(this._logger) : super(const PdfReaderState.initial());

  Future<void> openDocument(String filePath) async {
    emit(const PdfReaderState.loading());
    try {
      final document = await PdfDocument.openFile(filePath);

      // Calculate total pages and outline
      final totalPages = document.pages.length;
      final outline = await document.loadOutline();

      emit(
        PdfReaderState.loaded(
          document: document,
          totalPages: totalPages,
          outline: outline,
          currentPage: 1,
        ),
      );
    } catch (e) {
      _logger.e('Failed to open PDF: $e');
      emit(PdfReaderState.error(e.toString()));
    }
  }

  void onPageChanged(int pageNumber) {
    state.mapOrNull(
      loaded: (state) {
        if (state.currentPage != pageNumber) {
          emit(state.copyWith(currentPage: pageNumber));
        }
      },
    );
  }

  void toggleControls() {
    state.mapOrNull(
      loaded: (state) {
        emit(state.copyWith(controlsVisible: !state.controlsVisible));
      },
    );
  }

  // Search logic will be added later when we implement search
}
