import 'dart:io';
import 'dart:typed_data';

import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/core/utils/app_globals.dart';

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

/// Returns the start date of the book (directly from book entity)
DateTime? getLatestStartDate(Book book) {
  return book.startDate;
}

/// Returns the finish date of the book (directly from book entity)
DateTime? getLatestFinishDate(Book book) {
  return book.finishDate;
}
