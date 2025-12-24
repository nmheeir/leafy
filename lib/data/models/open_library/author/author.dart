import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/data/models/open_library/ol_type/ol_type.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
abstract class Author with _$Author {
  const factory Author({
    @JsonKey(name: "type") OLType? type,
    @JsonKey(name: "author") OLType? author,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
