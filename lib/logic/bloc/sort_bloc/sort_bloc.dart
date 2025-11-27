import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:leafy/core/constants/enums/sort_type.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_event.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_state.dart';

class SortBloc extends HydratedBloc<SortEvent, SortState> {
  final String uniqueId;

  SortBloc({required this.uniqueId, required SortState initialState})
    : super(initialState) {
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

    on<ChangeTagsEvent>(
      (event, emit) =>
          emit(state.copyWith(tags: event.tags, resetTags: event.tags == null)),
    );

    on<ChangeFilterTagsAsAnd>(
      (event, emit) => emit(
        state.copyWith(
          filterTagsAsAnd: event.filterTagsAsAnd,
          filterOutTags: false,
        ),
      ),
    );

    on<ChangeFilterOutTags>(
      (event, emit) => emit(
        state.copyWith(
          filterOutTags: event.filterOutTags,
          filterTagsAsAnd: false,
        ),
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
class SortFinishedBooksBloc extends SortBloc {
  SortFinishedBooksBloc()
    : super(
        uniqueId: 'sort_finished_books',
        initialState: const SortState(
          sortType: SortType.byFinishDate,
          isAsc: false,
          filterTagsAsAnd: false,
          onlyFavorite: false,
        ),
      );
}

// 2. Class cho sách đang đọc
class SortInProgressBooksBloc extends SortBloc {
  SortInProgressBooksBloc()
    : super(
        uniqueId: 'sort_in_progress_books',
        initialState: const SortState(
          sortType: SortType.byStartDate,
          isAsc: false,
          filterTagsAsAnd: false,
          onlyFavorite: false,
        ),
      );
}

// 3. Class cho sách đọc sau
class SortForLaterBooksBloc extends SortBloc {
  SortForLaterBooksBloc()
    : super(
        uniqueId: 'sort_for_later_books',
        initialState: const SortState(
          sortType: SortType.byDateAdded,
          isAsc: false,
          onlyFavorite: false,
          filterTagsAsAnd: false,
        ),
      );
}

// 4. Class cho sách bỏ dở
class SortUnfinishedBooksBloc extends SortBloc {
  SortUnfinishedBooksBloc()
    : super(
        uniqueId: 'sort_unfinished_books',
        initialState: const SortState(
          sortType: SortType.byDateModified,
          isAsc: false,
          onlyFavorite: false,
          filterTagsAsAnd: false,
        ),
      );
}
