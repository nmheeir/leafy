import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'tag_management_state.dart';

// Cubit để quản lý tag
@injectable
class TagManagementCubit extends Cubit<TagManagementState> {
  final TagRepository _repository;

  TagManagementCubit(this._repository) : super(const TagManagementState()) {
    loadTags();
  }

  Future<void> loadTags() async {
    if (state.tags.isEmpty) {
      emit(state.copyWith(isLoading: true, error: null));
    }

    final tagsResult = await _repository.getAllActiveTags();
    final statsResult = await _repository.getTagStatistics();

    tagsResult.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure.message ?? 'Failed to load tags',
          ),
        );
      },
      (tags) {
        statsResult.fold(
          (failure) {
            emit(state.copyWith(isLoading: false, tags: tags));
          },
          (stats) {
            emit(state.copyWith(isLoading: false, tags: tags, tagStats: stats));
          },
        );
      },
    );
  }

  Future<void> createTag(
    Tag tag, {
    required Function(String) onError,
    required Function() onSuccess,
  }) async {
    final result = await _repository.createTag(tag);
    result.fold(
      (failure) {
        final msg = failure.message ?? 'Failed to create tag';
        emit(state.copyWith(error: msg));
        onError(msg);
      },
      (newTag) {
        onSuccess();
        loadTags();
      },
    );
  }

  Future<void> updateTag(
    Tag tag, {
    required Function(String) onError,
    required Function() onSuccess,
  }) async {
    final result = await _repository.updateTag(tag);
    result.fold(
      (failure) {
        final msg = failure.message ?? 'Failed to update tag';
        emit(state.copyWith(error: msg));
        onError(msg);
      },
      (_) {
        onSuccess();
        loadTags();
      },
    );
  }

  Future<void> deleteTag(
    int tagId, {
    required Function(String) onError,
    required Function() onSuccess,
  }) async {
    final result = await _repository.deleteTag(tagId);
    result.fold(
      (failure) {
        final msg = failure.message ?? 'Failed to delete tag';
        emit(state.copyWith(error: msg));
        onError(msg);
      },
      (_) {
        onSuccess();
        loadTags();
      },
    );
  }
}
