import 'package:freezed_annotation/freezed_annotation.dart';

part 'gtd_format.freezed.dart';
part 'gtd_format.g.dart';

@freezed
abstract class GtdFormat with _$GtdFormat {
  factory GtdFormat({
    required String? textHtml,
    required String? applicationEpubZip,
    required String? applicationXMobipocketEbook,
    required String? textPlainCharsetUsAscii,
    required String? applicationRdfXml,
    required String? imageJpeg,
    required String? applicationOctetStream,
  }) = _GtdFormat;

  factory GtdFormat.fromJson(Map<String, dynamic> json) =>
      _$GtdFormatFromJson(json);
}
