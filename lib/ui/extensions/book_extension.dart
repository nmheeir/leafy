import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/domain/book/entities/book.dart';

extension BookX on Book {
  Book markAsFinished({required DateTime date, int? rating}) {
    return copyWith(
      status: BookStatus.finished,
      finishDate: date,
      rating: rating,
    );
  }
}
