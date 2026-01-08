import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/gutendex/gtd_book_result/gtd_book_result_model.dart';
import 'package:leafy/domain/gutendex/entities/gtd_books.dart';

part 'gtd_books_result_model.freezed.dart';
part 'gtd_books_result_model.g.dart';

@freezed
abstract class GtdBooksResultModel with _$GtdBooksResultModel {
  const GtdBooksResultModel._();

  factory GtdBooksResultModel({
    required int? count,
    required String? next,
    required String? previous,
    required List<GtdBookResultModel> results,
  }) = _GtdBooksResultModel;

  factory GtdBooksResultModel.fromJson(Map<String, dynamic> json) =>
      _$GtdBooksResultModelFromJson(json);

  /// Entity -> Model
  factory GtdBooksResultModel.fromEntity(GtdBooks entity) {
    return GtdBooksResultModel(
      count: entity.count,
      next: entity.next,
      previous: entity.previous,
      results: entity.results.map(GtdBookResultModel.fromEntity).toList(),
    );
  }

  /// Model -> Entity
  GtdBooks toEntity() {
    return GtdBooks(
      count: count,
      next: next,
      previous: previous,
      results: results.map((e) => e.toEntity()).toList(),
    );
  }
}
