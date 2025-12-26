import 'package:equatable/equatable.dart';
import 'package:leafy/domain/open_lib/entities/ol_search_result_doc.dart';

class OLSearchResult extends Equatable {
  const OLSearchResult({
    this.numFound,
    this.start,
    this.numFoundExact,
    required this.docs,
    this.openLibrarySearchResultNumFound,
    this.q,
    this.offset,
  });

  final int? numFound;
  final int? start;
  final bool? numFoundExact;
  final List<OLSearchResultDoc> docs;
  final int? openLibrarySearchResultNumFound;
  final String? q;
  final dynamic offset;

  @override
  List<Object?> get props => [
    numFound,
    start,
    numFoundExact,
    docs,
    openLibrarySearchResultNumFound,
    q,
    offset,
  ];
}
