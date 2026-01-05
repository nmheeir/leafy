import 'package:flutter/foundation.dart';
import 'package:leafy/domain/book/entities/book.dart';

class UpdateBookParams {
  final Book book;
  final Uint8List? cover;

  UpdateBookParams({required this.book, this.cover});
}
