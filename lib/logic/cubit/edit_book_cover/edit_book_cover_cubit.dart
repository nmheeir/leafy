import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/ol_cover_type.dart';
import 'package:leafy/core/utils/helpers/blurhash_util.dart';
import 'package:leafy/domain/book/usecases/download_ol_cover.dart';
import 'package:leafy/domain/book/usecases/params/download_cover_params.dart';
import 'package:leafy/main.dart';

part 'edit_book_cover_state.dart';
part 'edit_book_cover_cubit.freezed.dart';

@injectable
class EditBookCoverCubit extends Cubit<EditBookCoverState> {
  final DownloadOlCoverUseCase _downloadCoverUseCase;

  EditBookCoverCubit(this._downloadCoverUseCase)
    : super(const EditBookCoverState());

  void initialize({Uint8List? currentCover, String? currentBlurHash}) {
    emit(
      state.copyWith(
        status: EditCoverStatus.initial,
        coverData: currentCover,
        blurHash: currentBlurHash,
        errorMessage: null,
      ),
    );
  }

  Future<void> setCoverImage(Uint8List? imageBytes) async {
    emit(state.copyWith(status: EditCoverStatus.loading));

    try {
      imageCache.clear();
      final blurHash = await generateBlurHash(imageBytes);

      emit(
        state.copyWith(
          status: EditCoverStatus.success,
          coverData: imageBytes,
          blurHash: blurHash,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EditCoverStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// Gọi API lấy ảnh từ OpenLibrary
  Future<void> loadFromOpenLibrary(String isbn) async {
    emit(state.copyWith(status: EditCoverStatus.loading));

    final result = await _downloadCoverUseCase(
      DownloadCoverParams(value: isbn, type: OlCoverType.isbn),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: EditCoverStatus.failure,
            errorMessage: failure.toString(),
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            status: EditCoverStatus.success,
            coverData: data.imageBytes,
            blurHash: data.blurHash,
            errorMessage: null,
          ),
        );
      },
    );
    imageCache.clear();
  }

  /// Xóa ảnh
  Future<void> deleteCover(int? bookID) async {
    emit(state.copyWith(status: EditCoverStatus.loading));

    try {
      if (bookID != null) {
        final file = File('${appDocumentsDirectory.path}/$bookID.jpg');
        if (await file.exists()) {
          await file.delete();
        }
      }

      imageCache.clear();

      emit(
        state.copyWith(
          status: EditCoverStatus.deleted,
          coverData: null,
          blurHash: null,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EditCoverStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
