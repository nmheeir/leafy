import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'tag_search_event.dart';
part 'tag_search_state.dart';
part 'tag_search_bloc.freezed.dart';

EventTransformer<E> _debounceRestartable<E>(Duration duration) {
  return (events, mapper) =>
      restartable<E>()(events.debounce(duration), mapper);
}

class TagSearchBloc extends Bloc<TagSearchEvent, TagSearchState> {
  final TagRepository _tagRepository;

  TagSearchBloc({required TagRepository tagRepository})
    : _tagRepository = tagRepository,
      super(TagSearchState.initial()) {
    on<_LoadTags>(_onLoadTags);
    on<_SearchTags>(
      _onSearchTags,
      transformer: _debounceRestartable(const Duration(milliseconds: 300)),
    );
  }

  Future<void> _onLoadTags(
    _LoadTags event,
    Emitter<TagSearchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _tagRepository.getAllActiveTags();

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (tags) => emit(state.copyWith(isLoading: false, availableTags: tags)),
    );
  }

  void _onSearchTags(_SearchTags event, Emitter<TagSearchState> emit) {
    final query = event.query.toLowerCase().trim();

    if (query.isEmpty) {
      emit(state.copyWith(suggestions: []));
      return;
    }

    final suggestions = state.availableTags
        .where((tag) {
          final matchesName = tag.name.toLowerCase().contains(query);
          final isNotSelected = !event.excludedTags.any((t) => t.id == tag.id);
          // If tag has no ID (unsaved), check by name equality as fallback
          final isNotSelectedByName = !event.excludedTags.any(
            (t) => t.id == null && tag.id == null && t.name == tag.name,
          );

          return matchesName && isNotSelected && isNotSelectedByName;
        })
        .take(8)
        .toList();

    emit(state.copyWith(suggestions: suggestions));
  }
}
