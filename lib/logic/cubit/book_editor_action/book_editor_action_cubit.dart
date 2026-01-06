import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book/usecases/download_cover.dart';
import 'package:leafy/domain/open_lib/entities/ol_work_result.dart';
import 'package:leafy/domain/open_lib/usecases/ol_get_work.dart';

part 'book_editor_action_cubit.freezed.dart';
part 'book_editor_action_state.dart';

@injectable
class BookEditorActionCubit extends Cubit<BookEditorActionState> {
  final DownloadCoverUseCase _downloadCoverUseCase;
  final OlGetWorkUseCase _olGetWorkUseCase;
  // final ValidateBookFormUseCase _validateBookFormUseCase;

  BookEditorActionCubit(
    this._downloadCoverUseCase,
    this._olGetWorkUseCase,
    // this._validateBookFormUseCase,
  ) : super(const BookEditorActionState());

  Future<void> downloadCover(String coverOLID) async {
    emit(state.copyWith(isCoverDownloading: true));
    final result = await _downloadCoverUseCase(coverOLID);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isCoverDownloading: false,
            errorMessage: failure.toString(),
          ),
        );
      },
      (result) {
        emit(
          state.copyWith(
            isCoverDownloading: false,
            coverBytes: result.imageBytes,
            coverBlurHash: result.blurHash,
          ),
        );
      },
    );
  }

  Future<void> getWork(String workId) async {
    final result = await _olGetWorkUseCase(workId);

    result.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.toString()));
      },
      (olWorkResult) {
        emit(state.copyWith(olWorkResult: olWorkResult));
      },
    );
  }

  void reset() {
    emit(const BookEditorActionState()); // Emit state rỗng hoàn toàn
  }

  // /// Trả về true nếu hợp lệ, false nếu không (và emit lỗi để UI hiện snackbar)
  // bool validateForm(Book book) {
  //   final error = _validateBookFormUseCase.execute(book);
  //   if (error != null) {
  //     emit(BookEditorActionState.validationFailure(error));
  //     emit(const BookEditorActionState.idle());
  //     return false;
  //   }
  //   return true;
  // }
}
