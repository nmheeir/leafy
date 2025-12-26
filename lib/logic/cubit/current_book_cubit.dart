import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/data/models/book/book/book.dart';

// NOTE: Cubit này đóng vai trò như một Global State Holder (Nơi lưu trữ trạng thái toàn cục) cho cuốn sách đang được chọn
@injectable
class CurrentBookCubit extends Cubit<Book> {
  CurrentBookCubit() : super(Book.empty());

  void setBook(Book book) => emit(book);
}
