part of 'tag_search_bloc.dart';

@freezed
class TagSearchEvent with _$TagSearchEvent {
  const factory TagSearchEvent.started() = _Started;
  const factory TagSearchEvent.loadTags() = _LoadTags;
  const factory TagSearchEvent.searchTags({
    required String query,
    required List<Tag> excludedTags,
  }) = _SearchTags;
}
