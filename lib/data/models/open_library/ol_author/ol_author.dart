import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/open_library/created/created.dart';
import 'package:leafy/data/models/open_library/ol_link/ol_link.dart';
import 'package:leafy/data/models/open_library/ol_type/ol_type.dart';

part 'ol_author.freezed.dart';
part 'ol_author.g.dart';

@freezed
abstract class OLAuthor with _$OLAuthor {
  const factory OLAuthor({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "links") List<OLLink>? links,
    @JsonKey(name: "personal_name") String? personalName,
    @JsonKey(name: "created") Created? created,
    @JsonKey(name: "last_modified") Created? lastModified,
    @JsonKey(name: "latest_revision") int? latestRevision,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "type") OLType? type,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "revision") int? revision,
  }) = _OlAuthor;

  factory OLAuthor.fromJson(Map<String, dynamic> json) =>
      _$OLAuthorFromJson(json);
}
