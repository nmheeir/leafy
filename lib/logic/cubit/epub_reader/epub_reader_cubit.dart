import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/utils/helpers/epub_helper.dart';
import 'package:leafy/domain/epub_reader/usecases/parse_epub.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';
import 'package:leafy/domain/epub_reader/entities/epub_display_item.dart';
import 'package:leafy/domain/reader_progress/usecases/get_reader_progress_by_path.dart';
import 'package:leafy/domain/reader_progress/usecases/save_reader_progress_by_path.dart';
import 'package:leafy/domain/reading_session/usecases/log_reading_session_by_path.dart';
import 'package:leafy/domain/book/usecases/mark_book_finished.dart';
import 'package:logger/web.dart';
import 'package:uuid/uuid.dart';
import 'package:leafy/domain/translation/usecases/get_translated_chapter.dart';
import 'package:leafy/core/utils/crypto/crypto_utils.dart';

part 'epub_reader_cubit.freezed.dart';
part 'epub_reader_cubit_state.dart';

@lazySingleton
class EpubReaderCubit extends Cubit<EpubReaderCubitState> {
  final ParseEpubUseCase _parseEpubUseCase;
  final SaveReaderProgressByPathUseCase _saveReaderProgressByPathUseCase;
  final GetReaderProgressByPathUseCase _getReaderProgressByPathUseCase;
  final LogReadingSessionByPathUseCase _logSessionUseCase;
  final MarkBookFinishedUseCase _markBookFinishedUseCase;
  final GetTranslatedChapterUseCase _getTranslatedChapterUseCase;
  final Logger _logger;

  String? _currentFilePath;

  // Session State
  String? _sessionId;
  DateTime? _sessionStartTime;
  String? _startLocator;

  final Stopwatch _activeTimer = Stopwatch();
  Timer? _idleTimer;
  Timer? _autoSaveTimer;
  bool _isPaused = false;

  static const _idleTimeout = Duration(minutes: 1);
  static const _autoSaveDuration = Duration(seconds: 30);
  static const _maxSessionDuration = Duration(hours: 6);

  EpubReaderCubit(
    this._parseEpubUseCase,
    this._logger,
    this._saveReaderProgressByPathUseCase,
    this._getReaderProgressByPathUseCase,
    this._logSessionUseCase,
    this._markBookFinishedUseCase,
    this._getTranslatedChapterUseCase,
  ) : super(EpubReaderCubitState.initial());

  void selectChapter(int index) {
    state.mapOrNull(
      loaded: (value) {
        emit(value.copyWith(currentChapterIndex: index));
      },
    );
  }

  Future<void> translateChapter(int chapterIndex) async {
    final loadedState = state.mapOrNull(loaded: (s) => s);
    if (loadedState == null ||
        _currentFilePath == null ||
        loadedState.fileHash == null) {
      return;
    }

    // Check if already translating or successful
    final currentStatus = loadedState.translationStatuses[chapterIndex];
    if (currentStatus == TranslationStatus.translating ||
        currentStatus == TranslationStatus.success) {
      return;
    }

    // Update Status: Loading
    final newStatuses = Map<int, TranslationStatus>.from(
      loadedState.translationStatuses,
    );
    newStatuses[chapterIndex] = TranslationStatus.translating;
    emit(loadedState.copyWith(translationStatuses: newStatuses));

    try {
      final originalParagraphs = EpubHelper.splitToParagraphs(
        loadedState.book.chapters[chapterIndex].body,
      );

      final result = await _getTranslatedChapterUseCase(
        filePath: _currentFilePath!,
        chapterIndex: chapterIndex,
        originalContent: originalParagraphs,
      );

      result.fold(
        (failure) {
          _logger.e('Translate error: $failure');
          final errorStatuses = Map<int, TranslationStatus>.from(
            loadedState.translationStatuses,
          );
          errorStatuses[chapterIndex] = TranslationStatus.error;
          emit(loadedState.copyWith(translationStatuses: errorStatuses));
        },
        (translation) {
          final successStatuses = Map<int, TranslationStatus>.from(
            loadedState.translationStatuses,
          );
          successStatuses[chapterIndex] = TranslationStatus.success;

          final newTranslationMaps = Map<int, Map<String, String>>.from(
            loadedState.translationMaps,
          );
          newTranslationMaps[chapterIndex] = translation.translatedContent;

          // Re-flatten to update UI items if bilingual is on or off (data is available now)
          // Ideally we only re-flatten if we want to show it immediately.
          // Yes, update display items.
          final newDisplayItems = EpubHelper.flattenBook(
            loadedState.book,
            translationMaps: newTranslationMaps,
          );

          emit(
            loadedState.copyWith(
              translationStatuses: successStatuses,
              translationMaps: newTranslationMaps,
              displayItems: newDisplayItems,
            ),
          );
        },
      );
    } catch (e) {
      _logger.e('Unexpected translation error: $e');
      final errorStatuses = Map<int, TranslationStatus>.from(
        loadedState.translationStatuses,
      );
      errorStatuses[chapterIndex] = TranslationStatus.error;
      emit(loadedState.copyWith(translationStatuses: errorStatuses));
    }
  }

  void toggleBilingualMode() {
    state.mapOrNull(
      loaded: (loadedState) {
        emit(loadedState.copyWith(isBilingual: !loadedState.isBilingual));
      },
    );
  }

