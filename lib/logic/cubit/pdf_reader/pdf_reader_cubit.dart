import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/reader_progress/usecases/save_reader_progress_by_path.dart';
import 'package:leafy/domain/reading_session/usecases/log_reading_session_by_path.dart';
import 'package:leafy/logic/cubit/pdf_reader/pdf_reader_cubit_state.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:leafy/domain/book_marks/entities/book_mark.dart';
import 'package:leafy/domain/book_marks/usecases/delete_book_mark.dart';
import 'package:leafy/domain/book_marks/usecases/get_book_marks.dart';
import 'package:leafy/domain/book_marks/usecases/save_book_mark.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/reader_progress/usecases/get_reader_progress_by_path.dart';

@injectable
class PdfReaderCubit extends Cubit<PdfReaderCubitState> {
  final BookResourceRepository _resourceRepo;
  final SaveBookMarkUseCase _saveBookMarkUseCase;
  final GetBookMarksUseCase _getBookMarksUseCase;
  final DeleteBookMarkUseCase _deleteBookMarkUseCase;
  final SaveReaderProgressByPathUseCase _saveProgressUseCase;
  final GetReaderProgressByPathUseCase _getProgressUseCase;
  final LogReadingSessionByPathUseCase _logSessionUseCase;
  final Logger _logger;

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

  PdfReaderCubit(
    this._resourceRepo,
    this._saveBookMarkUseCase,
    this._getBookMarksUseCase,
    this._deleteBookMarkUseCase,
    this._saveProgressUseCase,
    this._getProgressUseCase,
    this._logSessionUseCase,
    this._logger,
  ) : super(const PdfReaderCubitState.initial());

  Future<void> load(String filePath) async {
    emit(const PdfReaderCubitState.loading());

    final resourceResult = await _resourceRepo.getResourceByPath(filePath);

    await resourceResult.fold(
      (failure) async {
        emit(
          PdfReaderCubitState.error(
            failure.message ?? 'Failed to load resource',
          ),
        );
      },
      (resourceOption) async {
        final resourceId = resourceOption.fold(() => -1, (r) => r.id ?? -1);
        int savedPage = 1;

        // Fetch saved progress
        final savedProgress = await _getProgressUseCase(filePath);
        if (savedProgress != null && savedProgress.locator.isNotEmpty) {
          // Locator format: "page:{index}"
          final parts = savedProgress.locator.split(':');
          if (parts.length == 2 && parts[0] == 'page') {
            savedPage = int.tryParse(parts[1]) ?? 1;
          }
        }

        if (resourceId == -1) {
          emit(
            PdfReaderCubitState.loaded(
              filePath: filePath,
              resourceId: -1,
              markers: [],
              isLeftPaneShown: false,
              totalPages: 0,
              currentPage: savedPage,
            ),
          );
          _startSession(filePath, 'page:$savedPage');
          return;
        }

        final marksResult = await _getBookMarksUseCase(resourceId);
        final marks = marksResult.getOrElse((l) => []);

        emit(
          PdfReaderCubitState.loaded(
            filePath: filePath,
            resourceId: resourceId,
            markers: marks,
            isLeftPaneShown: false,
            totalPages: 0,
            currentPage: savedPage,
          ),
        );

        _logger.i(
          'Pdf resource loaded: $resourceId. Resuming at page $savedPage',
        );

        _startSession(filePath, 'page:$savedPage');
      },
    );
  }

  void onDocumentReady(int totalPages) {
    state.mapOrNull(
      loaded: (s) {
        emit(s.copyWith(totalPages: totalPages));
      },
    );
  }

  void onPageChanged(int page) {
    state.mapOrNull(
      loaded: (s) {
        emit(s.copyWith(currentPage: page));
        onUserInteraction();
        // saveProgress();
      },
    );
  }

  void toggleLeftPane() {
    state.mapOrNull(
      loaded: (s) {
        emit(s.copyWith(isLeftPaneShown: !s.isLeftPaneShown));
      },
    );
  }

