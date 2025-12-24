part of 'search_bloc.dart';

@freezed
abstract class SearchEvent with _$SearchEvent {
  const factory SearchEvent.queryChanged(String query) = _QueryChanged;

  const factory SearchEvent.typeChanged(OLSearchType type) = _TypeChanged;

  const factory SearchEvent.loadMore() = _LoadMore;
}