  Future<void> parseEpub(String filePath) async {
    emit(const EpubReaderCubitState.loading(progress: 0.0));
    _currentFilePath = filePath;

    final result = await _parseEpubUseCase(filePath);

    result.fold(
      (failure) {
        _logger.e(failure.message);

        emit(EpubReaderCubitState.error(message: failure.toString()));
      },
      (epubBook) async {
        _logger.d('Parsed successfully: ${epubBook.title}');

        // Compute/Get File Hash
        String? fileHash;
        try {
          fileHash = await CryptoUtils.getFileMd5(filePath);
        } catch (e) {
          _logger.e('Failed to calculate file hash: $e');
        }

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
          EpubReaderCubitState.loaded(
            book: epubBook,
            displayItems: flatItems,
            currentChapterIndex: chapterIndex,
            currentItemIndex: savedIndex,
            fileHash: fileHash,
          ),
        );

        // Start new reading session
        _startSession(filePath, 'item:$savedIndex');
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

  Future<void> saveProgress(double progress) async {
    final currentState = state;
    _logger.d('currentFilePath: $_currentFilePath');
    if (currentState is! _Loaded || _currentFilePath == null) return;

    _logger.d('Saving progress for ${currentState.book.title}');

    final currentItemIndex = currentState.currentItemIndex;

    // Auto mark as finished if progress is 1.0
    if (progress >= 1.0) {
      markBookAsFinished();
    }

    await _saveReaderProgressByPathUseCase(
      filePath: _currentFilePath!,
      locator: 'item:$currentItemIndex',
      progress: progress,
      lastReadAt: DateTime.now(),
    );
  }

  Future<void> markBookAsFinished() async {
    if (_currentFilePath == null) return;
    _logger.d('Marking book as finished...');
    final result = await _markBookFinishedUseCase(_currentFilePath!);
    result.fold(
      (failure) => _logger.e('Failed to mark book as finished: $failure'),
      (_) => _logger.i('Book marked as finished successfully'),
    );
  }

  void _startSession(String filePath, String startLocator) {
    endSession(); // Ensure any previous session is closed

    _sessionId = const Uuid().v4();
    _sessionStartTime = DateTime.now();
    _startLocator = startLocator;
    _activeTimer.reset();
    _activeTimer.start();

    _logger.d('Started session $_sessionId at $_sessionStartTime');

    // Start idle checking
    _resetIdleTimer();

    // Start auto-save
    _startAutoSaveTimer();
  }

  void onUserInteraction() {
    if (_sessionId == null) return;

    // If was paused due to idle (but not explicit background pause), resume
    if (!_activeTimer.isRunning && !_isPaused) {
      _activeTimer.start();
      _logger.d('Resumed session from idle');
    }

    _resetIdleTimer();
  }

  void pauseSession() {
    if (_sessionId == null || !_activeTimer.isRunning) return;

    _isPaused = true;
    _activeTimer.stop();
    _idleTimer?.cancel();
    _autoSaveTimer?.cancel();
    _logger.d('Paused session. Active duration: ${_activeTimer.elapsed}');

    // Force one last update on pause to save latest state
    _logSession(isFinal: false);
  }

  void resumeSession() {
    if (_sessionId == null || _activeTimer.isRunning) {
      _isPaused = false;
      return;
    }

    _isPaused = false;
    _activeTimer.start();
    _resetIdleTimer();
    _startAutoSaveTimer();
    _logger.d('Resumed session');
  }

  void _resetIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(_idleTimeout, () {
      if (_activeTimer.isRunning) {
        _activeTimer.stop();
        _logger.d('Session idle timeout. Paused timer.');
        // Also pause auto-save when idle to avoid redundant writes
        _autoSaveTimer?.cancel();

        // Log current state
        _logSession(isFinal: false);
      }
    });
  }

  void _startAutoSaveTimer() {
    _autoSaveTimer?.cancel();
    _autoSaveTimer = Timer.periodic(
      _autoSaveDuration,
      (_) => _onAutoSaveTick(),
    );
  }

  void _onAutoSaveTick() {
    if (_sessionId == null || _sessionStartTime == null) return;

    // Check Max Duration
    if (DateTime.now().difference(_sessionStartTime!) > _maxSessionDuration) {
      _logger.w('Session exceeded max duration. Force closing.');
      endSession();
      return;
    }

    _logSession(isFinal: false);
  }

  /// Logs the current session state to DB.
  /// [isFinal] determines if this is the final log (end session).
  /// For ongoing sessions, we log with the current time/duration.
  Future<void> _logSession({required bool isFinal}) async {
    if (_sessionId == null ||
        _currentFilePath == null ||
        _sessionStartTime == null) {
      return;
    }

    final endTime = DateTime.now();
    final durationMs = _activeTimer.elapsedMilliseconds;

    // Get current locator from state
    String? endLocator;
    int? currentChapter;
    state.mapOrNull(
      loaded: (data) {
        endLocator = 'item:${data.currentItemIndex}';
        currentChapter = data.currentChapterIndex;
      },
    );

    try {
      await _logSessionUseCase(
        sessionId: _sessionId!,
        filePath: _currentFilePath!,
        startTime: _sessionStartTime!,
        endTime: endTime,
        durationMs: durationMs,
        startLocator: _startLocator,
        endLocator: endLocator,
        chapterIndex: currentChapter,
      );
      if (isFinal) {
        _logger.d(
          'Logged FINAL session $_sessionId. Duration: ${durationMs}ms',
        );
      }
    } catch (e) {
      _logger.e('Failed to log session (isFinal=$isFinal): $e');
    }
  }

  Future<void> endSession() async {
    if (_sessionId == null ||
        _currentFilePath == null ||
        _sessionStartTime == null) {
      return;
    }

    _activeTimer.stop();
    _autoSaveTimer?.cancel();
    _idleTimer?.cancel();

    await _logSession(isFinal: true);

    _sessionId = null;
    _sessionStartTime = null;
    _startLocator = null;
    _idleTimer?.cancel();
    _autoSaveTimer?.cancel();
    _isPaused = false;
  }

  @override
  Future<void> close() {
    endSession();
    return super.close();
  }
}
