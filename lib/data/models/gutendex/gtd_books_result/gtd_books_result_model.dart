import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/gutendex/gtd_book_result/gtd_book_result_model.dart';

part 'gtd_books_result_model.freezed.dart';
part 'gtd_books_result_model.g.dart';

@freezed
abstract class GtdBooksResultModel with _$GtdBooksResultModel {
  factory GtdBooksResultModel({
    required int? count,
    required String? next,
    required String? previous,
    required List<GtdBookResultModel> results,
  }) = _GtdBooksResultModel;

  factory GtdBooksResultModel.fromJson(Map<String, dynamic> json) =>
      _$GtdBooksResultModelFromJson(json);
}
