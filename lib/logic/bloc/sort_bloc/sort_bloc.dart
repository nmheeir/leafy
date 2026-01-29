import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_event.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_state.dart';

class SortBloc extends HydratedBloc<SortEvent, SortState> {
  final String uniqueId;
  final BookTagRepository bookTagRepository;

  SortBloc({
    required this.uniqueId,
    required SortState initialState,
    required this.bookTagRepository,
  }) : super(initialState) {
    on<ChangeSortTypeEvent>(
      (event, emit) => emit(state.copyWith(sortType: event.sortType)),
    );

    on<ToggleOrderEvent>(
      (event, emit) => emit(state.copyWith(isAsc: !state.isAsc)),
    );

    on<ChangeOnlyFavouriteEvent>(
      (event, emit) => emit(state.copyWith(onlyFavourite: event.onlyFavourite)),
    );

    on<ChangeBookTypeEvent>(
      (event, emit) => emit(
        state.copyWith(
          bookType: event.bookType,
          resetBookType: event.bookType == null,
        ),
      ),
    );

    on<ChangeYearsEvent>(
      (event, emit) => emit(
        state.copyWith(years: event.years, resetYears: event.years == null),
      ),
    );

    on<FilterByTagsChanged>(_onFilterByTagsChanged);
  }

  Future<void> _onFilterByTagsChanged(
    FilterByTagsChanged event,
    Emitter<SortState> emit,
  ) async {
    // 1. Update UI state immediately (optimistic UI or loading?)
    // Currently, list update is reactive to state changes.
    // If tags are empty, clear filter.
    if (event.tags.isEmpty) {
      emit(
        state.copyWith(
          selectedTags: [],
          filterMode: TagFilterMode.any,
          resetFilteredBookIds: true,
        ),
      );
      return;
    }

    // 2. Query Repository based on mode
    final tagIds = event.tags.map((e) => e.id!).toList();

    Set<int>? matchingIds;

    if (event.mode == TagFilterMode.any) {
      final result = await bookTagRepository.getBooksWithAnyTag(tagIds);
      result.fold(
        (l) {}, // Handle error?
        (books) => matchingIds = books.map((b) => b.id!).toSet(),
      );
    } else if (event.mode == TagFilterMode.all) {
      final result = await bookTagRepository.getBooksWithAllTags(tagIds);
      result.fold(
        (l) {},
        (books) => matchingIds = books.map((b) => b.id!).toSet(),
      );
    } else if (event.mode == TagFilterMode.exclude) {
      final result = await bookTagRepository.getBooksWithAnyTag(tagIds);
      result.fold(
        (l) {},
        (books) => matchingIds = books.map((b) => b.id!).toSet(),
      );
    }

    emit(
      state.copyWith(
        selectedTags: event.tags,
        filterMode: event.mode,
        filteredBookIds: matchingIds ?? {},
        resetFilteredBookIds: matchingIds == null,
      ),
    );
  }

  @override
  String get id => uniqueId;

  @override
  SortState? fromJson(Map<String, dynamic> json) => SortState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SortState state) => state.toJson();
}

// 1. Class cho sách đã đọc xong
@injectable
class SortFinishedBooksBloc extends SortBloc {
  SortFinishedBooksBloc(BookTagRepository bookTagRepository)
    : super(
        uniqueId: 'sort_finished_books',
        initialState: const SortState(
          sortType: SortType.byFinishDate,
          isAsc: false,
          onlyFavorite: false,
        ),
        bookTagRepository: bookTagRepository,
      );
}

// 2. Class cho sách đang đọc
@injectable
class SortInProgressBooksBloc extends SortBloc {
  SortInProgressBooksBloc(BookTagRepository bookTagRepository)
    : super(
        uniqueId: 'sort_in_progress_books',
        initialState: const SortState(
          sortType: SortType.byStartDate,
          isAsc: false,
          onlyFavorite: false,
        ),
        bookTagRepository: bookTagRepository,
      );
}

// 3. Class cho sách đọc sau
@injectable
class SortForLaterBooksBloc extends SortBloc {
  SortForLaterBooksBloc(BookTagRepository bookTagRepository)
    : super(
        uniqueId: 'sort_for_later_books',
        initialState: const SortState(
          sortType: SortType.byDateAdded,
          isAsc: false,
          onlyFavorite: false,
        ),
        bookTagRepository: bookTagRepository,
      );
}

// 4. Class cho sách bỏ dở
@injectable
class SortUnfinishedBooksBloc extends SortBloc {
  SortUnfinishedBooksBloc(BookTagRepository bookTagRepository)
    : super(
        uniqueId: 'sort_unfinished_books',
        initialState: const SortState(
          sortType: SortType.byDateModified,
          isAsc: false,
          onlyFavorite: false,
        ),
        bookTagRepository: bookTagRepository,
      );
}
