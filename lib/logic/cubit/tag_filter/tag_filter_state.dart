import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

part 'tag_filter_state.freezed.dart';

enum TagFilterStatus { initial, loading, success, failure }

@freezed
abstract class TagFilterState with _$TagFilterState {
  const factory TagFilterState({
    @Default(TagFilterStatus.initial) TagFilterStatus status,
    @Default([]) List<Tag> allTags,
    @Default([]) List<Tag> filteredTags,
    @Default([]) List<Tag> selectedTags,
    @Default(TagFilterMode.any) TagFilterMode filterMode,
    @Default('') String searchQuery,
    String? errorMessage,
  }) = _TagFilterState;
}
