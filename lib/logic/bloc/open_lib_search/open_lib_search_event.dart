part of 'open_lib_search_bloc.dart';

@freezed
abstract class OpenLibSearchEvent with _$OpenLibSearchEvent {
  const factory OpenLibSearchEvent.queryChanged(String query) = _QueryChanged;

  const factory OpenLibSearchEvent.typeChanged(OLSearchType type) = _TypeChanged;

  const factory OpenLibSearchEvent.loadMore() = _LoadMore;
}
