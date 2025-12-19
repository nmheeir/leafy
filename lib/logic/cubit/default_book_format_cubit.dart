import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_format.dart';

@injectable
class DefaultBookFormatCubit extends HydratedCubit<BookFormat> {
  DefaultBookFormatCubit() : super(BookFormat.paperback);

  void setBookFormat(BookFormat bookFormat) => emit(bookFormat);

  @override
  BookFormat? fromJson(Map<String, dynamic> json) {
    return parseBookFormat(json['default_book_format']);
  }

  @override
  Map<String, dynamic>? toJson(BookFormat state) {
    return {'default_book_format': state.value};
  }
}
