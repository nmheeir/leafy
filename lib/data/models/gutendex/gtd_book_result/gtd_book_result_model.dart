import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/gutendex/gtd_format/gtd_format_model.dart';
import 'package:leafy/data/models/gutendex/gtd_person/gtd_person_model.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';

part 'gtd_book_result_model.freezed.dart';
part 'gtd_book_result_model.g.dart';

@freezed
abstract class GtdBookResultModel with _$GtdBookResultModel {
  const GtdBookResultModel._();

  const factory GtdBookResultModel({
    required int? id,
    required String? title,
    required List<GtdPersonModel> authors,
    required List<String> summaries,
    required List<GtdPersonModel> editors,
    required List<GtdPersonModel> translators,
    required List<String> subjects,
    required List<String> bookshelves,
    required List<String> languages,
    required bool? copyright,
    @JsonKey(name: 'media_type') required String? mediaType,
    required GtdFormatModel? formats,
    @JsonKey(name: 'download_count') required int? downloadCount,
  }) = _GtdBookResultModel;

  factory GtdBookResultModel.fromJson(Map<String, dynamic> json) =>
      _$GtdBookResultModelFromJson(json);

  /// Entity -> Model
  factory GtdBookResultModel.fromEntity(GtdBook entity) {
    return GtdBookResultModel(
      id: entity.id,
      title: entity.title,
      authors: entity.authors.map(GtdPersonModel.fromEntity).toList(),
      summaries: entity.summaries,
      editors: entity.editors.map(GtdPersonModel.fromEntity).toList(),
      translators: entity.translators.map(GtdPersonModel.fromEntity).toList(),
      subjects: entity.subjects,
      bookshelves: entity.bookshelves,
      languages: entity.languages,
      copyright: entity.copyright,
      mediaType: entity.mediaType,
      formats: entity.formats != null
          ? GtdFormatModel.fromEntity(entity.formats!)
          : null,
      downloadCount: entity.downloadCount,
    );
  }

  /// Model -> Entity
  GtdBook toEntity() {
    return GtdBook(
      id: id,
      title: title,
      authors: authors.map((e) => e.toEntity()).toList(),
      summaries: summaries,
      editors: editors.map((e) => e.toEntity()).toList(),
      translators: translators.map((e) => e.toEntity()).toList(),
      subjects: subjects,
      bookshelves: bookshelves,
      languages: languages,
      copyright: copyright,
      mediaType: mediaType,
      formats: formats?.toEntity(),
      downloadCount: downloadCount,
    );
  }
}
