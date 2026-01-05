import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/open_library/ol_search_result_doc/ol_search_result_doc.dart';
import 'package:leafy/domain/open_lib/entities/ol_search_result.dart';

part 'ol_search_result.freezed.dart';
part 'ol_search_result.g.dart';

@freezed
abstract class OLSearchResultModel with _$OLSearchResultModel {
  factory OLSearchResultModel({
    required List<OLSearchResultDocModel> docs,
    int? numFound,
    int? start,
    bool? numFoundExact,
    int? openLibrarySearchResultNumFound,
    String? q,
    dynamic offset,
  }) = _OLSearchResultModel;

  factory OLSearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$OLSearchResultModelFromJson(json);

  const OLSearchResultModel._();

  OLSearchResult toEntity() {
    final docsConvert = docs.map((e) => e.toEntity()).toList();
    return OLSearchResult(
      numFound: numFound,
      start: start,
      numFoundExact: numFoundExact,
      openLibrarySearchResultNumFound: openLibrarySearchResultNumFound,
      q: q,
      offset: offset,
      docs: docsConvert,
    );
  }
}
