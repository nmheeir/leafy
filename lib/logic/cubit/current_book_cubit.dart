import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/data/models/book.dart';

class CurrentBookCubit extends Cubit<Book> {
  CurrentBookCubit() : super(Book.empty());

  void setBook(Book book) => emit(book);
}
