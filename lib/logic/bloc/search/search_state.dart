part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default(OLSearchType.general) OLSearchType searchType,
    @Default([]) List<OLSearchResultDoc> books,
    @Default(0) int numberOfResults,
    @Default(false) bool hasReachedMax,
    @Default(0) int page,
    @Default('') String errorMessage,
    @Default('') String currentQuery,
    @Default({}) Map<OLSearchType, SearchTabData> cache,
  }) = _SearchState;
}

class SearchTabData {
  final List<OLSearchResultDoc> books;
  final int page;
  final bool hasReachedMax;
  final int numberOfResults;
  final String queryAtMoment;
  final bool hasNoResults;

  const SearchTabData({
    this.books = const [],
    this.page = 0,
    this.hasReachedMax = false,
    this.numberOfResults = 0,
    this.queryAtMoment = '',
    this.hasNoResults = false,
  });
}
