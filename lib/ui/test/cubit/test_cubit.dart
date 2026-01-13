import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/utils/helpers/epub_helper.dart';
import 'package:leafy/domain/epub_file/usecases/parse_epub.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';
import 'package:leafy/domain/epub_reader/entities/epub_display_item.dart';
import 'package:leafy/domain/reader_progress/usecases/get_reader_progress_by_path.dart';
import 'package:leafy/domain/reader_progress/usecases/save_reader_progress_by_path.dart';
import 'package:logger/web.dart';

part 'test_cubit.freezed.dart';
part 'test_cubit_state.dart';

@lazySingleton
class TestCubit extends Cubit<TestCubitState> {
  final ParseEpubUseCase _parseEpubUseCase;
  final SaveReaderProgressByPathUseCase _saveReaderProgressByPathUseCase;
  final GetReaderProgressByPathUseCase _getReaderProgressByPathUseCase;
  final Logger _logger;

  String? _currentFilePath;

  TestCubit(
    this._parseEpubUseCase,
    this._logger,
    this._saveReaderProgressByPathUseCase,
    this._getReaderProgressByPathUseCase,
  ) : super(TestCubitState.initial());

  void selectChapter(int index) {
    state.mapOrNull(
      loaded: (value) {
        emit(value.copyWith(currentChapterIndex: index));
      },
    );
  }

  Future<void> parseEpub(String filePath) async {
    emit(const TestCubitState.loading(progress: 0.0));
    _currentFilePath = filePath;

    final result = await _parseEpubUseCase(filePath);

    result.fold(
      (failure) {
        _logger.e(failure.message);

        emit(TestCubitState.error(message: failure.toString()));
      },
      (epubBook) async {
        _logger.d('Parsed successfully: ${epubBook.title}');

        final flatItems = EpubHelper.flattenBook(epubBook);

        // Logic khôi phục vị trí
        int savedIndex = 0;
        final savedProgress = await _getReaderProgressByPathUseCase(filePath);
        if (savedProgress != null && savedProgress.locator.isNotEmpty) {
          // Locator format: "item:{index}"
          final parts = savedProgress.locator.split(':');
          if (parts.length == 2 && parts[0] == 'item') {
            savedIndex = int.tryParse(parts[1]) ?? 0;
          }
        }

        // Ensure index is valid
        if (savedIndex >= flatItems.length) savedIndex = 0;

        // Find chapter index for the saved item
        int chapterIndex = 0;
        if (savedIndex < flatItems.length) {
          chapterIndex = flatItems[savedIndex].chapterIndex;
        }

        emit(
          TestCubitState.loaded(
            book: epubBook,
            displayItems: flatItems,
            currentChapterIndex: chapterIndex,
            currentItemIndex: savedIndex,
          ),
        );
      },
    );
  }

  void updateReadingPosition(int newChapterIndex, int newItemIndex) {
    state.mapOrNull(
      loaded: (data) {
        if (data.currentItemIndex != newItemIndex ||
            data.currentChapterIndex != newChapterIndex) {
          emit(
            data.copyWith(
              currentChapterIndex: newChapterIndex,
              currentItemIndex: newItemIndex,
            ),
          );
        }
      },
    );
  }

  Future<void> saveProgress() async {
    final currentState = state;
    _logger.d('currentFilePath: $_currentFilePath');
    if (currentState is! _Loaded || _currentFilePath == null) return;

    _logger.d('Saving progress for ${currentState.book.title}');

    final flatItems = currentState.displayItems;
    final currentItemIndex = currentState.currentItemIndex;
    final progress = flatItems.isEmpty
        ? 0.0
        : currentItemIndex / flatItems.length;

    await _saveReaderProgressByPathUseCase(
      filePath: _currentFilePath!,
      locator: 'item:$currentItemIndex',
      progress: progress,
      lastReadAt: DateTime.now(),
    );
  }
}
