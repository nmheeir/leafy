import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'package:leafy/logic/cubit/tag_filter/tag_filter_state.dart';

@injectable
class TagFilterCubit extends Cubit<TagFilterState> {
  final TagRepository _tagRepository;
  late final StreamSubscription<void> _tagSubscription;

  TagFilterCubit(this._tagRepository) : super(const TagFilterState()) {
    loadTags();
    _tagSubscription = _tagRepository.activeTagsStream.listen((_) {
      loadTags();
    });
  }

  @override
  Future<void> close() {
    _tagSubscription.cancel();
    return super.close();
  }

  Future<void> loadTags() async {
    emit(state.copyWith(status: TagFilterStatus.loading));

    final result = await _tagRepository.getAllActiveTags();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: TagFilterStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (tags) => emit(
        state.copyWith(
          status: TagFilterStatus.success,
          allTags: tags,
          filteredTags: _filterTagsByQuery(tags, state.searchQuery),
        ),
      ),
    );
  }

  void search(String query) {
    if (query == state.searchQuery) return;
    emit(
      state.copyWith(
        searchQuery: query,
        filteredTags: _filterTagsByQuery(state.allTags, query),
      ),
    );
  }

  void toggleTag(Tag tag) {
    final currentSelected = List<Tag>.from(state.selectedTags);
    if (currentSelected.any((t) => t.id == tag.id)) {
      currentSelected.removeWhere((t) => t.id == tag.id);
    } else {
      currentSelected.add(tag);
    }
    emit(state.copyWith(selectedTags: currentSelected));
  }

  void changeFilterMode(TagFilterMode mode) {
    emit(state.copyWith(filterMode: mode));
  }

  void clearFilters() {
    emit(
      state.copyWith(
        selectedTags: [],
        searchQuery: '',
        filteredTags: state.allTags,
      ),
    );
  }

  List<Tag> _filterTagsByQuery(List<Tag> tags, String query) {
    if (query.isEmpty) return tags;
    final lowerQuery = query.toLowerCase();
    return tags
        .where((tag) => tag.name.toLowerCase().contains(lowerQuery))
        .toList();
  }
}
