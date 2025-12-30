import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/usecases/get_book.dart';

part 'book_detail_state.dart';
part 'book_detail_cubit.freezed.dart';

@injectable
class BookDetailCubit extends Cubit<BookDetailState> {
  final GetBookUseCase _getBookUseCase;

  BookDetailCubit(this._getBookUseCase)
    : super(const BookDetailState.initial());

  Future<void> loadBook(int id) async {
    emit(const BookDetailState.loading());

    final result = await _getBookUseCase(id);

    result.fold(
      (failure) =>
          emit(BookDetailState.error(failure.message ?? 'Lỗi không xác định')),
      (book) => emit(BookDetailState.loaded(book)),
    );
  }

  // Hàm này dùng khi bạn đã có sẵn data từ màn hình trước (Optimistic UI)
  // Giúp hiển thị ngay lập tức mà không cần chờ DB
  void setBook(Book book) {
    emit(BookDetailState.loaded(book));
  }
}
