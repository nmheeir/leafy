import 'package:freezed_annotation/freezed_annotation.dart';

part 'identifiers.freezed.dart';
part 'identifiers.g.dart';

@freezed
abstract class Identifiers with _$Identifiers {
  const factory Identifiers({
    @JsonKey(name: "amazon") List<String>? amazon,
    @JsonKey(name: "google") List<String>? google,
    @JsonKey(name: "librarything") List<String>? librarything,
    @JsonKey(name: "goodreads") List<String>? goodreads,
    @JsonKey(name: "project_gutenberg") List<String>? projectGutenberg,
    @JsonKey(name: "isbn_13") List<String>? isbn13,
    @JsonKey(name: "isbn_10") List<String>? isbn10,
    @JsonKey(name: "oclc") List<String>? oclc,
    @JsonKey(name: "lccn") List<String>? lccn,
  }) = _Identifiers;

  factory Identifiers.fromJson(Map<String, dynamic> json) =>
      _$IdentifiersFromJson(json);
}
