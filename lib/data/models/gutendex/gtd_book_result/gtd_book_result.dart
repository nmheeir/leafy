import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/gutendex/gtd_format/gtd_format.dart';
import 'package:leafy/data/models/gutendex/gtd_person/gtd_person.dart';

part 'gtd_book_result.freezed.dart';
part 'gtd_book_result.g.dart';

@freezed
abstract class GtdBookResult with _$GtdBookResult {
  const factory GtdBookResult({
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
  }) = _GtdBookResult;

  factory GtdBookResult.fromJson(Map<String, dynamic> json) =>
      _$GtdBookResultFromJson(json);
}
