import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

part 'tag_management_state.freezed.dart';

@freezed
abstract class TagManagementState with _$TagManagementState {
  const factory TagManagementState({
    @Default(true) bool isLoading,
    @Default([]) List<Tag> tags,
    @Default({}) Map<Tag, int> tagStats,
    String? error,
  }) = _TagManagementState;
}
