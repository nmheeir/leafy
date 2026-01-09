import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/ol_cover_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book/usecases/download_gtd_cover.dart';
import 'package:leafy/domain/book/usecases/download_ol_cover.dart';
import 'package:leafy/domain/book/usecases/params/download_cover_params.dart';
import 'package:leafy/domain/book/usecases/results/donwload_cover_result.dart';
import 'package:leafy/domain/open_lib/entities/ol_work_result.dart';
import 'package:leafy/domain/open_lib/usecases/ol_get_work.dart';

part 'book_editor_action_cubit.freezed.dart';
part 'book_editor_action_state.dart';

@injectable
class BookEditorActionCubit extends Cubit<BookEditorActionState> {
  final DownloadOlCoverUseCase _downloadOlCoverUseCase;
  final DownloadGtdCoverUseCase _downloadGtdCoverUseCase;
  final OlGetWorkUseCase _olGetWorkUseCase;
  // final ValidateBookFormUseCase _validateBookFormUseCase;

  BookEditorActionCubit(
    this._downloadOlCoverUseCase,
    this._olGetWorkUseCase,
    this._downloadGtdCoverUseCase,
    // this._validateBookFormUseCase,
  ) : super(const BookEditorActionState());

  Future<void> downloadCover({
    required String source,
    bool isGutenbergUrl = false,
  }) async {
    emit(state.copyWith(isCoverDownloading: true));
    final Either<Failure, DownloadCoverResult> result;

    if (isGutenbergUrl) {
      result = await _downloadGtdCoverUseCase(source);
    } else {
      result = await _downloadOlCoverUseCase(
        DownloadCoverParams(value: source, type: OlCoverType.coverId),
      );
    }

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

  Future<void> _downLoadCover() async {}

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
