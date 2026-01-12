import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/epub_cache/usecases/get_epub.dart';
import 'package:leafy/domain/epub_cache/usecases/params/get_epub_param.dart';
import 'package:leafy/domain/epub_cache/usecases/parse_epub.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';
import 'package:logger/web.dart';

part 'test_cubit_state.dart';
part 'test_cubit.freezed.dart';

@lazySingleton
class TestCubit extends Cubit<TestCubitState> {
  final ParseEpubUseCase _parseEpubUseCase;
  final GetEpubUseCase _getEpubUseCase;
  final Logger _logger;

  TestCubit(this._parseEpubUseCase, this._logger, this._getEpubUseCase)
    : super(TestCubitState.initial());

  void selectChapter(int index) {
    state.mapOrNull(
      loaded: (value) {
        emit(value.copyWith(currentChapterIndex: index));
      },
    );
  }

  Future<void> loadEpubFile(String filePath) async {
    final result = await _getEpubUseCase(
      GetEpubParam(
        url: filePath,
        forceReload: false,
        onProgress: (progress) {
          if (!isClosed) {
            print('Download progress: $progress %');
          }
        },
      ),
    );

    result.fold(
      (failure) {
        // emit(EpubViewState.error(message: failure.toString()));
      },
      (file) {
        // TODO: Tại bước này, nếu có GetReaderProgressUseCase, hãy gọi nó để lấy `locator`
        // Giả sử chưa có locator (null)
      },
    );
  }

  Future<void> parseEpub(String filePath) async {
    emit(const TestCubitState.loading(progress: 0.0));

    final result = await _parseEpubUseCase(filePath);

    result.fold(
      (failure) {
        _logger.e(failure.message);

        emit(TestCubitState.error(message: failure.toString()));
      },
      (epubBook) {
        _logger.d('Parsed successfully: ${epubBook.title}');

        emit(TestCubitState.loaded(book: epubBook, currentChapterIndex: 0));
      },
    );
  }
}
