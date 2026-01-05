import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/open_library/author/author.dart';
import 'package:leafy/data/models/open_library/created/created.dart';
import 'package:leafy/data/models/open_library/ol_link/ol_link.dart';
import 'package:leafy/data/models/open_library/ol_type/ol_type.dart';
import 'package:leafy/domain/open_lib/entities/ol_work_result.dart';

part 'ol_work.freezed.dart';
part 'ol_work.g.dart';

@freezed
abstract class OLWork with _$OLWork {
  const factory OLWork({
    @JsonKey(name: "first_publish_date") String? firstPublishDate,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "links") List<OLLink>? links,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "created") Created? created,
    @JsonKey(name: "last_modified") Created? lastModified,
    @JsonKey(name: "covers") List<int>? covers,
    @JsonKey(name: "lc_classifications") List<String>? lcClassifications,
    @JsonKey(name: "latest_revision") int? latestRevision,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "authors") List<Author>? authors,
    @JsonKey(name: "dewey_number") List<String>? deweyNumber,
    @JsonKey(name: "type") OLType? type,
    @JsonKey(name: "subjects") List<String>? subjects,
    @JsonKey(name: "revision") int? revision,
  }) = _OLWork;

  const OLWork._();

  factory OLWork.fromJson(Map<String, dynamic> json) => _$OLWorkFromJson(json);

  OLWorkResult toEntity() {
    return OLWorkResult(key: key, title: title, description: description);
  }
}
