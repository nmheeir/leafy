import 'package:leafy/domain/gutendex/entities/gtd_book.dart';

class GtdBooks {
  final int? count;
  final String? next;
  final String? previous;
  final List<GtdBook> results;

  const GtdBooks({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });
}
