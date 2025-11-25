import 'package:leafy/data/models/book.dart';

DateTime? getLatestStartDate(Book book) {
  if (book.readings.isEmpty) return null;

  final readingsWithStartDate = book.readings.where((e) => e.startDate != null);

  if (readingsWithStartDate.isEmpty) return null;

  return readingsWithStartDate
      .map((e) => e.startDate)
      .reduce((value, element) => value!.isAfter(element!) ? value : element);
}

DateTime? getLatestFinishDate(Book book) {
  if (book.readings.isEmpty) return null;

  final readingsWithFinishDate =
      book.readings.where((e) => e.finishDate != null);

  if (readingsWithFinishDate.isEmpty) return null;

  return readingsWithFinishDate
      .map((e) => e.finishDate)
      .reduce((value, element) => value!.isAfter(element!) ? value : element);
}