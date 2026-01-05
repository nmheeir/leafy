part of 'local_search_bloc.dart';

@freezed
class LocalSearchState with _$LocalSearchState {
  const factory LocalSearchState.initial() = _Initial;
  const factory LocalSearchState.loading() = _Loading;
  const factory LocalSearchState.loaded(List<Book> books) = _Loaded;
  const factory LocalSearchState.empty() = _Empty;
  const factory LocalSearchState.failure(String message) = _Failure;
}
