// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ol_search_result_doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OLSearchResultDocModel _$OLSearchResultDocModelFromJson(
  Map<String, dynamic> json,
) => _OLSearchResultDocModel(
  key: json['key'] as String?,
  type: json['type'] as String?,
  seed: (json['seed'] as List<dynamic>?)?.map((e) => e as String).toList(),
  title: json['title'] as String?,
  titleSuggest: json['title_suggest'] as String?,
  editionCount: (json['edition_count'] as num?)?.toInt(),
  editionKey: (json['edition_key'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  publishDate: (json['publish_date'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  publishYear: (json['publish_year'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  firstPublishYear: (json['first_publish_year'] as num?)?.toInt(),
  medianPages: (json['median_pages'] as num?)?.toInt(),
  lccn: (json['lccn'] as List<dynamic>?)?.map((e) => e as String).toList(),
  publishPlace: (json['publish_place'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  oclc: (json['oclc'] as List<dynamic>?)?.map((e) => e as String).toList(),
  contributor: (json['contributor'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  lcc: (json['lcc'] as List<dynamic>?)?.map((e) => e as String).toList(),
  ddc: (json['ddc'] as List<dynamic>?)?.map((e) => e as String).toList(),
  isbn: (json['isbn'] as List<dynamic>?)?.map((e) => e as String).toList(),
  lastModifiedI: (json['last_modified_i'] as num?)?.toInt(),
  ebookCountI: (json['ebook_count_i'] as num?)?.toInt(),
  ebookAccess: $enumDecodeNullable(_$EbookAccessEnumMap, json['ebook_access']),
  hasFulltext: json['has_fulltext'] as bool?,
  publicScanB: json['public_scan_b'] as bool?,
  ia: (json['ia'] as List<dynamic>?)?.map((e) => e as String).toList(),
  iaCollection: (json['ia_collection'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  iaCollectionS: json['ia_collection_s'] as String?,
  lendingEditionS: json['lending_edition_s'] as String?,
  lendingIdentifierS: json['lending_identifier_s'] as String?,
  printdisabledS: json['printdisabled_s'] as String?,
  coverEditionKey: json['cover_edition_key'] as String?,
  coverI: (json['cover_i'] as num?)?.toInt(),
  firstSentence: (json['first_sentence'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  publisher: (json['publisher'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  language: (json['language'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  authorKey: (json['author_key'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  authorName: (json['author_name'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  authorAlternativeName: (json['author_alternative_name'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  person: (json['person'] as List<dynamic>?)?.map((e) => e as String).toList(),
  place: (json['place'] as List<dynamic>?)?.map((e) => e as String).toList(),
  subject: (json['subject'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idAlibrisId: (json['id_alibris_id'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idAmazon: (json['id_amazon'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idBodleianOxfordUniversity:
      (json['id_bodleian_oxford_university'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  idDepsitoLegal: (json['id_depsito_legal'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idGoodreads: (json['id_goodreads'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idGoogle: (json['id_google'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idHathiTrust: (json['id_hathi_trust'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idLibrarything: (json['id_librarything'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idPaperbackSwap: (json['id_paperback_swap'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idWikidata: (json['id_wikidata'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idYakaboo: (json['id_yakaboo'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  iaLoadedId: (json['ia_loaded_id'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  iaBoxId: (json['ia_box_id'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  publisherFacet: (json['publisher_facet'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  personKey: (json['person_key'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  placeKey: (json['place_key'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  personFacet: (json['person_facet'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  subjectFacet: (json['subject_facet'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  version: (json['version'] as num?)?.toDouble(),
  placeFacet: (json['place_facet'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  lccSort: json['lcc_sort'] as String?,
  authorFacet: (json['author_facet'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  subjectKey: (json['subject_key'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ddcSort: json['ddc_sort'] as String?,
  idAmazonCaAsin: (json['id_amazon_ca_asin'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idAmazonCoUkAsin: (json['id_amazon_co_uk_asin'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idAmazonDeAsin: (json['id_amazon_de_asin'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idAmazonItAsin: (json['id_amazon_it_asin'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idCanadianNationalLibraryArchive:
      (json['id_canadian_national_library_archive'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  idOverdrive: (json['id_overdrive'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idAbebooksDe: (json['id_abebooks_de'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idBritishLibrary: (json['id_british_library'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  idBritishNationalBibliography:
      (json['id_british_national_bibliography'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
  timeFacet: (json['time_facet'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  timeKey: (json['time_key'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  subtitle: json['subtitle'] as String?,
);

Map<String, dynamic> _$OLSearchResultDocModelToJson(
  _OLSearchResultDocModel instance,
) => <String, dynamic>{
  'key': instance.key,
  'type': instance.type,
  'seed': instance.seed,
  'title': instance.title,
  'title_suggest': instance.titleSuggest,
  'edition_count': instance.editionCount,
  'edition_key': instance.editionKey,
  'publish_date': instance.publishDate,
  'publish_year': instance.publishYear,
  'first_publish_year': instance.firstPublishYear,
  'median_pages': instance.medianPages,
  'lccn': instance.lccn,
  'publish_place': instance.publishPlace,
  'oclc': instance.oclc,
  'contributor': instance.contributor,
  'lcc': instance.lcc,
  'ddc': instance.ddc,
  'isbn': instance.isbn,
  'last_modified_i': instance.lastModifiedI,
  'ebook_count_i': instance.ebookCountI,
  'ebook_access': _$EbookAccessEnumMap[instance.ebookAccess],
  'has_fulltext': instance.hasFulltext,
  'public_scan_b': instance.publicScanB,
  'ia': instance.ia,
  'ia_collection': instance.iaCollection,
  'ia_collection_s': instance.iaCollectionS,
  'lending_edition_s': instance.lendingEditionS,
  'lending_identifier_s': instance.lendingIdentifierS,
  'printdisabled_s': instance.printdisabledS,
  'cover_edition_key': instance.coverEditionKey,
  'cover_i': instance.coverI,
  'first_sentence': instance.firstSentence,
  'publisher': instance.publisher,
  'language': instance.language,
  'author_key': instance.authorKey,
  'author_name': instance.authorName,
  'author_alternative_name': instance.authorAlternativeName,
  'person': instance.person,
  'place': instance.place,
  'subject': instance.subject,
  'id_alibris_id': instance.idAlibrisId,
  'id_amazon': instance.idAmazon,
  'id_bodleian_oxford_university': instance.idBodleianOxfordUniversity,
  'id_depsito_legal': instance.idDepsitoLegal,
  'id_goodreads': instance.idGoodreads,
  'id_google': instance.idGoogle,
  'id_hathi_trust': instance.idHathiTrust,
  'id_librarything': instance.idLibrarything,
  'id_paperback_swap': instance.idPaperbackSwap,
  'id_wikidata': instance.idWikidata,
  'id_yakaboo': instance.idYakaboo,
  'ia_loaded_id': instance.iaLoadedId,
  'ia_box_id': instance.iaBoxId,
  'publisher_facet': instance.publisherFacet,
  'person_key': instance.personKey,
  'place_key': instance.placeKey,
  'person_facet': instance.personFacet,
  'subject_facet': instance.subjectFacet,
  'version': instance.version,
  'place_facet': instance.placeFacet,
  'lcc_sort': instance.lccSort,
  'author_facet': instance.authorFacet,
  'subject_key': instance.subjectKey,
  'ddc_sort': instance.ddcSort,
  'id_amazon_ca_asin': instance.idAmazonCaAsin,
  'id_amazon_co_uk_asin': instance.idAmazonCoUkAsin,
  'id_amazon_de_asin': instance.idAmazonDeAsin,
  'id_amazon_it_asin': instance.idAmazonItAsin,
  'id_canadian_national_library_archive':
      instance.idCanadianNationalLibraryArchive,
  'id_overdrive': instance.idOverdrive,
  'id_abebooks_de': instance.idAbebooksDe,
  'id_british_library': instance.idBritishLibrary,
  'id_british_national_bibliography': instance.idBritishNationalBibliography,
  'time': instance.time,
  'time_facet': instance.timeFacet,
  'time_key': instance.timeKey,
  'subtitle': instance.subtitle,
};

const _$EbookAccessEnumMap = {
  EbookAccess.borrowable: 'borrowable',
  EbookAccess.noEbook: 'no_ebook',
  EbookAccess.public: 'public',
  EbookAccess.printdisabled: 'printdisabled',
};
