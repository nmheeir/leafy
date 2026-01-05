// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ol_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenLibraryBook _$OpenLibraryBookFromJson(
  Map<String, dynamic> json,
) => _OpenLibraryBook(
  numberOfPages: (json['number_of_pages'] as num?)?.toInt(),
  tableOfContents: (json['table_of_contents'] as List<dynamic>?)
      ?.map((e) => TableOfContent.fromJson(e as Map<String, dynamic>))
      .toList(),
  contributors: (json['contributors'] as List<dynamic>?)
      ?.map((e) => Contributor.fromJson(e as Map<String, dynamic>))
      .toList(),
  isbn10: (json['isbn_10'] as List<dynamic>?)?.map((e) => e as String).toList(),
  covers: (json['covers'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  lcClassifications: (json['lc_classifications'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ocaid: json['ocaid'] as String?,
  weight: json['weight'] as String?,
  sourceRecords: (json['source_records'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  title: json['title'] as String?,
  languages: (json['languages'] as List<dynamic>?)
      ?.map((e) => OLType.fromJson(e as Map<String, dynamic>))
      .toList(),
  subjects: (json['subjects'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  publishCountry: json['publish_country'] as String?,
  byStatement: json['by_statement'] as String?,
  oclcNumbers: (json['oclc_numbers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  type: json['type'] == null
      ? null
      : OLType.fromJson(json['type'] as Map<String, dynamic>),
  physicalDimensions: json['physical_dimensions'] as String?,
  publishers: (json['publishers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  description: json['description'] as String?,
  physicalFormat: json['physical_format'] as String?,
  key: json['key'] as String?,
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => OLType.fromJson(e as Map<String, dynamic>))
      .toList(),
  publishPlaces: (json['publish_places'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  pagination: json['pagination'] as String?,
  classifications: json['classifications'] == null
      ? null
      : Classifications.fromJson(
          json['classifications'] as Map<String, dynamic>,
        ),
  lccn: (json['lccn'] as List<dynamic>?)?.map((e) => e as String).toList(),
  notes: json['notes'] as String?,
  identifiers: json['identifiers'] == null
      ? null
      : Identifiers.fromJson(json['identifiers'] as Map<String, dynamic>),
  isbn13: (json['isbn_13'] as List<dynamic>?)?.map((e) => e as String).toList(),
  deweyDecimalClass: (json['dewey_decimal_class'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  localId: (json['local_id'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  publishDate: json['publish_date'] as String?,
  works: (json['works'] as List<dynamic>?)
      ?.map((e) => OLType.fromJson(e as Map<String, dynamic>))
      .toList(),
  latestRevision: (json['latest_revision'] as num?)?.toInt(),
  revision: (json['revision'] as num?)?.toInt(),
  created: json['created'] == null
      ? null
      : Created.fromJson(json['created'] as Map<String, dynamic>),
  lastModified: json['last_modified'] == null
      ? null
      : Created.fromJson(json['last_modified'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OpenLibraryBookToJson(_OpenLibraryBook instance) =>
    <String, dynamic>{
      'number_of_pages': instance.numberOfPages,
      'table_of_contents': instance.tableOfContents,
      'contributors': instance.contributors,
      'isbn_10': instance.isbn10,
      'covers': instance.covers,
      'lc_classifications': instance.lcClassifications,
      'ocaid': instance.ocaid,
      'weight': instance.weight,
      'source_records': instance.sourceRecords,
      'title': instance.title,
      'languages': instance.languages,
      'subjects': instance.subjects,
      'publish_country': instance.publishCountry,
      'by_statement': instance.byStatement,
      'oclc_numbers': instance.oclcNumbers,
      'type': instance.type,
      'physical_dimensions': instance.physicalDimensions,
      'publishers': instance.publishers,
      'description': instance.description,
      'physical_format': instance.physicalFormat,
      'key': instance.key,
      'authors': instance.authors,
      'publish_places': instance.publishPlaces,
      'pagination': instance.pagination,
      'classifications': instance.classifications,
      'lccn': instance.lccn,
      'notes': instance.notes,
      'identifiers': instance.identifiers,
      'isbn_13': instance.isbn13,
      'dewey_decimal_class': instance.deweyDecimalClass,
      'local_id': instance.localId,
      'publish_date': instance.publishDate,
      'works': instance.works,
      'latest_revision': instance.latestRevision,
      'revision': instance.revision,
      'created': instance.created,
      'last_modified': instance.lastModified,
    };
