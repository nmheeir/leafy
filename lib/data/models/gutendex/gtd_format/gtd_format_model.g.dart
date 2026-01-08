// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gtd_format_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GtdFormatModel _$GtdFormatModelFromJson(Map<String, dynamic> json) =>
    _GtdFormatModel(
      textHtml: json['text/html'] as String?,
      applicationEpubZip: json['application/epub+zip'] as String?,
      applicationXMobipocketEbook:
          json['application/x-mobipocket-ebook'] as String?,
      textPlainCharsetUsAscii: json['text/plain; charset=us-ascii'] as String?,
      applicationRdfXml: json['application/rdf+xml'] as String?,
      imageJpeg: json['image/jpeg'] as String?,
      applicationOctetStream: json['application/octet-stream'] as String?,
    );

Map<String, dynamic> _$GtdFormatModelToJson(_GtdFormatModel instance) =>
    <String, dynamic>{
      'text/html': instance.textHtml,
      'application/epub+zip': instance.applicationEpubZip,
      'application/x-mobipocket-ebook': instance.applicationXMobipocketEbook,
      'text/plain; charset=us-ascii': instance.textPlainCharsetUsAscii,
      'application/rdf+xml': instance.applicationRdfXml,
      'image/jpeg': instance.imageJpeg,
      'application/octet-stream': instance.applicationOctetStream,
    };
