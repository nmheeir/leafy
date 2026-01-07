enum OlCoverType {
  coverId, // tương ứng endpoint /b/id/{id}-{size}.jpg
  isbn,
  olid,
  oclc,
  lccn,
}

extension CoverIdTypeExt on OlCoverType {
  /// Giá trị dùng trong URL của Open Library
  String get apiValue {
    switch (this) {
      case OlCoverType.coverId:
        return 'id';
      case OlCoverType.isbn:
        return 'ISBN';
      case OlCoverType.olid:
        return 'OLID';
      case OlCoverType.oclc:
        return 'OCLC';
      case OlCoverType.lccn:
        return 'LCCN';
    }
  }
}
