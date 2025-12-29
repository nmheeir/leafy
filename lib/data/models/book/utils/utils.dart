import 'dart:io';
import 'dart:typed_data';

import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/main.dart';

File? getCoverFile(int? id) {
  final fileExists = File('${appDocumentsDirectory.path}/$id.jpg').existsSync();

  if (fileExists) {
    return File('${appDocumentsDirectory.path}/$id.jpg');
  } else {
    return null;
  }
}

Future<Uint8List?> getCoverBytes(int? bookId) async {
  final fileExists = File(
    '${appDocumentsDirectory.path}/$bookId.jpg',
  ).existsSync();

  if (fileExists) {
    return File('${appDocumentsDirectory.path}/$bookId.jpg').readAsBytesSync();
  } else {
    return null;
  }
}

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

  final readingsWithFinishDate = book.readings.where(
    (e) => e.finishDate != null,
  );

  if (readingsWithFinishDate.isEmpty) return null;

  return readingsWithFinishDate
      .map((e) => e.finishDate)
      .reduce((value, element) => value!.isAfter(element!) ? value : element);
}
