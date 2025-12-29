import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/constants/enums/book_status.dart';

class BulkUpdateBooksParams {
  final Set<int> ids;
  final String? author;
  final BookFormat? format;
  final String? tags;
  final BookStatus? status;

  BulkUpdateBooksParams({
    required this.ids,
    this.author,
    this.format,
    this.tags,
    this.status,
  });

  // Kiểm tra xem có trường nào cần update không (để tránh gọi DB vô ích)
  bool get hasUpdates =>
      author != null || format != null || tags != null || status != null;
}
