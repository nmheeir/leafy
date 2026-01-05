import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/open_library/classifications/classifications.dart';
import 'package:leafy/data/models/open_library/contributor/contributor.dart';
import 'package:leafy/data/models/open_library/created/created.dart';
import 'package:leafy/data/models/open_library/identifiers/identifiers.dart';
import 'package:leafy/data/models/open_library/toc/toc.dart';
import 'package:leafy/data/models/open_library/ol_type/ol_type.dart';

part 'ol_book.freezed.dart';
part 'ol_book.g.dart';

@freezed
abstract class OpenLibraryBook with _$OpenLibraryBook {
  const factory OpenLibraryBook({
    @JsonKey(name: "number_of_pages") int? numberOfPages,
    @JsonKey(name: "table_of_contents") List<TableOfContent>? tableOfContents,
    @JsonKey(name: "contributors") List<Contributor>? contributors,
    @JsonKey(name: "isbn_10") List<String>? isbn10,
    @JsonKey(name: "covers") List<int>? covers,
    @JsonKey(name: "lc_classifications") List<String>? lcClassifications,
    @JsonKey(name: "ocaid") String? ocaid,
    @JsonKey(name: "weight") String? weight,
    @JsonKey(name: "source_records") List<String>? sourceRecords,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "languages") List<OLType>? languages,
    @JsonKey(name: "subjects") List<String>? subjects,
    @JsonKey(name: "publish_country") String? publishCountry,
    @JsonKey(name: "by_statement") String? byStatement,
    @JsonKey(name: "oclc_numbers") List<String>? oclcNumbers,
    @JsonKey(name: "type") OLType? type,
    @JsonKey(name: "physical_dimensions") String? physicalDimensions,
    @JsonKey(name: "publishers") List<String>? publishers,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "physical_format") String? physicalFormat,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "authors") List<OLType>? authors,
    @JsonKey(name: "publish_places") List<String>? publishPlaces,
    @JsonKey(name: "pagination") String? pagination,
    @JsonKey(name: "classifications") Classifications? classifications,
    @JsonKey(name: "lccn") List<String>? lccn,
    @JsonKey(name: "notes") String? notes,
    @JsonKey(name: "identifiers") Identifiers? identifiers,
    @JsonKey(name: "isbn_13") List<String>? isbn13,
    @JsonKey(name: "dewey_decimal_class") List<String>? deweyDecimalClass,
    @JsonKey(name: "local_id") List<String>? localId,
    @JsonKey(name: "publish_date") String? publishDate,
    @JsonKey(name: "works") List<OLType>? works,
    @JsonKey(name: "latest_revision") int? latestRevision,
    @JsonKey(name: "revision") int? revision,
    @JsonKey(name: "created") Created? created,
    @JsonKey(name: "last_modified") Created? lastModified,
  }) = _OpenLibraryBook;

  factory OpenLibraryBook.fromJson(Map<String, dynamic> json) =>
      _$OpenLibraryBookFromJson(json);
}
