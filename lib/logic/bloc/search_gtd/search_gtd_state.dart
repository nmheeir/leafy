part of 'search_gtd_bloc.dart';

enum SearchGtdStatus { initial, success, failure }

@freezed
abstract class SearchGtdState with _$SearchGtdState {
  const factory SearchGtdState({
    @Default(SearchGtdStatus.initial) SearchGtdStatus status,
    @Default([]) List<GtdBook> books,
    @Default(false) bool hasReachedMax,
    @Default(1) int nextPage,
    String? errorMessage,
  }) = _SearchGtdState;
}
