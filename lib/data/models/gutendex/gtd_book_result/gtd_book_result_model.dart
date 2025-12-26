import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/gutendex/gtd_format/gtd_format.dart';
import 'package:leafy/data/models/gutendex/gtd_person/gtd_person.dart';

part 'gtd_book_result_model.freezed.dart';
part 'gtd_book_result_model.g.dart';

@freezed
abstract class GtdBookResultModel with _$GtdBookResultModel {
  const factory GtdBookResultModel({
    required int? id,
    required String? title,
    required List<GtdPerson> authors,
    required List<String> summaries,
    required List<GtdPerson> editors,
    required List<GtdPerson> translators,
    required List<String> subjects,
    required List<String> bookshelves,
    required List<String> languages,
    required bool? copyright,
    @JsonKey(name: 'media_type') required String? mediaType,
    required GtdFormat? formats,
    @JsonKey(name: 'download_count') required int? downloadCount,
  }) = _GtdBookResultModel;

  factory GtdBookResultModel.fromJson(Map<String, dynamic> json) =>
      _$GtdBookResultModelFromJson(json);
}
