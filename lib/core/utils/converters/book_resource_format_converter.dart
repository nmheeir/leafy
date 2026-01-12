import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';

class BookResourceFormatConverter
    implements JsonConverter<BookResourceFormat, String> {
  const BookResourceFormatConverter();

  @override
  BookResourceFormat fromJson(String json) {
    return BookResourceFormat.values.firstWhere(
      (e) => e.name == json,
      orElse: () => BookResourceFormat.epub,
    );
  }

  @override
  String toJson(BookResourceFormat object) {
    return object.name; // 'epub', 'pdf', 'html'
  }
}
