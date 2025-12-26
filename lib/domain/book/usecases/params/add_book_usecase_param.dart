import 'dart:typed_data';

import 'package:leafy/domain/book/entities/book.dart';

class AddBookUsecaseParam {
  final Book book;
  final Uint8List? cover;

  const AddBookUsecaseParam({required this.book, this.cover});
}
