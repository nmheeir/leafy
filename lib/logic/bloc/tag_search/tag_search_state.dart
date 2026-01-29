part of 'tag_search_bloc.dart';

@freezed
abstract class TagSearchState with _$TagSearchState {
  const factory TagSearchState({
    @Default([]) List<Tag> availableTags,
    @Default([]) List<Tag> suggestions,
    @Default(false) bool isLoading,
    String? error,
  }) = _TagSearchState;

  factory TagSearchState.initial() => const TagSearchState();
}
