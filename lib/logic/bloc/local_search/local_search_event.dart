part of 'local_search_bloc.dart';

@freezed
class LocalSearchEvent with _$LocalSearchEvent {
  const factory LocalSearchEvent.queryChanged(String query) = _QueryChanged;
  const factory LocalSearchEvent.cleared() = _Cleared;
}
