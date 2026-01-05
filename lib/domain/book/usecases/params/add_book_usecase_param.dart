import 'dart:typed_data';

import 'package:leafy/domain/book/entities/book.dart';

class AddBookParams {
  final Book book;
  final Uint8List? cover;

  const AddBookParams({required this.book, this.cover});
}
