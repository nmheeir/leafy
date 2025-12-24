part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default(OLSearchType.general) OLSearchType searchType,
    @Default([]) List<OLSearchResultDoc> books,
    @Default(false) bool hasReachedMax,
    @Default(0) int page,
    @Default('') String errorMessage,
    @Default('') String currentQuery,
  }) = _SearchState;
}
