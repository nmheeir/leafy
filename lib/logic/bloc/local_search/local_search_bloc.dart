import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/usecases/search_books.dart';
import 'package:rxdart/rxdart.dart';

part 'local_search_bloc.freezed.dart';
part 'local_search_event.dart';
part 'local_search_state.dart';

@injectable
class LocalSearchBloc extends Bloc<LocalSearchEvent, LocalSearchState> {
  final SearchBooksUseCase _searchLocalBooksUseCase;

  LocalSearchBloc(this._searchLocalBooksUseCase)
    : super(const LocalSearchState.initial()) {
    on<_QueryChanged>(
      _onQueryChanged,
      transformer: _debounce(const Duration(milliseconds: 300)),
    );

    on<_Cleared>(_onCleared);
  }

  EventTransformer<T> _debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  Future<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<LocalSearchState> emit,
  ) async {
    final query = event.query.trim();

    // Nếu query rỗng -> Reset về Initial
    if (query.isEmpty) {
      emit(const LocalSearchState.initial());
      return;
    }

    emit(const LocalSearchState.loading());

    // Gọi UseCase
    final result = await _searchLocalBooksUseCase(query);

    result.fold(
      (failure) => emit(
        LocalSearchState.failure(
          failure.message ?? "Lỗi tìm kiếm không xác định",
        ),
      ),
      (books) {
        if (books.isEmpty) {
          emit(const LocalSearchState.empty());
        } else {
          emit(LocalSearchState.loaded(books));
        }
      },
    );
  }

  void _onCleared(_Cleared event, Emitter<LocalSearchState> emit) {
    emit(const LocalSearchState.initial());
  }
}
