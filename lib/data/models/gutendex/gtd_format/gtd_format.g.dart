// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gtd_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GtdFormat _$GtdFormatFromJson(Map<String, dynamic> json) => _GtdFormat(
  textHtml: json['textHtml'] as String?,
  applicationEpubZip: json['applicationEpubZip'] as String?,
  applicationXMobipocketEbook: json['applicationXMobipocketEbook'] as String?,
  textPlainCharsetUsAscii: json['textPlainCharsetUsAscii'] as String?,
  applicationRdfXml: json['applicationRdfXml'] as String?,
  imageJpeg: json['imageJpeg'] as String?,
  applicationOctetStream: json['applicationOctetStream'] as String?,
);

Map<String, dynamic> _$GtdFormatToJson(_GtdFormat instance) =>
    <String, dynamic>{
      'textHtml': instance.textHtml,
      'applicationEpubZip': instance.applicationEpubZip,
      'applicationXMobipocketEbook': instance.applicationXMobipocketEbook,
      'textPlainCharsetUsAscii': instance.textPlainCharsetUsAscii,
      'applicationRdfXml': instance.applicationRdfXml,
      'imageJpeg': instance.imageJpeg,
      'applicationOctetStream': instance.applicationOctetStream,
    };
