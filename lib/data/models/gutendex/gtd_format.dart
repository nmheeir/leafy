class GtdFormat {
  GtdFormat({
    required this.textHtml,
    required this.applicationEpubZip,
    required this.applicationXMobipocketEbook,
    required this.textPlainCharsetUsAscii,
    required this.applicationRdfXml,
    required this.imageJpeg,
    required this.applicationOctetStream,
  });

  final String? textHtml;
  final String? applicationEpubZip;
  final String? applicationXMobipocketEbook;
  final String? textPlainCharsetUsAscii;
  final String? applicationRdfXml;
  final String? imageJpeg;
  final String? applicationOctetStream;

  GtdFormat copyWith({
    String? textHtml,
    String? applicationEpubZip,
    String? applicationXMobipocketEbook,
    String? textPlainCharsetUsAscii,
    String? applicationRdfXml,
    String? imageJpeg,
    String? applicationOctetStream,
  }) {
    return GtdFormat(
      textHtml: textHtml ?? this.textHtml,
      applicationEpubZip: applicationEpubZip ?? this.applicationEpubZip,
      applicationXMobipocketEbook:
          applicationXMobipocketEbook ?? this.applicationXMobipocketEbook,
      textPlainCharsetUsAscii:
          textPlainCharsetUsAscii ?? this.textPlainCharsetUsAscii,
      applicationRdfXml: applicationRdfXml ?? this.applicationRdfXml,
      imageJpeg: imageJpeg ?? this.imageJpeg,
      applicationOctetStream:
          applicationOctetStream ?? this.applicationOctetStream,
    );
  }

  factory GtdFormat.fromJson(Map<String, dynamic> json) {
    return GtdFormat(
      textHtml: json["text/html"],
      applicationEpubZip: json["application/epub+zip"],
      applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
      textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
      applicationRdfXml: json["application/rdf+xml"],
      imageJpeg: json["image/jpeg"],
      applicationOctetStream: json["application/octet-stream"],
    );
  }

  Map<String, dynamic> toJson() => {
    "text/html": textHtml,
    "application/epub+zip": applicationEpubZip,
    "application/x-mobipocket-ebook": applicationXMobipocketEbook,
    "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
    "application/rdf+xml": applicationRdfXml,
    "image/jpeg": imageJpeg,
    "application/octet-stream": applicationOctetStream,
  };

  @override
  String toString() {
    return "$textHtml, $applicationEpubZip, $applicationXMobipocketEbook, $textPlainCharsetUsAscii, $applicationRdfXml, $imageJpeg, $applicationOctetStream, ";
  }
}
