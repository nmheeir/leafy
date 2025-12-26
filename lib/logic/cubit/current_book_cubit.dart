import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/data/models/book/book/book.dart';

@injectable
class CurrentBookCubit extends Cubit<Book> {
  CurrentBookCubit() : super(Book.empty());

  void setBook(Book book) => emit(book);
}
