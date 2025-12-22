import 'package:freezed_annotation/freezed_annotation.dart';

part 'gtd_format.freezed.dart';
part 'gtd_format.g.dart';

@freezed
abstract class GtdFormat with _$GtdFormat {
  factory GtdFormat({
    @JsonKey(name: 'text/html') required String? textHtml,
    @JsonKey(name: 'application/epub+zip') required String? applicationEpubZip,
    @JsonKey(name: 'application/x-mobipocket-ebook')
    required String? applicationXMobipocketEbook,
    @JsonKey(name: 'text/plain; charset=us-ascii')
    required String? textPlainCharsetUsAscii,
    @JsonKey(name: 'application/rdf+xml') required String? applicationRdfXml,
    @JsonKey(name: 'image/jpeg') required String? imageJpeg,
    @JsonKey(name: 'application/octet-stream')
    required String? applicationOctetStream,
  }) = _GtdFormat;

  factory GtdFormat.fromJson(Map<String, dynamic> json) =>
      _$GtdFormatFromJson(json);
}
