import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/epub_cache/usecases/get_epub.dart';
import 'package:leafy/domain/epub_cache/usecases/params/get_epub_param.dart';

part 'epub_view_state.dart';
part 'epub_view_cubit.freezed.dart';

@injectable
class EpubViewCubit extends Cubit<EpubViewState> {
  final GetEpubUseCase _getEpubUseCase;
  CancelToken? _cancelToken;

  EpubViewCubit(this._getEpubUseCase) : super(EpubViewState.initial());

  Future<void> loadEpub(String url) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    emit(const EpubViewState.loading(0.0));

    final result = await _getEpubUseCase(
      GetEpubParam(
        url: url,
        cancelToken: _cancelToken,
        forceReload: false,
        onProgress: (progress) {
          if (!isClosed) {
            emit(EpubViewState.loading(progress));
          }
        },
      ),
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        emit(EpubViewState.error(message: failure.toString()));
      },
      (file) {
        emit(EpubViewState.loaded(file));
      },
    );
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
