import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/gutendex/gtd_book_result/gtd_book_result.dart';

part 'gtd_books_result.freezed.dart';
part 'gtd_books_result.g.dart';

@freezed
abstract class GtdBooksResult with _$GtdBooksResult {
  factory GtdBooksResult({
    required int? count,
    required String? next,
    required String? previous,
    required List<GtdBookResult> results,
  }) = _GtdBooksResult;

  factory GtdBooksResult.fromJson(Map<String, dynamic> json) =>
      _$GtdBooksResultFromJson(json);
}
