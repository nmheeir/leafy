import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/open_library/ol_type/ol_type.dart';

part 'ol_link.freezed.dart';
part 'ol_link.g.dart';

@freezed
abstract class OLLink with _$OLLink {
  const factory OLLink({
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "type") OLType? type,
    @JsonKey(name: "title") String? title,
  }) = _OLLink;

  factory OLLink.fromJson(Map<String, dynamic> json) => _$OLLinkFromJson(json);
}
