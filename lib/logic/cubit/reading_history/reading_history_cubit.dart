import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/reading_session/repositories/reading_session_repository.dart';
import 'package:leafy/logic/cubit/reading_history/reading_history_state.dart';

@injectable
class ReadingHistoryCubit extends Cubit<ReadingHistoryState> {
  final ReadingSessionRepository _repository;

  ReadingHistoryCubit(this._repository)
    : super(const ReadingHistoryState.initial());

  Future<void> loadData(int bookId) async {
    emit(const ReadingHistoryState.loading());
    try {
      final summary = await _repository.getHistorySummaryByBookId(bookId);
      final sessions = await _repository.getSessionsWithResourceByBookId(
        bookId,
      );

      if (summary.sessionCount == 0) {
        emit(const ReadingHistoryState.empty());
      } else {
        emit(ReadingHistoryState.loaded(summary: summary, sessions: sessions));
      }
    } catch (e) {
      emit(ReadingHistoryState.error('Failed to load reading history: $e'));
    }
  }

  void changeGroupBy(ReadingHistoryGroupBy groupBy) {
    state.mapOrNull(
      loaded: (state) {
        emit(state.copyWith(groupBy: groupBy));
      },
    );
  }

  void filterByResource(String? resourceFormat) {
    state.mapOrNull(
      loaded: (state) {
        emit(state.copyWith(selectedResourceFormat: resourceFormat));
      },
    );
  }
}
