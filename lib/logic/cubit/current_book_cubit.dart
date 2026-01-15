import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book/entities/book.dart';

import 'package:leafy/domain/book/repositories/book_repository.dart';

// NOTE: Cubit này đóng vai trò như một Global State Holder (Nơi lưu trữ trạng thái toàn cục) cho cuốn sách đang được chọn
@injectable
class CurrentBookCubit extends Cubit<Book> {
  final BookRepository _bookRepository;

  CurrentBookCubit(this._bookRepository) : super(Book.empty());

  void setBook(Book book) => emit(book);

  Future<void> refreshBook() async {
    if (state.id == null) return;
    final result = await _bookRepository.getBookById(state.id!);
    result.fold(
      (failure) {}, // Handle error if needed
      (book) => emit(book),
    );
  }
}
