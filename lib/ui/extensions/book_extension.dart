import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/reading.dart';

extension BookX on Book {
  Book markAsFinished({required DateTime date, int? rating}) {
    final newReadings = List<Reading>.from(readings);
    if (newReadings.isNotEmpty) {
      newReadings[0] = newReadings[0].copyWith(finishDate: date);
    } else {
      newReadings.add(Reading(finishDate: date));
    }
    return copyWith(
      status: BookStatus.finished,
      rating: rating,
      readings: newReadings,
    );
  }
}