  Future<void> addMarker(BookMark mark) async {
    final s = state.mapOrNull(loaded: (s) => s);
    if (s == null || s.resourceId == -1) return;

    final result = await _saveBookMarkUseCase(mark);
    result.fold((l) => null, (id) {
      final newMark = BookMark(
        id: id,
        resourceId: mark.resourceId,
        pageIndex: mark.pageIndex,
        rects: mark.rects,
        color: mark.color,
        text: mark.text,
        startOffset: mark.startOffset,
        endOffset: mark.endOffset,
      );
      emit(s.copyWith(markers: [...s.markers, newMark]));
    });
  }

  Future<void> deleteMarker(int id) async {
    final s = state.mapOrNull(loaded: (s) => s);
    if (s == null) return;

    await _deleteBookMarkUseCase(id);
    emit(s.copyWith(markers: s.markers.where((m) => m.id != id).toList()));
  }

  // ===========================================================================
  // Session & Progress Logic
  // ===========================================================================

  void _startSession(String filePath, String startLocator) {
    endSession();

    _sessionId = const Uuid().v4();
    _sessionStartTime = DateTime.now();
    _startLocator = startLocator;
    _activeTimer.reset();
    _activeTimer.start();

    _resetIdleTimer();
    _startAutoSaveTimer();
  }

  void onUserInteraction() {
    if (_sessionId == null) return;

    if (!_activeTimer.isRunning && !_isPaused) {
      _activeTimer.start();
    }
    _resetIdleTimer();
  }

  void pauseSession() {
    if (_sessionId == null || !_activeTimer.isRunning) return;

    _isPaused = true;
    _activeTimer.stop();
    _idleTimer?.cancel();
    _autoSaveTimer?.cancel();

    _logSession(isFinal: false);
  }

  void resumeSession() {
    if (_sessionId == null) return;

    _isPaused = false;
    if (!_activeTimer.isRunning) {
      _activeTimer.start();
    }
    _resetIdleTimer();
    _startAutoSaveTimer();
  }

  void _resetIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(_idleTimeout, () {
      if (_activeTimer.isRunning) {
        _activeTimer.stop();
        _autoSaveTimer?.cancel();
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

    if (DateTime.now().difference(_sessionStartTime!) > _maxSessionDuration) {
      endSession();
      return;
    }

    _logSession(isFinal: false);
    saveProgress();
  }

  Future<void> saveProgress() async {
    final s = state.mapOrNull(loaded: (s) => s);
    if (s == null || s.resourceId == -1) return;

    final progress = s.totalPages > 0 ? s.currentPage / s.totalPages : 0.0;

    await _saveProgressUseCase(
      filePath: s.filePath,
      locator: 'page:${s.currentPage}',
      progress: progress,
      lastReadAt: DateTime.now(),
    );
  }

  Future<void> _logSession({required bool isFinal}) async {
    if (_sessionId == null || _sessionStartTime == null) return;

    final s = state.mapOrNull(loaded: (s) => s);
    if (s == null) return;

    final endTime = DateTime.now();
    final durationMs = _activeTimer.elapsedMilliseconds;
    final endLocator = 'page:${s.currentPage}';

    await _logSessionUseCase(
      sessionId: _sessionId!,
      filePath: s.filePath,
      startTime: _sessionStartTime!,
      endTime: endTime,
      durationMs: durationMs,
      startLocator: _startLocator,
      endLocator: endLocator,
      chapterIndex: null,
    );
  }

  Future<void> endSession() async {
    if (_sessionId == null) return;

    _activeTimer.stop();
    _autoSaveTimer?.cancel();
    _idleTimer?.cancel();

    await _logSession(isFinal: true);

    _sessionId = null;
    _sessionStartTime = null;
    _startLocator = null;
    _isPaused = false;
  }

  @override
  Future<void> close() {
    endSession();
    return super.close();
  }
}
