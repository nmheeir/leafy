import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/gutendex/entities/gtd_format.dart';

part 'gtd_format_model.freezed.dart';
part 'gtd_format_model.g.dart';

@freezed
abstract class GtdFormatModel with _$GtdFormatModel {
  const GtdFormatModel._();

  factory GtdFormatModel({
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
  }) = _GtdFormatModel;

  factory GtdFormatModel.fromJson(Map<String, dynamic> json) =>
      _$GtdFormatModelFromJson(json);

  factory GtdFormatModel.fromEntity(GtdFormat entity) {
    return GtdFormatModel(
      textHtml: entity.textHtml,
      applicationEpubZip: entity.applicationEpubZip,
      applicationXMobipocketEbook: entity.applicationXMobipocketEbook,
      textPlainCharsetUsAscii: entity.textPlainCharsetUsAscii,
      applicationRdfXml: entity.applicationRdfXml,
      imageJpeg: entity.imageJpeg,
      applicationOctetStream: entity.applicationOctetStream,
    );
  }

  GtdFormat toEntity() {
    return GtdFormat(
      textHtml: textHtml,
      applicationEpubZip: applicationEpubZip,
      applicationXMobipocketEbook: applicationXMobipocketEbook,
      applicationOctetStream: applicationOctetStream,
      applicationRdfXml: applicationRdfXml,
      imageJpeg: imageJpeg,
      textPlainCharsetUsAscii: textPlainCharsetUsAscii,
    );
  }
}
