import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';
import 'package:leafy/domain/gutendex/usecases/gtd_get_books.dart';
import 'package:leafy/domain/gutendex/usecases/params/gtd_get_books_params.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_gtd_bloc.freezed.dart';
part 'search_gtd_event.dart';
part 'search_gtd_state.dart';

const _scrollThreshold = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class SearchGtdBloc extends Bloc<SearchGtdEvent, SearchGtdState> {
  final GtdGetBooksUseCase _getGtdBooksUseCase;

  CancelToken? _cancelToken;

  SearchGtdBloc(this._getGtdBooksUseCase) : super(const SearchGtdState()) {
    on<_Fetched>(_onFetched, transformer: throttleDroppable(_scrollThreshold));
  }

  Future<void> _onFetched(_Fetched event, Emitter<SearchGtdState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (_cancelToken == null || _cancelToken!.isCancelled) {
        _cancelToken = CancelToken();
      }

      if (state.status == SearchGtdStatus.initial) {
        final result = await _getGtdBooksUseCase(
          GtdGetBooksParams(page: 1, cancelToken: _cancelToken),
        );

        result.fold(
          (failure) => emit(
            state.copyWith(
              status: SearchGtdStatus.failure,
              errorMessage: failure.message,
            ),
          ),
          (data) => emit(
            state.copyWith(
              status: SearchGtdStatus.success,
              books: data.results,
              hasReachedMax: data.next == null,
              nextPage: 2,
            ),
          ),
        );
        return;
      }

      // Logic Load More
      final result = await _getGtdBooksUseCase(
        GtdGetBooksParams(page: state.nextPage),
      );

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: SearchGtdStatus.failure,
            errorMessage: failure.message,
          ),
        ),
        (data) {
          if (data.results.isEmpty) {
            emit(state.copyWith(hasReachedMax: true));
          } else {
            emit(
              state.copyWith(
                status: SearchGtdStatus.success,
                books: List.of(state.books)..addAll(data.results),
                hasReachedMax: data.next == null,
                nextPage: state.nextPage + 1,
              ),
            );
          }
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchGtdStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel('Screen closed');
    return super.close();
  }
}
