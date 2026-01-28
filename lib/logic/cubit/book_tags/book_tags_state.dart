import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

part 'book_tags_state.freezed.dart';

@freezed
class BookTagsState with _$BookTagsState {
  const factory BookTagsState.initial() = _Initial;
  const factory BookTagsState.loading() = _Loading;
  const factory BookTagsState.success(List<Tag> tags) = _Success;
  const factory BookTagsState.failure(String message) = _Failure;
}
