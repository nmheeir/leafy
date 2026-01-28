import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/reading_session/repositories/reading_session_repository.dart';

part 'reading_history_state.freezed.dart';

enum ReadingHistoryGroupBy { date, resource }

@freezed
class ReadingHistoryState with _$ReadingHistoryState {
  const factory ReadingHistoryState.initial() = _Initial;

  const factory ReadingHistoryState.loading() = _Loading;

  const factory ReadingHistoryState.loaded({
    required ReadingHistorySummary summary,
    required List<SessionWithResource> sessions,
    @Default(ReadingHistoryGroupBy.date) ReadingHistoryGroupBy groupBy,
    String? selectedResourceFormat, // null = all resources
  }) = _Loaded;

  const factory ReadingHistoryState.empty() = _Empty;

  const factory ReadingHistoryState.error(String message) = _Error;
}
