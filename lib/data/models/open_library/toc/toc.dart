import 'package:freezed_annotation/freezed_annotation.dart';

part 'toc.freezed.dart';
part 'toc.g.dart';

@freezed
abstract class TableOfContent with _$TableOfContent {
  const factory TableOfContent({
    @JsonKey(name: "level") int? level,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "pagenum") String? pagenum,
  }) = _TableOfContent;

  factory TableOfContent.fromJson(Map<String, dynamic> json) =>
      _$TableOfContentFromJson(json);
}
