import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/entities/ol_search_result_doc.dart';
import 'package:leafy/domain/usecases/open_lib_usecases/open_lib_search.dart';
import 'package:leafy/domain/usecases/open_lib_usecases/open_lib_search_params.dart';
import 'package:rxdart/rxdart.dart';

import 'package:leafy/core/constants/enums/index.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final OpenLibSearchUseCase _openLibSearchUseCase;
  static const int _pageSize = 20;

  SearchBloc(this._openLibSearchUseCase) : super(const SearchState()) {
    on<_TypeChanged>(_onTypeChanged);

    on<_QueryChanged>(
      _onQueryChanged,
      transformer: _debounce(const Duration(milliseconds: 500)),
    );

    on<_LoadMore>(
      _onLoadMore,
      transformer: _debounce(const Duration(milliseconds: 300)),
    );
  }

  EventTransformer<T> _debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  void _onTypeChanged(_TypeChanged event, Emitter<SearchState> emit) {
    emit(
      state.copyWith(
        searchType: event.type,
        books: [],
        status: SearchStatus.initial,
        page: 0,
        hasReachedMax: false,
        currentQuery: '',
      ),
    );
  }

  Future<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(status: SearchStatus.initial, books: []));
      return;
    }

    emit(
      state.copyWith(
        status: SearchStatus.loading,
        page: 0,
        books: [],
        currentQuery: event.query, // Lưu lại query
      ),
    );

    final nextPage = state.page + 1;
    final offset = nextPage * _pageSize;

    final result = await _openLibSearchUseCase(
      OpenLibSearchParams(
        query: event.query,
        offset: offset,
        limit: _pageSize,
        searchType: state.searchType,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SearchStatus.failure,
          // TODO: Fix
          errorMessage: failure.toString(),
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: SearchStatus.success,
          books: data.docs,
          hasReachedMax: data.docs.length < _pageSize,
          page: 1,
        ),
      ),
    );
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<SearchState> emit) async {
    if (state.hasReachedMax || state.status == SearchStatus.loading) return;

    // Không emit Loading để tránh UI giật, user chỉ thấy list dài ra

    final nextPage = state.page + 1;
    final offset = nextPage * _pageSize;

    final result = await _openLibSearchUseCase(
      OpenLibSearchParams(
        query: state.currentQuery,
        offset: offset,
        limit: _pageSize,
        searchType: state.searchType,
      ),
    );

    result.fold(
      (failure) => {}, // Load more lỗi thì có thể show snackbar hoặc ignore
      (data) => emit(
        state.copyWith(
          // Nối list cũ + list mới
          books: List.of(state.books)..addAll(data.docs),
          hasReachedMax: data.docs.length < _pageSize,
          page: nextPage,
        ),
      ),
    );
  }
}
