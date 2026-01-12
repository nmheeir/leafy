import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/usecase/get_book_resource_by_uuid.dart';
import 'package:leafy/domain/book_resource/usecase/params/get_book_resource_by_uuid_params.dart';
import 'package:leafy/domain/epub_cache/usecases/get_epub.dart';
import 'package:leafy/domain/epub_cache/usecases/params/get_epub_param.dart';
import 'package:leafy/domain/epub_cache/usecases/parse_epub.dart';
import 'package:leafy/domain/reader_progress/usecases/params/save_reader_progress_params.dart';
import 'package:leafy/domain/reader_progress/usecases/save_reader_progress.dart';
import 'package:logger/web.dart';

part 'epub_view_cubit.freezed.dart';
part 'epub_view_state.dart';

@injectable
class EpubViewCubit extends Cubit<EpubViewState> {
  final GetEpubUseCase _getEpubUseCase;
  final GetBookResourceByUuidUseCase _getBookResourceByUuidUseCase;
  final SaveReaderProgress _saveReaderProgress;
  final ParseEpubUseCase _parseEpubUseCase;
  final Logger _logger;

  // Dependencies cho việc tracking session có thể được inject thêm vào đây
  // final SaveReadingSession _saveReadingSession;

  CancelToken? _cancelToken;
  Timer? _saveProgressDebounce;

  EpubViewCubit(
    this._getEpubUseCase,
    this._getBookResourceByUuidUseCase,
    this._saveReaderProgress,
    this._parseEpubUseCase,
    this._logger,
  ) : super(const EpubViewState.initial());

  Future<void> init(String resourceUuid) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    emit(const EpubViewState.loading(0.0));

    // 1. Lấy thông tin Resource
    final resourceResult = await _getBookResourceByUuidUseCase(
      GetBookResourceByUuidParams(uuid: resourceUuid),
    );

    await resourceResult.fold(
      (failure) async => emit(EpubViewState.error(message: failure.toString())),
      (resourceOption) async {
        await resourceOption.fold(
          () async =>
              emit(const EpubViewState.error(message: 'Resource not found')),
          (resource) async {
            await _loadEpubFile(resource);
          },
        );
      },
    );
  }

  Future<void> _loadEpubFile(BookResource resource) async {
    // 2. Lấy File Epub thực tế
    // Lưu ý: resource.filePath có thể là URL hoặc local path tùy logic app.
    // Ở đây giả định UseCase xử lý được dựa trên URL/Path.
    final result = await _getEpubUseCase(
      GetEpubParam(
        url: resource.url!,
        cancelToken: _cancelToken,
        forceReload: false,
        onProgress: (progress) {
          if (!isClosed) {
            emit(EpubViewState.loading(progress));
          }
        },
      ),
    );

    result.fold(
      (failure) {
        emit(EpubViewState.error(message: failure.toString()));
      },
      (file) {
        // TODO: Tại bước này, nếu có GetReaderProgressUseCase, hãy gọi nó để lấy `locator`
        // Giả sử chưa có locator (null)
        emit(
          EpubViewState.loaded(
            file: file,
            resource: resource,
            initialLocator: null,
          ),
        );
      },
    );
  }

  Future<void> parseEpub(String filePath) async {
    final result = await _parseEpubUseCase(filePath);

    result.fold(
      (l) {
        _logger.e(l);
      },
      (epubBook) {
        _logger.d('Epub Book: $epubBook');
      },
    );
  }

  /// Gọi hàm này khi người dùng thay đổi vị trí đọc (onRelocated)
  void onPositionChanged(String locator, double progress) {
    final currentState = state;
    if (currentState is! _EpubViewLoaded) return;

    // Chỉ lưu sau khi người dùng dừng cuộn 1 giây
    if (_saveProgressDebounce?.isActive ?? false)
      _saveProgressDebounce!.cancel();
    _saveProgressDebounce = Timer(const Duration(seconds: 1), () {
      _saveProgress(currentState.resource.uuid, locator, progress);
    });
  }

  Future<void> _saveProgress(
    String resourceUuid,
    String locator,
    double progress,
  ) async {
    await _saveReaderProgress(
      SaveReaderProgressParams(
        resourceUuid: resourceUuid,
        locator: locator,
        progress: progress,
        lastReadAt: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    _saveProgressDebounce?.cancel();
    return super.close();
  }
}
