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
  ) : super(const BookEditorActionState.idle());

  Future<void> downloadCover(String coverOLID) async {
    emit(const BookEditorActionState.coverDownloading());
    final result = await _downloadCoverUseCase(coverOLID);

    result.fold(
      (failure) {
        emit(BookEditorActionState.failure(failure.toString()));
      },
      (result) {
        emit(
          BookEditorActionState.coverDownloaded(
            bytes: result.imageBytes,
            blurHash: result.blurHash,
          ),
        );
      },
    );
  }

  Future<void> getWork(String workId) async {
    final result = await _olGetWorkUseCase(workId);

    result.fold(
      (failure) {
        emit(BookEditorActionState.failure(failure.toString()));
      },
      (olWorkResult) {
        emit(BookEditorActionState.workDownloaded(olWorkResult: olWorkResult));
      },
    );
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
