import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/book_with_details.dart';
import 'package:leafy/domain/book/usecases/get_book_with_details.dart';

part 'book_detail_state.dart';
part 'book_detail_cubit.freezed.dart';

@injectable
class BookDetailCubit extends Cubit<BookDetailState> {
  final GetBookWithDetailsUseCase _getBookWithDetailsUseCase;

  BookDetailCubit(this._getBookWithDetailsUseCase)
    : super(const BookDetailState.initial());

  int? _currentBookId;

  /// Load book with all its details (tags, resources)
  Future<void> loadBook(int id) async {
    _currentBookId = id;
    emit(const BookDetailState.loading());

    final result = await _getBookWithDetailsUseCase(id);

    result.fold(
      (failure) =>
          emit(BookDetailState.error(failure.message ?? 'Lỗi không xác định')),
      (bookWithDetails) => emit(BookDetailState.loaded(bookWithDetails)),
    );
  }

  /// Refresh current book data
  Future<void> refresh() async {
    if (_currentBookId != null) {
      await loadBook(_currentBookId!);
    }
  }

  /// Set book directly from existing data (Optimistic UI)
  /// Used when navigating from a list where basic book data is already available
  void setBook(Book book) {
    _currentBookId = book.id;
    emit(BookDetailState.loaded(BookWithDetails.fromBook(book)));
  }

  /// Set full book with details directly
  void setBookWithDetails(BookWithDetails bookWithDetails) {
    _currentBookId = bookWithDetails.id;
    emit(BookDetailState.loaded(bookWithDetails));
  }

  /// Update only the book part (e.g., after editing)
  void updateBook(Book updatedBook) {
    state.maybeMap(
      loaded: (loadedState) {
        emit(
          BookDetailState.loaded(
            loadedState.bookWithDetails.copyWith(book: updatedBook),
          ),
        );
      },
      orElse: () {
        // If not loaded, just set as new
        setBook(updatedBook);
      },
    );
  }
}
