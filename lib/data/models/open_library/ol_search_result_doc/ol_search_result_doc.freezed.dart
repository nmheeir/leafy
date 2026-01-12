// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ol_search_result_doc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OLSearchResultDocModel {

 String? get key; String? get type; List<String>? get seed; String? get title; String? get description;@JsonKey(name: 'title_suggest') String? get titleSuggest;@JsonKey(name: 'edition_count') int? get editionCount;@JsonKey(name: 'edition_key') List<String>? get editionKey;@JsonKey(name: 'publish_date') List<String>? get publishDate;@JsonKey(name: 'publish_year') List<int>? get publishYear;@JsonKey(name: 'first_publish_year') int? get firstPublishYear;@JsonKey(name: 'median_pages') int? get medianPages; List<String>? get lccn;@JsonKey(name: 'publish_place') List<String>? get publishPlace; List<String>? get oclc; List<String>? get contributor; List<String>? get lcc; List<String>? get ddc; List<String>? get isbn;@JsonKey(name: 'last_modified_i') int? get lastModifiedI;@JsonKey(name: 'ebook_count_i') int? get ebookCountI;@JsonKey(name: 'ebook_access') EbookAccess? get ebookAccess;@JsonKey(name: 'has_fulltext') bool? get hasFulltext;@JsonKey(name: 'public_scan_b') bool? get publicScanB; List<String>? get ia;@JsonKey(name: 'ia_collection') List<String>? get iaCollection;@JsonKey(name: 'ia_collection_s') String? get iaCollectionS;@JsonKey(name: 'lending_edition_s') String? get lendingEditionS;@JsonKey(name: 'lending_identifier_s') String? get lendingIdentifierS;@JsonKey(name: 'printdisabled_s') String? get printdisabledS;@JsonKey(name: 'cover_edition_key') String? get coverEditionKey;@JsonKey(name: 'cover_i') int? get coverI;@JsonKey(name: 'first_sentence') List<String>? get firstSentence; List<String>? get publisher; List<String>? get language;@JsonKey(name: 'author_key') List<String>? get authorKey;@JsonKey(name: 'author_name') List<String>? get authorName;@JsonKey(name: 'author_alternative_name') List<String>? get authorAlternativeName; List<String>? get person; List<String>? get place; List<String>? get subject;@JsonKey(name: 'id_alibris_id') List<String>? get idAlibrisId;@JsonKey(name: 'id_amazon') List<String>? get idAmazon;@JsonKey(name: 'id_bodleian_oxford_university') List<String>? get idBodleianOxfordUniversity;@JsonKey(name: 'id_depsito_legal') List<String>? get idDepsitoLegal;@JsonKey(name: 'id_goodreads') List<String>? get idGoodreads;@JsonKey(name: 'id_google') List<String>? get idGoogle;@JsonKey(name: 'id_hathi_trust') List<String>? get idHathiTrust;@JsonKey(name: 'id_librarything') List<String>? get idLibrarything;@JsonKey(name: 'id_paperback_swap') List<String>? get idPaperbackSwap;@JsonKey(name: 'id_wikidata') List<String>? get idWikidata;@JsonKey(name: 'id_yakaboo') List<String>? get idYakaboo;@JsonKey(name: 'ia_loaded_id') List<String>? get iaLoadedId;@JsonKey(name: 'ia_box_id') List<String>? get iaBoxId;@JsonKey(name: 'publisher_facet') List<String>? get publisherFacet;@JsonKey(name: 'person_key') List<String>? get personKey;@JsonKey(name: 'place_key') List<String>? get placeKey;@JsonKey(name: 'person_facet') List<String>? get personFacet;@JsonKey(name: 'subject_facet') List<String>? get subjectFacet; double? get version;@JsonKey(name: 'place_facet') List<String>? get placeFacet;@JsonKey(name: 'lcc_sort') String? get lccSort;@JsonKey(name: 'author_facet') List<String>? get authorFacet;@JsonKey(name: 'subject_key') List<String>? get subjectKey;@JsonKey(name: 'ddc_sort') String? get ddcSort;@JsonKey(name: 'id_amazon_ca_asin') List<String>? get idAmazonCaAsin;@JsonKey(name: 'id_amazon_co_uk_asin') List<String>? get idAmazonCoUkAsin;@JsonKey(name: 'id_amazon_de_asin') List<String>? get idAmazonDeAsin;@JsonKey(name: 'id_amazon_it_asin') List<String>? get idAmazonItAsin;@JsonKey(name: 'id_canadian_national_library_archive') List<String>? get idCanadianNationalLibraryArchive;@JsonKey(name: 'id_overdrive') List<String>? get idOverdrive;@JsonKey(name: 'id_abebooks_de') List<String>? get idAbebooksDe;@JsonKey(name: 'id_british_library') List<String>? get idBritishLibrary;@JsonKey(name: 'id_british_national_bibliography') List<String>? get idBritishNationalBibliography; List<String>? get time;@JsonKey(name: 'time_facet') List<String>? get timeFacet;@JsonKey(name: 'time_key') List<String>? get timeKey; String? get subtitle;
/// Create a copy of OLSearchResultDocModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OLSearchResultDocModelCopyWith<OLSearchResultDocModel> get copyWith => _$OLSearchResultDocModelCopyWithImpl<OLSearchResultDocModel>(this as OLSearchResultDocModel, _$identity);

  /// Serializes this OLSearchResultDocModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OLSearchResultDocModel&&(identical(other.key, key) || other.key == key)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.seed, seed)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.titleSuggest, titleSuggest) || other.titleSuggest == titleSuggest)&&(identical(other.editionCount, editionCount) || other.editionCount == editionCount)&&const DeepCollectionEquality().equals(other.editionKey, editionKey)&&const DeepCollectionEquality().equals(other.publishDate, publishDate)&&const DeepCollectionEquality().equals(other.publishYear, publishYear)&&(identical(other.firstPublishYear, firstPublishYear) || other.firstPublishYear == firstPublishYear)&&(identical(other.medianPages, medianPages) || other.medianPages == medianPages)&&const DeepCollectionEquality().equals(other.lccn, lccn)&&const DeepCollectionEquality().equals(other.publishPlace, publishPlace)&&const DeepCollectionEquality().equals(other.oclc, oclc)&&const DeepCollectionEquality().equals(other.contributor, contributor)&&const DeepCollectionEquality().equals(other.lcc, lcc)&&const DeepCollectionEquality().equals(other.ddc, ddc)&&const DeepCollectionEquality().equals(other.isbn, isbn)&&(identical(other.lastModifiedI, lastModifiedI) || other.lastModifiedI == lastModifiedI)&&(identical(other.ebookCountI, ebookCountI) || other.ebookCountI == ebookCountI)&&(identical(other.ebookAccess, ebookAccess) || other.ebookAccess == ebookAccess)&&(identical(other.hasFulltext, hasFulltext) || other.hasFulltext == hasFulltext)&&(identical(other.publicScanB, publicScanB) || other.publicScanB == publicScanB)&&const DeepCollectionEquality().equals(other.ia, ia)&&const DeepCollectionEquality().equals(other.iaCollection, iaCollection)&&(identical(other.iaCollectionS, iaCollectionS) || other.iaCollectionS == iaCollectionS)&&(identical(other.lendingEditionS, lendingEditionS) || other.lendingEditionS == lendingEditionS)&&(identical(other.lendingIdentifierS, lendingIdentifierS) || other.lendingIdentifierS == lendingIdentifierS)&&(identical(other.printdisabledS, printdisabledS) || other.printdisabledS == printdisabledS)&&(identical(other.coverEditionKey, coverEditionKey) || other.coverEditionKey == coverEditionKey)&&(identical(other.coverI, coverI) || other.coverI == coverI)&&const DeepCollectionEquality().equals(other.firstSentence, firstSentence)&&const DeepCollectionEquality().equals(other.publisher, publisher)&&const DeepCollectionEquality().equals(other.language, language)&&const DeepCollectionEquality().equals(other.authorKey, authorKey)&&const DeepCollectionEquality().equals(other.authorName, authorName)&&const DeepCollectionEquality().equals(other.authorAlternativeName, authorAlternativeName)&&const DeepCollectionEquality().equals(other.person, person)&&const DeepCollectionEquality().equals(other.place, place)&&const DeepCollectionEquality().equals(other.subject, subject)&&const DeepCollectionEquality().equals(other.idAlibrisId, idAlibrisId)&&const DeepCollectionEquality().equals(other.idAmazon, idAmazon)&&const DeepCollectionEquality().equals(other.idBodleianOxfordUniversity, idBodleianOxfordUniversity)&&const DeepCollectionEquality().equals(other.idDepsitoLegal, idDepsitoLegal)&&const DeepCollectionEquality().equals(other.idGoodreads, idGoodreads)&&const DeepCollectionEquality().equals(other.idGoogle, idGoogle)&&const DeepCollectionEquality().equals(other.idHathiTrust, idHathiTrust)&&const DeepCollectionEquality().equals(other.idLibrarything, idLibrarything)&&const DeepCollectionEquality().equals(other.idPaperbackSwap, idPaperbackSwap)&&const DeepCollectionEquality().equals(other.idWikidata, idWikidata)&&const DeepCollectionEquality().equals(other.idYakaboo, idYakaboo)&&const DeepCollectionEquality().equals(other.iaLoadedId, iaLoadedId)&&const DeepCollectionEquality().equals(other.iaBoxId, iaBoxId)&&const DeepCollectionEquality().equals(other.publisherFacet, publisherFacet)&&const DeepCollectionEquality().equals(other.personKey, personKey)&&const DeepCollectionEquality().equals(other.placeKey, placeKey)&&const DeepCollectionEquality().equals(other.personFacet, personFacet)&&const DeepCollectionEquality().equals(other.subjectFacet, subjectFacet)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.placeFacet, placeFacet)&&(identical(other.lccSort, lccSort) || other.lccSort == lccSort)&&const DeepCollectionEquality().equals(other.authorFacet, authorFacet)&&const DeepCollectionEquality().equals(other.subjectKey, subjectKey)&&(identical(other.ddcSort, ddcSort) || other.ddcSort == ddcSort)&&const DeepCollectionEquality().equals(other.idAmazonCaAsin, idAmazonCaAsin)&&const DeepCollectionEquality().equals(other.idAmazonCoUkAsin, idAmazonCoUkAsin)&&const DeepCollectionEquality().equals(other.idAmazonDeAsin, idAmazonDeAsin)&&const DeepCollectionEquality().equals(other.idAmazonItAsin, idAmazonItAsin)&&const DeepCollectionEquality().equals(other.idCanadianNationalLibraryArchive, idCanadianNationalLibraryArchive)&&const DeepCollectionEquality().equals(other.idOverdrive, idOverdrive)&&const DeepCollectionEquality().equals(other.idAbebooksDe, idAbebooksDe)&&const DeepCollectionEquality().equals(other.idBritishLibrary, idBritishLibrary)&&const DeepCollectionEquality().equals(other.idBritishNationalBibliography, idBritishNationalBibliography)&&const DeepCollectionEquality().equals(other.time, time)&&const DeepCollectionEquality().equals(other.timeFacet, timeFacet)&&const DeepCollectionEquality().equals(other.timeKey, timeKey)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,key,type,const DeepCollectionEquality().hash(seed),title,description,titleSuggest,editionCount,const DeepCollectionEquality().hash(editionKey),const DeepCollectionEquality().hash(publishDate),const DeepCollectionEquality().hash(publishYear),firstPublishYear,medianPages,const DeepCollectionEquality().hash(lccn),const DeepCollectionEquality().hash(publishPlace),const DeepCollectionEquality().hash(oclc),const DeepCollectionEquality().hash(contributor),const DeepCollectionEquality().hash(lcc),const DeepCollectionEquality().hash(ddc),const DeepCollectionEquality().hash(isbn),lastModifiedI,ebookCountI,ebookAccess,hasFulltext,publicScanB,const DeepCollectionEquality().hash(ia),const DeepCollectionEquality().hash(iaCollection),iaCollectionS,lendingEditionS,lendingIdentifierS,printdisabledS,coverEditionKey,coverI,const DeepCollectionEquality().hash(firstSentence),const DeepCollectionEquality().hash(publisher),const DeepCollectionEquality().hash(language),const DeepCollectionEquality().hash(authorKey),const DeepCollectionEquality().hash(authorName),const DeepCollectionEquality().hash(authorAlternativeName),const DeepCollectionEquality().hash(person),const DeepCollectionEquality().hash(place),const DeepCollectionEquality().hash(subject),const DeepCollectionEquality().hash(idAlibrisId),const DeepCollectionEquality().hash(idAmazon),const DeepCollectionEquality().hash(idBodleianOxfordUniversity),const DeepCollectionEquality().hash(idDepsitoLegal),const DeepCollectionEquality().hash(idGoodreads),const DeepCollectionEquality().hash(idGoogle),const DeepCollectionEquality().hash(idHathiTrust),const DeepCollectionEquality().hash(idLibrarything),const DeepCollectionEquality().hash(idPaperbackSwap),const DeepCollectionEquality().hash(idWikidata),const DeepCollectionEquality().hash(idYakaboo),const DeepCollectionEquality().hash(iaLoadedId),const DeepCollectionEquality().hash(iaBoxId),const DeepCollectionEquality().hash(publisherFacet),const DeepCollectionEquality().hash(personKey),const DeepCollectionEquality().hash(placeKey),const DeepCollectionEquality().hash(personFacet),const DeepCollectionEquality().hash(subjectFacet),version,const DeepCollectionEquality().hash(placeFacet),lccSort,const DeepCollectionEquality().hash(authorFacet),const DeepCollectionEquality().hash(subjectKey),ddcSort,const DeepCollectionEquality().hash(idAmazonCaAsin),const DeepCollectionEquality().hash(idAmazonCoUkAsin),const DeepCollectionEquality().hash(idAmazonDeAsin),const DeepCollectionEquality().hash(idAmazonItAsin),const DeepCollectionEquality().hash(idCanadianNationalLibraryArchive),const DeepCollectionEquality().hash(idOverdrive),const DeepCollectionEquality().hash(idAbebooksDe),const DeepCollectionEquality().hash(idBritishLibrary),const DeepCollectionEquality().hash(idBritishNationalBibliography),const DeepCollectionEquality().hash(time),const DeepCollectionEquality().hash(timeFacet),const DeepCollectionEquality().hash(timeKey),subtitle]);

@override
String toString() {
  return 'OLSearchResultDocModel(key: $key, type: $type, seed: $seed, title: $title, description: $description, titleSuggest: $titleSuggest, editionCount: $editionCount, editionKey: $editionKey, publishDate: $publishDate, publishYear: $publishYear, firstPublishYear: $firstPublishYear, medianPages: $medianPages, lccn: $lccn, publishPlace: $publishPlace, oclc: $oclc, contributor: $contributor, lcc: $lcc, ddc: $ddc, isbn: $isbn, lastModifiedI: $lastModifiedI, ebookCountI: $ebookCountI, ebookAccess: $ebookAccess, hasFulltext: $hasFulltext, publicScanB: $publicScanB, ia: $ia, iaCollection: $iaCollection, iaCollectionS: $iaCollectionS, lendingEditionS: $lendingEditionS, lendingIdentifierS: $lendingIdentifierS, printdisabledS: $printdisabledS, coverEditionKey: $coverEditionKey, coverI: $coverI, firstSentence: $firstSentence, publisher: $publisher, language: $language, authorKey: $authorKey, authorName: $authorName, authorAlternativeName: $authorAlternativeName, person: $person, place: $place, subject: $subject, idAlibrisId: $idAlibrisId, idAmazon: $idAmazon, idBodleianOxfordUniversity: $idBodleianOxfordUniversity, idDepsitoLegal: $idDepsitoLegal, idGoodreads: $idGoodreads, idGoogle: $idGoogle, idHathiTrust: $idHathiTrust, idLibrarything: $idLibrarything, idPaperbackSwap: $idPaperbackSwap, idWikidata: $idWikidata, idYakaboo: $idYakaboo, iaLoadedId: $iaLoadedId, iaBoxId: $iaBoxId, publisherFacet: $publisherFacet, personKey: $personKey, placeKey: $placeKey, personFacet: $personFacet, subjectFacet: $subjectFacet, version: $version, placeFacet: $placeFacet, lccSort: $lccSort, authorFacet: $authorFacet, subjectKey: $subjectKey, ddcSort: $ddcSort, idAmazonCaAsin: $idAmazonCaAsin, idAmazonCoUkAsin: $idAmazonCoUkAsin, idAmazonDeAsin: $idAmazonDeAsin, idAmazonItAsin: $idAmazonItAsin, idCanadianNationalLibraryArchive: $idCanadianNationalLibraryArchive, idOverdrive: $idOverdrive, idAbebooksDe: $idAbebooksDe, idBritishLibrary: $idBritishLibrary, idBritishNationalBibliography: $idBritishNationalBibliography, time: $time, timeFacet: $timeFacet, timeKey: $timeKey, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $OLSearchResultDocModelCopyWith<$Res>  {
  factory $OLSearchResultDocModelCopyWith(OLSearchResultDocModel value, $Res Function(OLSearchResultDocModel) _then) = _$OLSearchResultDocModelCopyWithImpl;
@useResult
$Res call({
 String? key, String? type, List<String>? seed, String? title, String? description,@JsonKey(name: 'title_suggest') String? titleSuggest,@JsonKey(name: 'edition_count') int? editionCount,@JsonKey(name: 'edition_key') List<String>? editionKey,@JsonKey(name: 'publish_date') List<String>? publishDate,@JsonKey(name: 'publish_year') List<int>? publishYear,@JsonKey(name: 'first_publish_year') int? firstPublishYear,@JsonKey(name: 'median_pages') int? medianPages, List<String>? lccn,@JsonKey(name: 'publish_place') List<String>? publishPlace, List<String>? oclc, List<String>? contributor, List<String>? lcc, List<String>? ddc, List<String>? isbn,@JsonKey(name: 'last_modified_i') int? lastModifiedI,@JsonKey(name: 'ebook_count_i') int? ebookCountI,@JsonKey(name: 'ebook_access') EbookAccess? ebookAccess,@JsonKey(name: 'has_fulltext') bool? hasFulltext,@JsonKey(name: 'public_scan_b') bool? publicScanB, List<String>? ia,@JsonKey(name: 'ia_collection') List<String>? iaCollection,@JsonKey(name: 'ia_collection_s') String? iaCollectionS,@JsonKey(name: 'lending_edition_s') String? lendingEditionS,@JsonKey(name: 'lending_identifier_s') String? lendingIdentifierS,@JsonKey(name: 'printdisabled_s') String? printdisabledS,@JsonKey(name: 'cover_edition_key') String? coverEditionKey,@JsonKey(name: 'cover_i') int? coverI,@JsonKey(name: 'first_sentence') List<String>? firstSentence, List<String>? publisher, List<String>? language,@JsonKey(name: 'author_key') List<String>? authorKey,@JsonKey(name: 'author_name') List<String>? authorName,@JsonKey(name: 'author_alternative_name') List<String>? authorAlternativeName, List<String>? person, List<String>? place, List<String>? subject,@JsonKey(name: 'id_alibris_id') List<String>? idAlibrisId,@JsonKey(name: 'id_amazon') List<String>? idAmazon,@JsonKey(name: 'id_bodleian_oxford_university') List<String>? idBodleianOxfordUniversity,@JsonKey(name: 'id_depsito_legal') List<String>? idDepsitoLegal,@JsonKey(name: 'id_goodreads') List<String>? idGoodreads,@JsonKey(name: 'id_google') List<String>? idGoogle,@JsonKey(name: 'id_hathi_trust') List<String>? idHathiTrust,@JsonKey(name: 'id_librarything') List<String>? idLibrarything,@JsonKey(name: 'id_paperback_swap') List<String>? idPaperbackSwap,@JsonKey(name: 'id_wikidata') List<String>? idWikidata,@JsonKey(name: 'id_yakaboo') List<String>? idYakaboo,@JsonKey(name: 'ia_loaded_id') List<String>? iaLoadedId,@JsonKey(name: 'ia_box_id') List<String>? iaBoxId,@JsonKey(name: 'publisher_facet') List<String>? publisherFacet,@JsonKey(name: 'person_key') List<String>? personKey,@JsonKey(name: 'place_key') List<String>? placeKey,@JsonKey(name: 'person_facet') List<String>? personFacet,@JsonKey(name: 'subject_facet') List<String>? subjectFacet, double? version,@JsonKey(name: 'place_facet') List<String>? placeFacet,@JsonKey(name: 'lcc_sort') String? lccSort,@JsonKey(name: 'author_facet') List<String>? authorFacet,@JsonKey(name: 'subject_key') List<String>? subjectKey,@JsonKey(name: 'ddc_sort') String? ddcSort,@JsonKey(name: 'id_amazon_ca_asin') List<String>? idAmazonCaAsin,@JsonKey(name: 'id_amazon_co_uk_asin') List<String>? idAmazonCoUkAsin,@JsonKey(name: 'id_amazon_de_asin') List<String>? idAmazonDeAsin,@JsonKey(name: 'id_amazon_it_asin') List<String>? idAmazonItAsin,@JsonKey(name: 'id_canadian_national_library_archive') List<String>? idCanadianNationalLibraryArchive,@JsonKey(name: 'id_overdrive') List<String>? idOverdrive,@JsonKey(name: 'id_abebooks_de') List<String>? idAbebooksDe,@JsonKey(name: 'id_british_library') List<String>? idBritishLibrary,@JsonKey(name: 'id_british_national_bibliography') List<String>? idBritishNationalBibliography, List<String>? time,@JsonKey(name: 'time_facet') List<String>? timeFacet,@JsonKey(name: 'time_key') List<String>? timeKey, String? subtitle
});




}
/// @nodoc
class _$OLSearchResultDocModelCopyWithImpl<$Res>
    implements $OLSearchResultDocModelCopyWith<$Res> {
  _$OLSearchResultDocModelCopyWithImpl(this._self, this._then);

  final OLSearchResultDocModel _self;
  final $Res Function(OLSearchResultDocModel) _then;

/// Create a copy of OLSearchResultDocModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? type = freezed,Object? seed = freezed,Object? title = freezed,Object? description = freezed,Object? titleSuggest = freezed,Object? editionCount = freezed,Object? editionKey = freezed,Object? publishDate = freezed,Object? publishYear = freezed,Object? firstPublishYear = freezed,Object? medianPages = freezed,Object? lccn = freezed,Object? publishPlace = freezed,Object? oclc = freezed,Object? contributor = freezed,Object? lcc = freezed,Object? ddc = freezed,Object? isbn = freezed,Object? lastModifiedI = freezed,Object? ebookCountI = freezed,Object? ebookAccess = freezed,Object? hasFulltext = freezed,Object? publicScanB = freezed,Object? ia = freezed,Object? iaCollection = freezed,Object? iaCollectionS = freezed,Object? lendingEditionS = freezed,Object? lendingIdentifierS = freezed,Object? printdisabledS = freezed,Object? coverEditionKey = freezed,Object? coverI = freezed,Object? firstSentence = freezed,Object? publisher = freezed,Object? language = freezed,Object? authorKey = freezed,Object? authorName = freezed,Object? authorAlternativeName = freezed,Object? person = freezed,Object? place = freezed,Object? subject = freezed,Object? idAlibrisId = freezed,Object? idAmazon = freezed,Object? idBodleianOxfordUniversity = freezed,Object? idDepsitoLegal = freezed,Object? idGoodreads = freezed,Object? idGoogle = freezed,Object? idHathiTrust = freezed,Object? idLibrarything = freezed,Object? idPaperbackSwap = freezed,Object? idWikidata = freezed,Object? idYakaboo = freezed,Object? iaLoadedId = freezed,Object? iaBoxId = freezed,Object? publisherFacet = freezed,Object? personKey = freezed,Object? placeKey = freezed,Object? personFacet = freezed,Object? subjectFacet = freezed,Object? version = freezed,Object? placeFacet = freezed,Object? lccSort = freezed,Object? authorFacet = freezed,Object? subjectKey = freezed,Object? ddcSort = freezed,Object? idAmazonCaAsin = freezed,Object? idAmazonCoUkAsin = freezed,Object? idAmazonDeAsin = freezed,Object? idAmazonItAsin = freezed,Object? idCanadianNationalLibraryArchive = freezed,Object? idOverdrive = freezed,Object? idAbebooksDe = freezed,Object? idBritishLibrary = freezed,Object? idBritishNationalBibliography = freezed,Object? time = freezed,Object? timeFacet = freezed,Object? timeKey = freezed,Object? subtitle = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as List<String>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,titleSuggest: freezed == titleSuggest ? _self.titleSuggest : titleSuggest // ignore: cast_nullable_to_non_nullable
as String?,editionCount: freezed == editionCount ? _self.editionCount : editionCount // ignore: cast_nullable_to_non_nullable
as int?,editionKey: freezed == editionKey ? _self.editionKey : editionKey // ignore: cast_nullable_to_non_nullable
as List<String>?,publishDate: freezed == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as List<String>?,publishYear: freezed == publishYear ? _self.publishYear : publishYear // ignore: cast_nullable_to_non_nullable
as List<int>?,firstPublishYear: freezed == firstPublishYear ? _self.firstPublishYear : firstPublishYear // ignore: cast_nullable_to_non_nullable
as int?,medianPages: freezed == medianPages ? _self.medianPages : medianPages // ignore: cast_nullable_to_non_nullable
as int?,lccn: freezed == lccn ? _self.lccn : lccn // ignore: cast_nullable_to_non_nullable
as List<String>?,publishPlace: freezed == publishPlace ? _self.publishPlace : publishPlace // ignore: cast_nullable_to_non_nullable
as List<String>?,oclc: freezed == oclc ? _self.oclc : oclc // ignore: cast_nullable_to_non_nullable
as List<String>?,contributor: freezed == contributor ? _self.contributor : contributor // ignore: cast_nullable_to_non_nullable
as List<String>?,lcc: freezed == lcc ? _self.lcc : lcc // ignore: cast_nullable_to_non_nullable
as List<String>?,ddc: freezed == ddc ? _self.ddc : ddc // ignore: cast_nullable_to_non_nullable
as List<String>?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as List<String>?,lastModifiedI: freezed == lastModifiedI ? _self.lastModifiedI : lastModifiedI // ignore: cast_nullable_to_non_nullable
as int?,ebookCountI: freezed == ebookCountI ? _self.ebookCountI : ebookCountI // ignore: cast_nullable_to_non_nullable
as int?,ebookAccess: freezed == ebookAccess ? _self.ebookAccess : ebookAccess // ignore: cast_nullable_to_non_nullable
as EbookAccess?,hasFulltext: freezed == hasFulltext ? _self.hasFulltext : hasFulltext // ignore: cast_nullable_to_non_nullable
as bool?,publicScanB: freezed == publicScanB ? _self.publicScanB : publicScanB // ignore: cast_nullable_to_non_nullable
as bool?,ia: freezed == ia ? _self.ia : ia // ignore: cast_nullable_to_non_nullable
as List<String>?,iaCollection: freezed == iaCollection ? _self.iaCollection : iaCollection // ignore: cast_nullable_to_non_nullable
as List<String>?,iaCollectionS: freezed == iaCollectionS ? _self.iaCollectionS : iaCollectionS // ignore: cast_nullable_to_non_nullable
as String?,lendingEditionS: freezed == lendingEditionS ? _self.lendingEditionS : lendingEditionS // ignore: cast_nullable_to_non_nullable
as String?,lendingIdentifierS: freezed == lendingIdentifierS ? _self.lendingIdentifierS : lendingIdentifierS // ignore: cast_nullable_to_non_nullable
as String?,printdisabledS: freezed == printdisabledS ? _self.printdisabledS : printdisabledS // ignore: cast_nullable_to_non_nullable
as String?,coverEditionKey: freezed == coverEditionKey ? _self.coverEditionKey : coverEditionKey // ignore: cast_nullable_to_non_nullable
as String?,coverI: freezed == coverI ? _self.coverI : coverI // ignore: cast_nullable_to_non_nullable
as int?,firstSentence: freezed == firstSentence ? _self.firstSentence : firstSentence // ignore: cast_nullable_to_non_nullable
as List<String>?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as List<String>?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as List<String>?,authorKey: freezed == authorKey ? _self.authorKey : authorKey // ignore: cast_nullable_to_non_nullable
as List<String>?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as List<String>?,authorAlternativeName: freezed == authorAlternativeName ? _self.authorAlternativeName : authorAlternativeName // ignore: cast_nullable_to_non_nullable
as List<String>?,person: freezed == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as List<String>?,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as List<String>?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as List<String>?,idAlibrisId: freezed == idAlibrisId ? _self.idAlibrisId : idAlibrisId // ignore: cast_nullable_to_non_nullable
as List<String>?,idAmazon: freezed == idAmazon ? _self.idAmazon : idAmazon // ignore: cast_nullable_to_non_nullable
as List<String>?,idBodleianOxfordUniversity: freezed == idBodleianOxfordUniversity ? _self.idBodleianOxfordUniversity : idBodleianOxfordUniversity // ignore: cast_nullable_to_non_nullable
as List<String>?,idDepsitoLegal: freezed == idDepsitoLegal ? _self.idDepsitoLegal : idDepsitoLegal // ignore: cast_nullable_to_non_nullable
as List<String>?,idGoodreads: freezed == idGoodreads ? _self.idGoodreads : idGoodreads // ignore: cast_nullable_to_non_nullable
as List<String>?,idGoogle: freezed == idGoogle ? _self.idGoogle : idGoogle // ignore: cast_nullable_to_non_nullable
as List<String>?,idHathiTrust: freezed == idHathiTrust ? _self.idHathiTrust : idHathiTrust // ignore: cast_nullable_to_non_nullable
as List<String>?,idLibrarything: freezed == idLibrarything ? _self.idLibrarything : idLibrarything // ignore: cast_nullable_to_non_nullable
as List<String>?,idPaperbackSwap: freezed == idPaperbackSwap ? _self.idPaperbackSwap : idPaperbackSwap // ignore: cast_nullable_to_non_nullable
as List<String>?,idWikidata: freezed == idWikidata ? _self.idWikidata : idWikidata // ignore: cast_nullable_to_non_nullable
as List<String>?,idYakaboo: freezed == idYakaboo ? _self.idYakaboo : idYakaboo // ignore: cast_nullable_to_non_nullable
as List<String>?,iaLoadedId: freezed == iaLoadedId ? _self.iaLoadedId : iaLoadedId // ignore: cast_nullable_to_non_nullable
as List<String>?,iaBoxId: freezed == iaBoxId ? _self.iaBoxId : iaBoxId // ignore: cast_nullable_to_non_nullable
as List<String>?,publisherFacet: freezed == publisherFacet ? _self.publisherFacet : publisherFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,personKey: freezed == personKey ? _self.personKey : personKey // ignore: cast_nullable_to_non_nullable
as List<String>?,placeKey: freezed == placeKey ? _self.placeKey : placeKey // ignore: cast_nullable_to_non_nullable
as List<String>?,personFacet: freezed == personFacet ? _self.personFacet : personFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,subjectFacet: freezed == subjectFacet ? _self.subjectFacet : subjectFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as double?,placeFacet: freezed == placeFacet ? _self.placeFacet : placeFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,lccSort: freezed == lccSort ? _self.lccSort : lccSort // ignore: cast_nullable_to_non_nullable
as String?,authorFacet: freezed == authorFacet ? _self.authorFacet : authorFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,subjectKey: freezed == subjectKey ? _self.subjectKey : subjectKey // ignore: cast_nullable_to_non_nullable
as List<String>?,ddcSort: freezed == ddcSort ? _self.ddcSort : ddcSort // ignore: cast_nullable_to_non_nullable
as String?,idAmazonCaAsin: freezed == idAmazonCaAsin ? _self.idAmazonCaAsin : idAmazonCaAsin // ignore: cast_nullable_to_non_nullable
as List<String>?,idAmazonCoUkAsin: freezed == idAmazonCoUkAsin ? _self.idAmazonCoUkAsin : idAmazonCoUkAsin // ignore: cast_nullable_to_non_nullable
as List<String>?,idAmazonDeAsin: freezed == idAmazonDeAsin ? _self.idAmazonDeAsin : idAmazonDeAsin // ignore: cast_nullable_to_non_nullable
as List<String>?,idAmazonItAsin: freezed == idAmazonItAsin ? _self.idAmazonItAsin : idAmazonItAsin // ignore: cast_nullable_to_non_nullable
as List<String>?,idCanadianNationalLibraryArchive: freezed == idCanadianNationalLibraryArchive ? _self.idCanadianNationalLibraryArchive : idCanadianNationalLibraryArchive // ignore: cast_nullable_to_non_nullable
as List<String>?,idOverdrive: freezed == idOverdrive ? _self.idOverdrive : idOverdrive // ignore: cast_nullable_to_non_nullable
as List<String>?,idAbebooksDe: freezed == idAbebooksDe ? _self.idAbebooksDe : idAbebooksDe // ignore: cast_nullable_to_non_nullable
as List<String>?,idBritishLibrary: freezed == idBritishLibrary ? _self.idBritishLibrary : idBritishLibrary // ignore: cast_nullable_to_non_nullable
as List<String>?,idBritishNationalBibliography: freezed == idBritishNationalBibliography ? _self.idBritishNationalBibliography : idBritishNationalBibliography // ignore: cast_nullable_to_non_nullable
as List<String>?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<String>?,timeFacet: freezed == timeFacet ? _self.timeFacet : timeFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,timeKey: freezed == timeKey ? _self.timeKey : timeKey // ignore: cast_nullable_to_non_nullable
as List<String>?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OLSearchResultDocModel].
extension OLSearchResultDocModelPatterns on OLSearchResultDocModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OLSearchResultDocModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OLSearchResultDocModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OLSearchResultDocModel value)  $default,){
final _that = this;
switch (_that) {
case _OLSearchResultDocModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OLSearchResultDocModel value)?  $default,){
final _that = this;
switch (_that) {
case _OLSearchResultDocModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? key,  String? type,  List<String>? seed,  String? title,  String? description, @JsonKey(name: 'title_suggest')  String? titleSuggest, @JsonKey(name: 'edition_count')  int? editionCount, @JsonKey(name: 'edition_key')  List<String>? editionKey, @JsonKey(name: 'publish_date')  List<String>? publishDate, @JsonKey(name: 'publish_year')  List<int>? publishYear, @JsonKey(name: 'first_publish_year')  int? firstPublishYear, @JsonKey(name: 'median_pages')  int? medianPages,  List<String>? lccn, @JsonKey(name: 'publish_place')  List<String>? publishPlace,  List<String>? oclc,  List<String>? contributor,  List<String>? lcc,  List<String>? ddc,  List<String>? isbn, @JsonKey(name: 'last_modified_i')  int? lastModifiedI, @JsonKey(name: 'ebook_count_i')  int? ebookCountI, @JsonKey(name: 'ebook_access')  EbookAccess? ebookAccess, @JsonKey(name: 'has_fulltext')  bool? hasFulltext, @JsonKey(name: 'public_scan_b')  bool? publicScanB,  List<String>? ia, @JsonKey(name: 'ia_collection')  List<String>? iaCollection, @JsonKey(name: 'ia_collection_s')  String? iaCollectionS, @JsonKey(name: 'lending_edition_s')  String? lendingEditionS, @JsonKey(name: 'lending_identifier_s')  String? lendingIdentifierS, @JsonKey(name: 'printdisabled_s')  String? printdisabledS, @JsonKey(name: 'cover_edition_key')  String? coverEditionKey, @JsonKey(name: 'cover_i')  int? coverI, @JsonKey(name: 'first_sentence')  List<String>? firstSentence,  List<String>? publisher,  List<String>? language, @JsonKey(name: 'author_key')  List<String>? authorKey, @JsonKey(name: 'author_name')  List<String>? authorName, @JsonKey(name: 'author_alternative_name')  List<String>? authorAlternativeName,  List<String>? person,  List<String>? place,  List<String>? subject, @JsonKey(name: 'id_alibris_id')  List<String>? idAlibrisId, @JsonKey(name: 'id_amazon')  List<String>? idAmazon, @JsonKey(name: 'id_bodleian_oxford_university')  List<String>? idBodleianOxfordUniversity, @JsonKey(name: 'id_depsito_legal')  List<String>? idDepsitoLegal, @JsonKey(name: 'id_goodreads')  List<String>? idGoodreads, @JsonKey(name: 'id_google')  List<String>? idGoogle, @JsonKey(name: 'id_hathi_trust')  List<String>? idHathiTrust, @JsonKey(name: 'id_librarything')  List<String>? idLibrarything, @JsonKey(name: 'id_paperback_swap')  List<String>? idPaperbackSwap, @JsonKey(name: 'id_wikidata')  List<String>? idWikidata, @JsonKey(name: 'id_yakaboo')  List<String>? idYakaboo, @JsonKey(name: 'ia_loaded_id')  List<String>? iaLoadedId, @JsonKey(name: 'ia_box_id')  List<String>? iaBoxId, @JsonKey(name: 'publisher_facet')  List<String>? publisherFacet, @JsonKey(name: 'person_key')  List<String>? personKey, @JsonKey(name: 'place_key')  List<String>? placeKey, @JsonKey(name: 'person_facet')  List<String>? personFacet, @JsonKey(name: 'subject_facet')  List<String>? subjectFacet,  double? version, @JsonKey(name: 'place_facet')  List<String>? placeFacet, @JsonKey(name: 'lcc_sort')  String? lccSort, @JsonKey(name: 'author_facet')  List<String>? authorFacet, @JsonKey(name: 'subject_key')  List<String>? subjectKey, @JsonKey(name: 'ddc_sort')  String? ddcSort, @JsonKey(name: 'id_amazon_ca_asin')  List<String>? idAmazonCaAsin, @JsonKey(name: 'id_amazon_co_uk_asin')  List<String>? idAmazonCoUkAsin, @JsonKey(name: 'id_amazon_de_asin')  List<String>? idAmazonDeAsin, @JsonKey(name: 'id_amazon_it_asin')  List<String>? idAmazonItAsin, @JsonKey(name: 'id_canadian_national_library_archive')  List<String>? idCanadianNationalLibraryArchive, @JsonKey(name: 'id_overdrive')  List<String>? idOverdrive, @JsonKey(name: 'id_abebooks_de')  List<String>? idAbebooksDe, @JsonKey(name: 'id_british_library')  List<String>? idBritishLibrary, @JsonKey(name: 'id_british_national_bibliography')  List<String>? idBritishNationalBibliography,  List<String>? time, @JsonKey(name: 'time_facet')  List<String>? timeFacet, @JsonKey(name: 'time_key')  List<String>? timeKey,  String? subtitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OLSearchResultDocModel() when $default != null:
return $default(_that.key,_that.type,_that.seed,_that.title,_that.description,_that.titleSuggest,_that.editionCount,_that.editionKey,_that.publishDate,_that.publishYear,_that.firstPublishYear,_that.medianPages,_that.lccn,_that.publishPlace,_that.oclc,_that.contributor,_that.lcc,_that.ddc,_that.isbn,_that.lastModifiedI,_that.ebookCountI,_that.ebookAccess,_that.hasFulltext,_that.publicScanB,_that.ia,_that.iaCollection,_that.iaCollectionS,_that.lendingEditionS,_that.lendingIdentifierS,_that.printdisabledS,_that.coverEditionKey,_that.coverI,_that.firstSentence,_that.publisher,_that.language,_that.authorKey,_that.authorName,_that.authorAlternativeName,_that.person,_that.place,_that.subject,_that.idAlibrisId,_that.idAmazon,_that.idBodleianOxfordUniversity,_that.idDepsitoLegal,_that.idGoodreads,_that.idGoogle,_that.idHathiTrust,_that.idLibrarything,_that.idPaperbackSwap,_that.idWikidata,_that.idYakaboo,_that.iaLoadedId,_that.iaBoxId,_that.publisherFacet,_that.personKey,_that.placeKey,_that.personFacet,_that.subjectFacet,_that.version,_that.placeFacet,_that.lccSort,_that.authorFacet,_that.subjectKey,_that.ddcSort,_that.idAmazonCaAsin,_that.idAmazonCoUkAsin,_that.idAmazonDeAsin,_that.idAmazonItAsin,_that.idCanadianNationalLibraryArchive,_that.idOverdrive,_that.idAbebooksDe,_that.idBritishLibrary,_that.idBritishNationalBibliography,_that.time,_that.timeFacet,_that.timeKey,_that.subtitle);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? key,  String? type,  List<String>? seed,  String? title,  String? description, @JsonKey(name: 'title_suggest')  String? titleSuggest, @JsonKey(name: 'edition_count')  int? editionCount, @JsonKey(name: 'edition_key')  List<String>? editionKey, @JsonKey(name: 'publish_date')  List<String>? publishDate, @JsonKey(name: 'publish_year')  List<int>? publishYear, @JsonKey(name: 'first_publish_year')  int? firstPublishYear, @JsonKey(name: 'median_pages')  int? medianPages,  List<String>? lccn, @JsonKey(name: 'publish_place')  List<String>? publishPlace,  List<String>? oclc,  List<String>? contributor,  List<String>? lcc,  List<String>? ddc,  List<String>? isbn, @JsonKey(name: 'last_modified_i')  int? lastModifiedI, @JsonKey(name: 'ebook_count_i')  int? ebookCountI, @JsonKey(name: 'ebook_access')  EbookAccess? ebookAccess, @JsonKey(name: 'has_fulltext')  bool? hasFulltext, @JsonKey(name: 'public_scan_b')  bool? publicScanB,  List<String>? ia, @JsonKey(name: 'ia_collection')  List<String>? iaCollection, @JsonKey(name: 'ia_collection_s')  String? iaCollectionS, @JsonKey(name: 'lending_edition_s')  String? lendingEditionS, @JsonKey(name: 'lending_identifier_s')  String? lendingIdentifierS, @JsonKey(name: 'printdisabled_s')  String? printdisabledS, @JsonKey(name: 'cover_edition_key')  String? coverEditionKey, @JsonKey(name: 'cover_i')  int? coverI, @JsonKey(name: 'first_sentence')  List<String>? firstSentence,  List<String>? publisher,  List<String>? language, @JsonKey(name: 'author_key')  List<String>? authorKey, @JsonKey(name: 'author_name')  List<String>? authorName, @JsonKey(name: 'author_alternative_name')  List<String>? authorAlternativeName,  List<String>? person,  List<String>? place,  List<String>? subject, @JsonKey(name: 'id_alibris_id')  List<String>? idAlibrisId, @JsonKey(name: 'id_amazon')  List<String>? idAmazon, @JsonKey(name: 'id_bodleian_oxford_university')  List<String>? idBodleianOxfordUniversity, @JsonKey(name: 'id_depsito_legal')  List<String>? idDepsitoLegal, @JsonKey(name: 'id_goodreads')  List<String>? idGoodreads, @JsonKey(name: 'id_google')  List<String>? idGoogle, @JsonKey(name: 'id_hathi_trust')  List<String>? idHathiTrust, @JsonKey(name: 'id_librarything')  List<String>? idLibrarything, @JsonKey(name: 'id_paperback_swap')  List<String>? idPaperbackSwap, @JsonKey(name: 'id_wikidata')  List<String>? idWikidata, @JsonKey(name: 'id_yakaboo')  List<String>? idYakaboo, @JsonKey(name: 'ia_loaded_id')  List<String>? iaLoadedId, @JsonKey(name: 'ia_box_id')  List<String>? iaBoxId, @JsonKey(name: 'publisher_facet')  List<String>? publisherFacet, @JsonKey(name: 'person_key')  List<String>? personKey, @JsonKey(name: 'place_key')  List<String>? placeKey, @JsonKey(name: 'person_facet')  List<String>? personFacet, @JsonKey(name: 'subject_facet')  List<String>? subjectFacet,  double? version, @JsonKey(name: 'place_facet')  List<String>? placeFacet, @JsonKey(name: 'lcc_sort')  String? lccSort, @JsonKey(name: 'author_facet')  List<String>? authorFacet, @JsonKey(name: 'subject_key')  List<String>? subjectKey, @JsonKey(name: 'ddc_sort')  String? ddcSort, @JsonKey(name: 'id_amazon_ca_asin')  List<String>? idAmazonCaAsin, @JsonKey(name: 'id_amazon_co_uk_asin')  List<String>? idAmazonCoUkAsin, @JsonKey(name: 'id_amazon_de_asin')  List<String>? idAmazonDeAsin, @JsonKey(name: 'id_amazon_it_asin')  List<String>? idAmazonItAsin, @JsonKey(name: 'id_canadian_national_library_archive')  List<String>? idCanadianNationalLibraryArchive, @JsonKey(name: 'id_overdrive')  List<String>? idOverdrive, @JsonKey(name: 'id_abebooks_de')  List<String>? idAbebooksDe, @JsonKey(name: 'id_british_library')  List<String>? idBritishLibrary, @JsonKey(name: 'id_british_national_bibliography')  List<String>? idBritishNationalBibliography,  List<String>? time, @JsonKey(name: 'time_facet')  List<String>? timeFacet, @JsonKey(name: 'time_key')  List<String>? timeKey,  String? subtitle)  $default,) {final _that = this;
switch (_that) {
case _OLSearchResultDocModel():
return $default(_that.key,_that.type,_that.seed,_that.title,_that.description,_that.titleSuggest,_that.editionCount,_that.editionKey,_that.publishDate,_that.publishYear,_that.firstPublishYear,_that.medianPages,_that.lccn,_that.publishPlace,_that.oclc,_that.contributor,_that.lcc,_that.ddc,_that.isbn,_that.lastModifiedI,_that.ebookCountI,_that.ebookAccess,_that.hasFulltext,_that.publicScanB,_that.ia,_that.iaCollection,_that.iaCollectionS,_that.lendingEditionS,_that.lendingIdentifierS,_that.printdisabledS,_that.coverEditionKey,_that.coverI,_that.firstSentence,_that.publisher,_that.language,_that.authorKey,_that.authorName,_that.authorAlternativeName,_that.person,_that.place,_that.subject,_that.idAlibrisId,_that.idAmazon,_that.idBodleianOxfordUniversity,_that.idDepsitoLegal,_that.idGoodreads,_that.idGoogle,_that.idHathiTrust,_that.idLibrarything,_that.idPaperbackSwap,_that.idWikidata,_that.idYakaboo,_that.iaLoadedId,_that.iaBoxId,_that.publisherFacet,_that.personKey,_that.placeKey,_that.personFacet,_that.subjectFacet,_that.version,_that.placeFacet,_that.lccSort,_that.authorFacet,_that.subjectKey,_that.ddcSort,_that.idAmazonCaAsin,_that.idAmazonCoUkAsin,_that.idAmazonDeAsin,_that.idAmazonItAsin,_that.idCanadianNationalLibraryArchive,_that.idOverdrive,_that.idAbebooksDe,_that.idBritishLibrary,_that.idBritishNationalBibliography,_that.time,_that.timeFacet,_that.timeKey,_that.subtitle);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? key,  String? type,  List<String>? seed,  String? title,  String? description, @JsonKey(name: 'title_suggest')  String? titleSuggest, @JsonKey(name: 'edition_count')  int? editionCount, @JsonKey(name: 'edition_key')  List<String>? editionKey, @JsonKey(name: 'publish_date')  List<String>? publishDate, @JsonKey(name: 'publish_year')  List<int>? publishYear, @JsonKey(name: 'first_publish_year')  int? firstPublishYear, @JsonKey(name: 'median_pages')  int? medianPages,  List<String>? lccn, @JsonKey(name: 'publish_place')  List<String>? publishPlace,  List<String>? oclc,  List<String>? contributor,  List<String>? lcc,  List<String>? ddc,  List<String>? isbn, @JsonKey(name: 'last_modified_i')  int? lastModifiedI, @JsonKey(name: 'ebook_count_i')  int? ebookCountI, @JsonKey(name: 'ebook_access')  EbookAccess? ebookAccess, @JsonKey(name: 'has_fulltext')  bool? hasFulltext, @JsonKey(name: 'public_scan_b')  bool? publicScanB,  List<String>? ia, @JsonKey(name: 'ia_collection')  List<String>? iaCollection, @JsonKey(name: 'ia_collection_s')  String? iaCollectionS, @JsonKey(name: 'lending_edition_s')  String? lendingEditionS, @JsonKey(name: 'lending_identifier_s')  String? lendingIdentifierS, @JsonKey(name: 'printdisabled_s')  String? printdisabledS, @JsonKey(name: 'cover_edition_key')  String? coverEditionKey, @JsonKey(name: 'cover_i')  int? coverI, @JsonKey(name: 'first_sentence')  List<String>? firstSentence,  List<String>? publisher,  List<String>? language, @JsonKey(name: 'author_key')  List<String>? authorKey, @JsonKey(name: 'author_name')  List<String>? authorName, @JsonKey(name: 'author_alternative_name')  List<String>? authorAlternativeName,  List<String>? person,  List<String>? place,  List<String>? subject, @JsonKey(name: 'id_alibris_id')  List<String>? idAlibrisId, @JsonKey(name: 'id_amazon')  List<String>? idAmazon, @JsonKey(name: 'id_bodleian_oxford_university')  List<String>? idBodleianOxfordUniversity, @JsonKey(name: 'id_depsito_legal')  List<String>? idDepsitoLegal, @JsonKey(name: 'id_goodreads')  List<String>? idGoodreads, @JsonKey(name: 'id_google')  List<String>? idGoogle, @JsonKey(name: 'id_hathi_trust')  List<String>? idHathiTrust, @JsonKey(name: 'id_librarything')  List<String>? idLibrarything, @JsonKey(name: 'id_paperback_swap')  List<String>? idPaperbackSwap, @JsonKey(name: 'id_wikidata')  List<String>? idWikidata, @JsonKey(name: 'id_yakaboo')  List<String>? idYakaboo, @JsonKey(name: 'ia_loaded_id')  List<String>? iaLoadedId, @JsonKey(name: 'ia_box_id')  List<String>? iaBoxId, @JsonKey(name: 'publisher_facet')  List<String>? publisherFacet, @JsonKey(name: 'person_key')  List<String>? personKey, @JsonKey(name: 'place_key')  List<String>? placeKey, @JsonKey(name: 'person_facet')  List<String>? personFacet, @JsonKey(name: 'subject_facet')  List<String>? subjectFacet,  double? version, @JsonKey(name: 'place_facet')  List<String>? placeFacet, @JsonKey(name: 'lcc_sort')  String? lccSort, @JsonKey(name: 'author_facet')  List<String>? authorFacet, @JsonKey(name: 'subject_key')  List<String>? subjectKey, @JsonKey(name: 'ddc_sort')  String? ddcSort, @JsonKey(name: 'id_amazon_ca_asin')  List<String>? idAmazonCaAsin, @JsonKey(name: 'id_amazon_co_uk_asin')  List<String>? idAmazonCoUkAsin, @JsonKey(name: 'id_amazon_de_asin')  List<String>? idAmazonDeAsin, @JsonKey(name: 'id_amazon_it_asin')  List<String>? idAmazonItAsin, @JsonKey(name: 'id_canadian_national_library_archive')  List<String>? idCanadianNationalLibraryArchive, @JsonKey(name: 'id_overdrive')  List<String>? idOverdrive, @JsonKey(name: 'id_abebooks_de')  List<String>? idAbebooksDe, @JsonKey(name: 'id_british_library')  List<String>? idBritishLibrary, @JsonKey(name: 'id_british_national_bibliography')  List<String>? idBritishNationalBibliography,  List<String>? time, @JsonKey(name: 'time_facet')  List<String>? timeFacet, @JsonKey(name: 'time_key')  List<String>? timeKey,  String? subtitle)?  $default,) {final _that = this;
switch (_that) {
case _OLSearchResultDocModel() when $default != null:
return $default(_that.key,_that.type,_that.seed,_that.title,_that.description,_that.titleSuggest,_that.editionCount,_that.editionKey,_that.publishDate,_that.publishYear,_that.firstPublishYear,_that.medianPages,_that.lccn,_that.publishPlace,_that.oclc,_that.contributor,_that.lcc,_that.ddc,_that.isbn,_that.lastModifiedI,_that.ebookCountI,_that.ebookAccess,_that.hasFulltext,_that.publicScanB,_that.ia,_that.iaCollection,_that.iaCollectionS,_that.lendingEditionS,_that.lendingIdentifierS,_that.printdisabledS,_that.coverEditionKey,_that.coverI,_that.firstSentence,_that.publisher,_that.language,_that.authorKey,_that.authorName,_that.authorAlternativeName,_that.person,_that.place,_that.subject,_that.idAlibrisId,_that.idAmazon,_that.idBodleianOxfordUniversity,_that.idDepsitoLegal,_that.idGoodreads,_that.idGoogle,_that.idHathiTrust,_that.idLibrarything,_that.idPaperbackSwap,_that.idWikidata,_that.idYakaboo,_that.iaLoadedId,_that.iaBoxId,_that.publisherFacet,_that.personKey,_that.placeKey,_that.personFacet,_that.subjectFacet,_that.version,_that.placeFacet,_that.lccSort,_that.authorFacet,_that.subjectKey,_that.ddcSort,_that.idAmazonCaAsin,_that.idAmazonCoUkAsin,_that.idAmazonDeAsin,_that.idAmazonItAsin,_that.idCanadianNationalLibraryArchive,_that.idOverdrive,_that.idAbebooksDe,_that.idBritishLibrary,_that.idBritishNationalBibliography,_that.time,_that.timeFacet,_that.timeKey,_that.subtitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OLSearchResultDocModel extends OLSearchResultDocModel {
  const _OLSearchResultDocModel({this.key, this.type, final  List<String>? seed, this.title, this.description, @JsonKey(name: 'title_suggest') this.titleSuggest, @JsonKey(name: 'edition_count') this.editionCount, @JsonKey(name: 'edition_key') final  List<String>? editionKey, @JsonKey(name: 'publish_date') final  List<String>? publishDate, @JsonKey(name: 'publish_year') final  List<int>? publishYear, @JsonKey(name: 'first_publish_year') this.firstPublishYear, @JsonKey(name: 'median_pages') this.medianPages, final  List<String>? lccn, @JsonKey(name: 'publish_place') final  List<String>? publishPlace, final  List<String>? oclc, final  List<String>? contributor, final  List<String>? lcc, final  List<String>? ddc, final  List<String>? isbn, @JsonKey(name: 'last_modified_i') this.lastModifiedI, @JsonKey(name: 'ebook_count_i') this.ebookCountI, @JsonKey(name: 'ebook_access') this.ebookAccess, @JsonKey(name: 'has_fulltext') this.hasFulltext, @JsonKey(name: 'public_scan_b') this.publicScanB, final  List<String>? ia, @JsonKey(name: 'ia_collection') final  List<String>? iaCollection, @JsonKey(name: 'ia_collection_s') this.iaCollectionS, @JsonKey(name: 'lending_edition_s') this.lendingEditionS, @JsonKey(name: 'lending_identifier_s') this.lendingIdentifierS, @JsonKey(name: 'printdisabled_s') this.printdisabledS, @JsonKey(name: 'cover_edition_key') this.coverEditionKey, @JsonKey(name: 'cover_i') this.coverI, @JsonKey(name: 'first_sentence') final  List<String>? firstSentence, final  List<String>? publisher, final  List<String>? language, @JsonKey(name: 'author_key') final  List<String>? authorKey, @JsonKey(name: 'author_name') final  List<String>? authorName, @JsonKey(name: 'author_alternative_name') final  List<String>? authorAlternativeName, final  List<String>? person, final  List<String>? place, final  List<String>? subject, @JsonKey(name: 'id_alibris_id') final  List<String>? idAlibrisId, @JsonKey(name: 'id_amazon') final  List<String>? idAmazon, @JsonKey(name: 'id_bodleian_oxford_university') final  List<String>? idBodleianOxfordUniversity, @JsonKey(name: 'id_depsito_legal') final  List<String>? idDepsitoLegal, @JsonKey(name: 'id_goodreads') final  List<String>? idGoodreads, @JsonKey(name: 'id_google') final  List<String>? idGoogle, @JsonKey(name: 'id_hathi_trust') final  List<String>? idHathiTrust, @JsonKey(name: 'id_librarything') final  List<String>? idLibrarything, @JsonKey(name: 'id_paperback_swap') final  List<String>? idPaperbackSwap, @JsonKey(name: 'id_wikidata') final  List<String>? idWikidata, @JsonKey(name: 'id_yakaboo') final  List<String>? idYakaboo, @JsonKey(name: 'ia_loaded_id') final  List<String>? iaLoadedId, @JsonKey(name: 'ia_box_id') final  List<String>? iaBoxId, @JsonKey(name: 'publisher_facet') final  List<String>? publisherFacet, @JsonKey(name: 'person_key') final  List<String>? personKey, @JsonKey(name: 'place_key') final  List<String>? placeKey, @JsonKey(name: 'person_facet') final  List<String>? personFacet, @JsonKey(name: 'subject_facet') final  List<String>? subjectFacet, this.version, @JsonKey(name: 'place_facet') final  List<String>? placeFacet, @JsonKey(name: 'lcc_sort') this.lccSort, @JsonKey(name: 'author_facet') final  List<String>? authorFacet, @JsonKey(name: 'subject_key') final  List<String>? subjectKey, @JsonKey(name: 'ddc_sort') this.ddcSort, @JsonKey(name: 'id_amazon_ca_asin') final  List<String>? idAmazonCaAsin, @JsonKey(name: 'id_amazon_co_uk_asin') final  List<String>? idAmazonCoUkAsin, @JsonKey(name: 'id_amazon_de_asin') final  List<String>? idAmazonDeAsin, @JsonKey(name: 'id_amazon_it_asin') final  List<String>? idAmazonItAsin, @JsonKey(name: 'id_canadian_national_library_archive') final  List<String>? idCanadianNationalLibraryArchive, @JsonKey(name: 'id_overdrive') final  List<String>? idOverdrive, @JsonKey(name: 'id_abebooks_de') final  List<String>? idAbebooksDe, @JsonKey(name: 'id_british_library') final  List<String>? idBritishLibrary, @JsonKey(name: 'id_british_national_bibliography') final  List<String>? idBritishNationalBibliography, final  List<String>? time, @JsonKey(name: 'time_facet') final  List<String>? timeFacet, @JsonKey(name: 'time_key') final  List<String>? timeKey, this.subtitle}): _seed = seed,_editionKey = editionKey,_publishDate = publishDate,_publishYear = publishYear,_lccn = lccn,_publishPlace = publishPlace,_oclc = oclc,_contributor = contributor,_lcc = lcc,_ddc = ddc,_isbn = isbn,_ia = ia,_iaCollection = iaCollection,_firstSentence = firstSentence,_publisher = publisher,_language = language,_authorKey = authorKey,_authorName = authorName,_authorAlternativeName = authorAlternativeName,_person = person,_place = place,_subject = subject,_idAlibrisId = idAlibrisId,_idAmazon = idAmazon,_idBodleianOxfordUniversity = idBodleianOxfordUniversity,_idDepsitoLegal = idDepsitoLegal,_idGoodreads = idGoodreads,_idGoogle = idGoogle,_idHathiTrust = idHathiTrust,_idLibrarything = idLibrarything,_idPaperbackSwap = idPaperbackSwap,_idWikidata = idWikidata,_idYakaboo = idYakaboo,_iaLoadedId = iaLoadedId,_iaBoxId = iaBoxId,_publisherFacet = publisherFacet,_personKey = personKey,_placeKey = placeKey,_personFacet = personFacet,_subjectFacet = subjectFacet,_placeFacet = placeFacet,_authorFacet = authorFacet,_subjectKey = subjectKey,_idAmazonCaAsin = idAmazonCaAsin,_idAmazonCoUkAsin = idAmazonCoUkAsin,_idAmazonDeAsin = idAmazonDeAsin,_idAmazonItAsin = idAmazonItAsin,_idCanadianNationalLibraryArchive = idCanadianNationalLibraryArchive,_idOverdrive = idOverdrive,_idAbebooksDe = idAbebooksDe,_idBritishLibrary = idBritishLibrary,_idBritishNationalBibliography = idBritishNationalBibliography,_time = time,_timeFacet = timeFacet,_timeKey = timeKey,super._();
  factory _OLSearchResultDocModel.fromJson(Map<String, dynamic> json) => _$OLSearchResultDocModelFromJson(json);

@override final  String? key;
@override final  String? type;
 final  List<String>? _seed;
@override List<String>? get seed {
  final value = _seed;
  if (value == null) return null;
  if (_seed is EqualUnmodifiableListView) return _seed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? title;
@override final  String? description;
@override@JsonKey(name: 'title_suggest') final  String? titleSuggest;
@override@JsonKey(name: 'edition_count') final  int? editionCount;
 final  List<String>? _editionKey;
@override@JsonKey(name: 'edition_key') List<String>? get editionKey {
  final value = _editionKey;
  if (value == null) return null;
  if (_editionKey is EqualUnmodifiableListView) return _editionKey;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _publishDate;
@override@JsonKey(name: 'publish_date') List<String>? get publishDate {
  final value = _publishDate;
  if (value == null) return null;
  if (_publishDate is EqualUnmodifiableListView) return _publishDate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _publishYear;
@override@JsonKey(name: 'publish_year') List<int>? get publishYear {
  final value = _publishYear;
  if (value == null) return null;
  if (_publishYear is EqualUnmodifiableListView) return _publishYear;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'first_publish_year') final  int? firstPublishYear;
@override@JsonKey(name: 'median_pages') final  int? medianPages;
 final  List<String>? _lccn;
@override List<String>? get lccn {
  final value = _lccn;
  if (value == null) return null;
  if (_lccn is EqualUnmodifiableListView) return _lccn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _publishPlace;
@override@JsonKey(name: 'publish_place') List<String>? get publishPlace {
  final value = _publishPlace;
  if (value == null) return null;
  if (_publishPlace is EqualUnmodifiableListView) return _publishPlace;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _oclc;
@override List<String>? get oclc {
  final value = _oclc;
  if (value == null) return null;
  if (_oclc is EqualUnmodifiableListView) return _oclc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _contributor;
@override List<String>? get contributor {
  final value = _contributor;
  if (value == null) return null;
  if (_contributor is EqualUnmodifiableListView) return _contributor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _lcc;
@override List<String>? get lcc {
  final value = _lcc;
  if (value == null) return null;
  if (_lcc is EqualUnmodifiableListView) return _lcc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _ddc;
@override List<String>? get ddc {
  final value = _ddc;
  if (value == null) return null;
  if (_ddc is EqualUnmodifiableListView) return _ddc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _isbn;
@override List<String>? get isbn {
  final value = _isbn;
  if (value == null) return null;
  if (_isbn is EqualUnmodifiableListView) return _isbn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'last_modified_i') final  int? lastModifiedI;
@override@JsonKey(name: 'ebook_count_i') final  int? ebookCountI;
@override@JsonKey(name: 'ebook_access') final  EbookAccess? ebookAccess;
@override@JsonKey(name: 'has_fulltext') final  bool? hasFulltext;
@override@JsonKey(name: 'public_scan_b') final  bool? publicScanB;
 final  List<String>? _ia;
@override List<String>? get ia {
  final value = _ia;
  if (value == null) return null;
  if (_ia is EqualUnmodifiableListView) return _ia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _iaCollection;
@override@JsonKey(name: 'ia_collection') List<String>? get iaCollection {
  final value = _iaCollection;
  if (value == null) return null;
  if (_iaCollection is EqualUnmodifiableListView) return _iaCollection;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'ia_collection_s') final  String? iaCollectionS;
@override@JsonKey(name: 'lending_edition_s') final  String? lendingEditionS;
@override@JsonKey(name: 'lending_identifier_s') final  String? lendingIdentifierS;
@override@JsonKey(name: 'printdisabled_s') final  String? printdisabledS;
@override@JsonKey(name: 'cover_edition_key') final  String? coverEditionKey;
@override@JsonKey(name: 'cover_i') final  int? coverI;
 final  List<String>? _firstSentence;
@override@JsonKey(name: 'first_sentence') List<String>? get firstSentence {
  final value = _firstSentence;
  if (value == null) return null;
  if (_firstSentence is EqualUnmodifiableListView) return _firstSentence;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _publisher;
@override List<String>? get publisher {
  final value = _publisher;
  if (value == null) return null;
  if (_publisher is EqualUnmodifiableListView) return _publisher;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _language;
@override List<String>? get language {
  final value = _language;
  if (value == null) return null;
  if (_language is EqualUnmodifiableListView) return _language;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _authorKey;
@override@JsonKey(name: 'author_key') List<String>? get authorKey {
  final value = _authorKey;
  if (value == null) return null;
  if (_authorKey is EqualUnmodifiableListView) return _authorKey;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _authorName;
@override@JsonKey(name: 'author_name') List<String>? get authorName {
  final value = _authorName;
  if (value == null) return null;
  if (_authorName is EqualUnmodifiableListView) return _authorName;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _authorAlternativeName;
@override@JsonKey(name: 'author_alternative_name') List<String>? get authorAlternativeName {
  final value = _authorAlternativeName;
  if (value == null) return null;
  if (_authorAlternativeName is EqualUnmodifiableListView) return _authorAlternativeName;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _person;
@override List<String>? get person {
  final value = _person;
  if (value == null) return null;
  if (_person is EqualUnmodifiableListView) return _person;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _place;
@override List<String>? get place {
  final value = _place;
  if (value == null) return null;
  if (_place is EqualUnmodifiableListView) return _place;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _subject;
@override List<String>? get subject {
  final value = _subject;
  if (value == null) return null;
  if (_subject is EqualUnmodifiableListView) return _subject;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idAlibrisId;
@override@JsonKey(name: 'id_alibris_id') List<String>? get idAlibrisId {
  final value = _idAlibrisId;
  if (value == null) return null;
  if (_idAlibrisId is EqualUnmodifiableListView) return _idAlibrisId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idAmazon;
@override@JsonKey(name: 'id_amazon') List<String>? get idAmazon {
  final value = _idAmazon;
  if (value == null) return null;
  if (_idAmazon is EqualUnmodifiableListView) return _idAmazon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idBodleianOxfordUniversity;
@override@JsonKey(name: 'id_bodleian_oxford_university') List<String>? get idBodleianOxfordUniversity {
  final value = _idBodleianOxfordUniversity;
  if (value == null) return null;
  if (_idBodleianOxfordUniversity is EqualUnmodifiableListView) return _idBodleianOxfordUniversity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idDepsitoLegal;
@override@JsonKey(name: 'id_depsito_legal') List<String>? get idDepsitoLegal {
  final value = _idDepsitoLegal;
  if (value == null) return null;
  if (_idDepsitoLegal is EqualUnmodifiableListView) return _idDepsitoLegal;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idGoodreads;
@override@JsonKey(name: 'id_goodreads') List<String>? get idGoodreads {
  final value = _idGoodreads;
  if (value == null) return null;
  if (_idGoodreads is EqualUnmodifiableListView) return _idGoodreads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idGoogle;
@override@JsonKey(name: 'id_google') List<String>? get idGoogle {
  final value = _idGoogle;
  if (value == null) return null;
  if (_idGoogle is EqualUnmodifiableListView) return _idGoogle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idHathiTrust;
@override@JsonKey(name: 'id_hathi_trust') List<String>? get idHathiTrust {
  final value = _idHathiTrust;
  if (value == null) return null;
  if (_idHathiTrust is EqualUnmodifiableListView) return _idHathiTrust;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idLibrarything;
@override@JsonKey(name: 'id_librarything') List<String>? get idLibrarything {
  final value = _idLibrarything;
  if (value == null) return null;
  if (_idLibrarything is EqualUnmodifiableListView) return _idLibrarything;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idPaperbackSwap;
@override@JsonKey(name: 'id_paperback_swap') List<String>? get idPaperbackSwap {
  final value = _idPaperbackSwap;
  if (value == null) return null;
  if (_idPaperbackSwap is EqualUnmodifiableListView) return _idPaperbackSwap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idWikidata;
@override@JsonKey(name: 'id_wikidata') List<String>? get idWikidata {
  final value = _idWikidata;
  if (value == null) return null;
  if (_idWikidata is EqualUnmodifiableListView) return _idWikidata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idYakaboo;
@override@JsonKey(name: 'id_yakaboo') List<String>? get idYakaboo {
  final value = _idYakaboo;
  if (value == null) return null;
  if (_idYakaboo is EqualUnmodifiableListView) return _idYakaboo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _iaLoadedId;
@override@JsonKey(name: 'ia_loaded_id') List<String>? get iaLoadedId {
  final value = _iaLoadedId;
  if (value == null) return null;
  if (_iaLoadedId is EqualUnmodifiableListView) return _iaLoadedId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _iaBoxId;
@override@JsonKey(name: 'ia_box_id') List<String>? get iaBoxId {
  final value = _iaBoxId;
  if (value == null) return null;
  if (_iaBoxId is EqualUnmodifiableListView) return _iaBoxId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _publisherFacet;
@override@JsonKey(name: 'publisher_facet') List<String>? get publisherFacet {
  final value = _publisherFacet;
  if (value == null) return null;
  if (_publisherFacet is EqualUnmodifiableListView) return _publisherFacet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _personKey;
@override@JsonKey(name: 'person_key') List<String>? get personKey {
  final value = _personKey;
  if (value == null) return null;
  if (_personKey is EqualUnmodifiableListView) return _personKey;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _placeKey;
@override@JsonKey(name: 'place_key') List<String>? get placeKey {
  final value = _placeKey;
  if (value == null) return null;
  if (_placeKey is EqualUnmodifiableListView) return _placeKey;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _personFacet;
@override@JsonKey(name: 'person_facet') List<String>? get personFacet {
  final value = _personFacet;
  if (value == null) return null;
  if (_personFacet is EqualUnmodifiableListView) return _personFacet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _subjectFacet;
@override@JsonKey(name: 'subject_facet') List<String>? get subjectFacet {
  final value = _subjectFacet;
  if (value == null) return null;
  if (_subjectFacet is EqualUnmodifiableListView) return _subjectFacet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? version;
 final  List<String>? _placeFacet;
@override@JsonKey(name: 'place_facet') List<String>? get placeFacet {
  final value = _placeFacet;
  if (value == null) return null;
  if (_placeFacet is EqualUnmodifiableListView) return _placeFacet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'lcc_sort') final  String? lccSort;
 final  List<String>? _authorFacet;
@override@JsonKey(name: 'author_facet') List<String>? get authorFacet {
  final value = _authorFacet;
  if (value == null) return null;
  if (_authorFacet is EqualUnmodifiableListView) return _authorFacet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _subjectKey;
@override@JsonKey(name: 'subject_key') List<String>? get subjectKey {
  final value = _subjectKey;
  if (value == null) return null;
  if (_subjectKey is EqualUnmodifiableListView) return _subjectKey;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'ddc_sort') final  String? ddcSort;
 final  List<String>? _idAmazonCaAsin;
@override@JsonKey(name: 'id_amazon_ca_asin') List<String>? get idAmazonCaAsin {
  final value = _idAmazonCaAsin;
  if (value == null) return null;
  if (_idAmazonCaAsin is EqualUnmodifiableListView) return _idAmazonCaAsin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idAmazonCoUkAsin;
@override@JsonKey(name: 'id_amazon_co_uk_asin') List<String>? get idAmazonCoUkAsin {
  final value = _idAmazonCoUkAsin;
  if (value == null) return null;
  if (_idAmazonCoUkAsin is EqualUnmodifiableListView) return _idAmazonCoUkAsin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idAmazonDeAsin;
@override@JsonKey(name: 'id_amazon_de_asin') List<String>? get idAmazonDeAsin {
  final value = _idAmazonDeAsin;
  if (value == null) return null;
  if (_idAmazonDeAsin is EqualUnmodifiableListView) return _idAmazonDeAsin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idAmazonItAsin;
@override@JsonKey(name: 'id_amazon_it_asin') List<String>? get idAmazonItAsin {
  final value = _idAmazonItAsin;
  if (value == null) return null;
  if (_idAmazonItAsin is EqualUnmodifiableListView) return _idAmazonItAsin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idCanadianNationalLibraryArchive;
@override@JsonKey(name: 'id_canadian_national_library_archive') List<String>? get idCanadianNationalLibraryArchive {
  final value = _idCanadianNationalLibraryArchive;
  if (value == null) return null;
  if (_idCanadianNationalLibraryArchive is EqualUnmodifiableListView) return _idCanadianNationalLibraryArchive;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idOverdrive;
@override@JsonKey(name: 'id_overdrive') List<String>? get idOverdrive {
  final value = _idOverdrive;
  if (value == null) return null;
  if (_idOverdrive is EqualUnmodifiableListView) return _idOverdrive;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idAbebooksDe;
@override@JsonKey(name: 'id_abebooks_de') List<String>? get idAbebooksDe {
  final value = _idAbebooksDe;
  if (value == null) return null;
  if (_idAbebooksDe is EqualUnmodifiableListView) return _idAbebooksDe;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idBritishLibrary;
@override@JsonKey(name: 'id_british_library') List<String>? get idBritishLibrary {
  final value = _idBritishLibrary;
  if (value == null) return null;
  if (_idBritishLibrary is EqualUnmodifiableListView) return _idBritishLibrary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _idBritishNationalBibliography;
@override@JsonKey(name: 'id_british_national_bibliography') List<String>? get idBritishNationalBibliography {
  final value = _idBritishNationalBibliography;
  if (value == null) return null;
  if (_idBritishNationalBibliography is EqualUnmodifiableListView) return _idBritishNationalBibliography;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _time;
@override List<String>? get time {
  final value = _time;
  if (value == null) return null;
  if (_time is EqualUnmodifiableListView) return _time;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _timeFacet;
@override@JsonKey(name: 'time_facet') List<String>? get timeFacet {
  final value = _timeFacet;
  if (value == null) return null;
  if (_timeFacet is EqualUnmodifiableListView) return _timeFacet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _timeKey;
@override@JsonKey(name: 'time_key') List<String>? get timeKey {
  final value = _timeKey;
  if (value == null) return null;
  if (_timeKey is EqualUnmodifiableListView) return _timeKey;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? subtitle;

/// Create a copy of OLSearchResultDocModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OLSearchResultDocModelCopyWith<_OLSearchResultDocModel> get copyWith => __$OLSearchResultDocModelCopyWithImpl<_OLSearchResultDocModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OLSearchResultDocModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OLSearchResultDocModel&&(identical(other.key, key) || other.key == key)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._seed, _seed)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.titleSuggest, titleSuggest) || other.titleSuggest == titleSuggest)&&(identical(other.editionCount, editionCount) || other.editionCount == editionCount)&&const DeepCollectionEquality().equals(other._editionKey, _editionKey)&&const DeepCollectionEquality().equals(other._publishDate, _publishDate)&&const DeepCollectionEquality().equals(other._publishYear, _publishYear)&&(identical(other.firstPublishYear, firstPublishYear) || other.firstPublishYear == firstPublishYear)&&(identical(other.medianPages, medianPages) || other.medianPages == medianPages)&&const DeepCollectionEquality().equals(other._lccn, _lccn)&&const DeepCollectionEquality().equals(other._publishPlace, _publishPlace)&&const DeepCollectionEquality().equals(other._oclc, _oclc)&&const DeepCollectionEquality().equals(other._contributor, _contributor)&&const DeepCollectionEquality().equals(other._lcc, _lcc)&&const DeepCollectionEquality().equals(other._ddc, _ddc)&&const DeepCollectionEquality().equals(other._isbn, _isbn)&&(identical(other.lastModifiedI, lastModifiedI) || other.lastModifiedI == lastModifiedI)&&(identical(other.ebookCountI, ebookCountI) || other.ebookCountI == ebookCountI)&&(identical(other.ebookAccess, ebookAccess) || other.ebookAccess == ebookAccess)&&(identical(other.hasFulltext, hasFulltext) || other.hasFulltext == hasFulltext)&&(identical(other.publicScanB, publicScanB) || other.publicScanB == publicScanB)&&const DeepCollectionEquality().equals(other._ia, _ia)&&const DeepCollectionEquality().equals(other._iaCollection, _iaCollection)&&(identical(other.iaCollectionS, iaCollectionS) || other.iaCollectionS == iaCollectionS)&&(identical(other.lendingEditionS, lendingEditionS) || other.lendingEditionS == lendingEditionS)&&(identical(other.lendingIdentifierS, lendingIdentifierS) || other.lendingIdentifierS == lendingIdentifierS)&&(identical(other.printdisabledS, printdisabledS) || other.printdisabledS == printdisabledS)&&(identical(other.coverEditionKey, coverEditionKey) || other.coverEditionKey == coverEditionKey)&&(identical(other.coverI, coverI) || other.coverI == coverI)&&const DeepCollectionEquality().equals(other._firstSentence, _firstSentence)&&const DeepCollectionEquality().equals(other._publisher, _publisher)&&const DeepCollectionEquality().equals(other._language, _language)&&const DeepCollectionEquality().equals(other._authorKey, _authorKey)&&const DeepCollectionEquality().equals(other._authorName, _authorName)&&const DeepCollectionEquality().equals(other._authorAlternativeName, _authorAlternativeName)&&const DeepCollectionEquality().equals(other._person, _person)&&const DeepCollectionEquality().equals(other._place, _place)&&const DeepCollectionEquality().equals(other._subject, _subject)&&const DeepCollectionEquality().equals(other._idAlibrisId, _idAlibrisId)&&const DeepCollectionEquality().equals(other._idAmazon, _idAmazon)&&const DeepCollectionEquality().equals(other._idBodleianOxfordUniversity, _idBodleianOxfordUniversity)&&const DeepCollectionEquality().equals(other._idDepsitoLegal, _idDepsitoLegal)&&const DeepCollectionEquality().equals(other._idGoodreads, _idGoodreads)&&const DeepCollectionEquality().equals(other._idGoogle, _idGoogle)&&const DeepCollectionEquality().equals(other._idHathiTrust, _idHathiTrust)&&const DeepCollectionEquality().equals(other._idLibrarything, _idLibrarything)&&const DeepCollectionEquality().equals(other._idPaperbackSwap, _idPaperbackSwap)&&const DeepCollectionEquality().equals(other._idWikidata, _idWikidata)&&const DeepCollectionEquality().equals(other._idYakaboo, _idYakaboo)&&const DeepCollectionEquality().equals(other._iaLoadedId, _iaLoadedId)&&const DeepCollectionEquality().equals(other._iaBoxId, _iaBoxId)&&const DeepCollectionEquality().equals(other._publisherFacet, _publisherFacet)&&const DeepCollectionEquality().equals(other._personKey, _personKey)&&const DeepCollectionEquality().equals(other._placeKey, _placeKey)&&const DeepCollectionEquality().equals(other._personFacet, _personFacet)&&const DeepCollectionEquality().equals(other._subjectFacet, _subjectFacet)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._placeFacet, _placeFacet)&&(identical(other.lccSort, lccSort) || other.lccSort == lccSort)&&const DeepCollectionEquality().equals(other._authorFacet, _authorFacet)&&const DeepCollectionEquality().equals(other._subjectKey, _subjectKey)&&(identical(other.ddcSort, ddcSort) || other.ddcSort == ddcSort)&&const DeepCollectionEquality().equals(other._idAmazonCaAsin, _idAmazonCaAsin)&&const DeepCollectionEquality().equals(other._idAmazonCoUkAsin, _idAmazonCoUkAsin)&&const DeepCollectionEquality().equals(other._idAmazonDeAsin, _idAmazonDeAsin)&&const DeepCollectionEquality().equals(other._idAmazonItAsin, _idAmazonItAsin)&&const DeepCollectionEquality().equals(other._idCanadianNationalLibraryArchive, _idCanadianNationalLibraryArchive)&&const DeepCollectionEquality().equals(other._idOverdrive, _idOverdrive)&&const DeepCollectionEquality().equals(other._idAbebooksDe, _idAbebooksDe)&&const DeepCollectionEquality().equals(other._idBritishLibrary, _idBritishLibrary)&&const DeepCollectionEquality().equals(other._idBritishNationalBibliography, _idBritishNationalBibliography)&&const DeepCollectionEquality().equals(other._time, _time)&&const DeepCollectionEquality().equals(other._timeFacet, _timeFacet)&&const DeepCollectionEquality().equals(other._timeKey, _timeKey)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,key,type,const DeepCollectionEquality().hash(_seed),title,description,titleSuggest,editionCount,const DeepCollectionEquality().hash(_editionKey),const DeepCollectionEquality().hash(_publishDate),const DeepCollectionEquality().hash(_publishYear),firstPublishYear,medianPages,const DeepCollectionEquality().hash(_lccn),const DeepCollectionEquality().hash(_publishPlace),const DeepCollectionEquality().hash(_oclc),const DeepCollectionEquality().hash(_contributor),const DeepCollectionEquality().hash(_lcc),const DeepCollectionEquality().hash(_ddc),const DeepCollectionEquality().hash(_isbn),lastModifiedI,ebookCountI,ebookAccess,hasFulltext,publicScanB,const DeepCollectionEquality().hash(_ia),const DeepCollectionEquality().hash(_iaCollection),iaCollectionS,lendingEditionS,lendingIdentifierS,printdisabledS,coverEditionKey,coverI,const DeepCollectionEquality().hash(_firstSentence),const DeepCollectionEquality().hash(_publisher),const DeepCollectionEquality().hash(_language),const DeepCollectionEquality().hash(_authorKey),const DeepCollectionEquality().hash(_authorName),const DeepCollectionEquality().hash(_authorAlternativeName),const DeepCollectionEquality().hash(_person),const DeepCollectionEquality().hash(_place),const DeepCollectionEquality().hash(_subject),const DeepCollectionEquality().hash(_idAlibrisId),const DeepCollectionEquality().hash(_idAmazon),const DeepCollectionEquality().hash(_idBodleianOxfordUniversity),const DeepCollectionEquality().hash(_idDepsitoLegal),const DeepCollectionEquality().hash(_idGoodreads),const DeepCollectionEquality().hash(_idGoogle),const DeepCollectionEquality().hash(_idHathiTrust),const DeepCollectionEquality().hash(_idLibrarything),const DeepCollectionEquality().hash(_idPaperbackSwap),const DeepCollectionEquality().hash(_idWikidata),const DeepCollectionEquality().hash(_idYakaboo),const DeepCollectionEquality().hash(_iaLoadedId),const DeepCollectionEquality().hash(_iaBoxId),const DeepCollectionEquality().hash(_publisherFacet),const DeepCollectionEquality().hash(_personKey),const DeepCollectionEquality().hash(_placeKey),const DeepCollectionEquality().hash(_personFacet),const DeepCollectionEquality().hash(_subjectFacet),version,const DeepCollectionEquality().hash(_placeFacet),lccSort,const DeepCollectionEquality().hash(_authorFacet),const DeepCollectionEquality().hash(_subjectKey),ddcSort,const DeepCollectionEquality().hash(_idAmazonCaAsin),const DeepCollectionEquality().hash(_idAmazonCoUkAsin),const DeepCollectionEquality().hash(_idAmazonDeAsin),const DeepCollectionEquality().hash(_idAmazonItAsin),const DeepCollectionEquality().hash(_idCanadianNationalLibraryArchive),const DeepCollectionEquality().hash(_idOverdrive),const DeepCollectionEquality().hash(_idAbebooksDe),const DeepCollectionEquality().hash(_idBritishLibrary),const DeepCollectionEquality().hash(_idBritishNationalBibliography),const DeepCollectionEquality().hash(_time),const DeepCollectionEquality().hash(_timeFacet),const DeepCollectionEquality().hash(_timeKey),subtitle]);

@override
String toString() {
  return 'OLSearchResultDocModel(key: $key, type: $type, seed: $seed, title: $title, description: $description, titleSuggest: $titleSuggest, editionCount: $editionCount, editionKey: $editionKey, publishDate: $publishDate, publishYear: $publishYear, firstPublishYear: $firstPublishYear, medianPages: $medianPages, lccn: $lccn, publishPlace: $publishPlace, oclc: $oclc, contributor: $contributor, lcc: $lcc, ddc: $ddc, isbn: $isbn, lastModifiedI: $lastModifiedI, ebookCountI: $ebookCountI, ebookAccess: $ebookAccess, hasFulltext: $hasFulltext, publicScanB: $publicScanB, ia: $ia, iaCollection: $iaCollection, iaCollectionS: $iaCollectionS, lendingEditionS: $lendingEditionS, lendingIdentifierS: $lendingIdentifierS, printdisabledS: $printdisabledS, coverEditionKey: $coverEditionKey, coverI: $coverI, firstSentence: $firstSentence, publisher: $publisher, language: $language, authorKey: $authorKey, authorName: $authorName, authorAlternativeName: $authorAlternativeName, person: $person, place: $place, subject: $subject, idAlibrisId: $idAlibrisId, idAmazon: $idAmazon, idBodleianOxfordUniversity: $idBodleianOxfordUniversity, idDepsitoLegal: $idDepsitoLegal, idGoodreads: $idGoodreads, idGoogle: $idGoogle, idHathiTrust: $idHathiTrust, idLibrarything: $idLibrarything, idPaperbackSwap: $idPaperbackSwap, idWikidata: $idWikidata, idYakaboo: $idYakaboo, iaLoadedId: $iaLoadedId, iaBoxId: $iaBoxId, publisherFacet: $publisherFacet, personKey: $personKey, placeKey: $placeKey, personFacet: $personFacet, subjectFacet: $subjectFacet, version: $version, placeFacet: $placeFacet, lccSort: $lccSort, authorFacet: $authorFacet, subjectKey: $subjectKey, ddcSort: $ddcSort, idAmazonCaAsin: $idAmazonCaAsin, idAmazonCoUkAsin: $idAmazonCoUkAsin, idAmazonDeAsin: $idAmazonDeAsin, idAmazonItAsin: $idAmazonItAsin, idCanadianNationalLibraryArchive: $idCanadianNationalLibraryArchive, idOverdrive: $idOverdrive, idAbebooksDe: $idAbebooksDe, idBritishLibrary: $idBritishLibrary, idBritishNationalBibliography: $idBritishNationalBibliography, time: $time, timeFacet: $timeFacet, timeKey: $timeKey, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class _$OLSearchResultDocModelCopyWith<$Res> implements $OLSearchResultDocModelCopyWith<$Res> {
  factory _$OLSearchResultDocModelCopyWith(_OLSearchResultDocModel value, $Res Function(_OLSearchResultDocModel) _then) = __$OLSearchResultDocModelCopyWithImpl;
@override @useResult
$Res call({
 String? key, String? type, List<String>? seed, String? title, String? description,@JsonKey(name: 'title_suggest') String? titleSuggest,@JsonKey(name: 'edition_count') int? editionCount,@JsonKey(name: 'edition_key') List<String>? editionKey,@JsonKey(name: 'publish_date') List<String>? publishDate,@JsonKey(name: 'publish_year') List<int>? publishYear,@JsonKey(name: 'first_publish_year') int? firstPublishYear,@JsonKey(name: 'median_pages') int? medianPages, List<String>? lccn,@JsonKey(name: 'publish_place') List<String>? publishPlace, List<String>? oclc, List<String>? contributor, List<String>? lcc, List<String>? ddc, List<String>? isbn,@JsonKey(name: 'last_modified_i') int? lastModifiedI,@JsonKey(name: 'ebook_count_i') int? ebookCountI,@JsonKey(name: 'ebook_access') EbookAccess? ebookAccess,@JsonKey(name: 'has_fulltext') bool? hasFulltext,@JsonKey(name: 'public_scan_b') bool? publicScanB, List<String>? ia,@JsonKey(name: 'ia_collection') List<String>? iaCollection,@JsonKey(name: 'ia_collection_s') String? iaCollectionS,@JsonKey(name: 'lending_edition_s') String? lendingEditionS,@JsonKey(name: 'lending_identifier_s') String? lendingIdentifierS,@JsonKey(name: 'printdisabled_s') String? printdisabledS,@JsonKey(name: 'cover_edition_key') String? coverEditionKey,@JsonKey(name: 'cover_i') int? coverI,@JsonKey(name: 'first_sentence') List<String>? firstSentence, List<String>? publisher, List<String>? language,@JsonKey(name: 'author_key') List<String>? authorKey,@JsonKey(name: 'author_name') List<String>? authorName,@JsonKey(name: 'author_alternative_name') List<String>? authorAlternativeName, List<String>? person, List<String>? place, List<String>? subject,@JsonKey(name: 'id_alibris_id') List<String>? idAlibrisId,@JsonKey(name: 'id_amazon') List<String>? idAmazon,@JsonKey(name: 'id_bodleian_oxford_university') List<String>? idBodleianOxfordUniversity,@JsonKey(name: 'id_depsito_legal') List<String>? idDepsitoLegal,@JsonKey(name: 'id_goodreads') List<String>? idGoodreads,@JsonKey(name: 'id_google') List<String>? idGoogle,@JsonKey(name: 'id_hathi_trust') List<String>? idHathiTrust,@JsonKey(name: 'id_librarything') List<String>? idLibrarything,@JsonKey(name: 'id_paperback_swap') List<String>? idPaperbackSwap,@JsonKey(name: 'id_wikidata') List<String>? idWikidata,@JsonKey(name: 'id_yakaboo') List<String>? idYakaboo,@JsonKey(name: 'ia_loaded_id') List<String>? iaLoadedId,@JsonKey(name: 'ia_box_id') List<String>? iaBoxId,@JsonKey(name: 'publisher_facet') List<String>? publisherFacet,@JsonKey(name: 'person_key') List<String>? personKey,@JsonKey(name: 'place_key') List<String>? placeKey,@JsonKey(name: 'person_facet') List<String>? personFacet,@JsonKey(name: 'subject_facet') List<String>? subjectFacet, double? version,@JsonKey(name: 'place_facet') List<String>? placeFacet,@JsonKey(name: 'lcc_sort') String? lccSort,@JsonKey(name: 'author_facet') List<String>? authorFacet,@JsonKey(name: 'subject_key') List<String>? subjectKey,@JsonKey(name: 'ddc_sort') String? ddcSort,@JsonKey(name: 'id_amazon_ca_asin') List<String>? idAmazonCaAsin,@JsonKey(name: 'id_amazon_co_uk_asin') List<String>? idAmazonCoUkAsin,@JsonKey(name: 'id_amazon_de_asin') List<String>? idAmazonDeAsin,@JsonKey(name: 'id_amazon_it_asin') List<String>? idAmazonItAsin,@JsonKey(name: 'id_canadian_national_library_archive') List<String>? idCanadianNationalLibraryArchive,@JsonKey(name: 'id_overdrive') List<String>? idOverdrive,@JsonKey(name: 'id_abebooks_de') List<String>? idAbebooksDe,@JsonKey(name: 'id_british_library') List<String>? idBritishLibrary,@JsonKey(name: 'id_british_national_bibliography') List<String>? idBritishNationalBibliography, List<String>? time,@JsonKey(name: 'time_facet') List<String>? timeFacet,@JsonKey(name: 'time_key') List<String>? timeKey, String? subtitle
});




}
/// @nodoc
class __$OLSearchResultDocModelCopyWithImpl<$Res>
    implements _$OLSearchResultDocModelCopyWith<$Res> {
  __$OLSearchResultDocModelCopyWithImpl(this._self, this._then);

  final _OLSearchResultDocModel _self;
  final $Res Function(_OLSearchResultDocModel) _then;

/// Create a copy of OLSearchResultDocModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? type = freezed,Object? seed = freezed,Object? title = freezed,Object? description = freezed,Object? titleSuggest = freezed,Object? editionCount = freezed,Object? editionKey = freezed,Object? publishDate = freezed,Object? publishYear = freezed,Object? firstPublishYear = freezed,Object? medianPages = freezed,Object? lccn = freezed,Object? publishPlace = freezed,Object? oclc = freezed,Object? contributor = freezed,Object? lcc = freezed,Object? ddc = freezed,Object? isbn = freezed,Object? lastModifiedI = freezed,Object? ebookCountI = freezed,Object? ebookAccess = freezed,Object? hasFulltext = freezed,Object? publicScanB = freezed,Object? ia = freezed,Object? iaCollection = freezed,Object? iaCollectionS = freezed,Object? lendingEditionS = freezed,Object? lendingIdentifierS = freezed,Object? printdisabledS = freezed,Object? coverEditionKey = freezed,Object? coverI = freezed,Object? firstSentence = freezed,Object? publisher = freezed,Object? language = freezed,Object? authorKey = freezed,Object? authorName = freezed,Object? authorAlternativeName = freezed,Object? person = freezed,Object? place = freezed,Object? subject = freezed,Object? idAlibrisId = freezed,Object? idAmazon = freezed,Object? idBodleianOxfordUniversity = freezed,Object? idDepsitoLegal = freezed,Object? idGoodreads = freezed,Object? idGoogle = freezed,Object? idHathiTrust = freezed,Object? idLibrarything = freezed,Object? idPaperbackSwap = freezed,Object? idWikidata = freezed,Object? idYakaboo = freezed,Object? iaLoadedId = freezed,Object? iaBoxId = freezed,Object? publisherFacet = freezed,Object? personKey = freezed,Object? placeKey = freezed,Object? personFacet = freezed,Object? subjectFacet = freezed,Object? version = freezed,Object? placeFacet = freezed,Object? lccSort = freezed,Object? authorFacet = freezed,Object? subjectKey = freezed,Object? ddcSort = freezed,Object? idAmazonCaAsin = freezed,Object? idAmazonCoUkAsin = freezed,Object? idAmazonDeAsin = freezed,Object? idAmazonItAsin = freezed,Object? idCanadianNationalLibraryArchive = freezed,Object? idOverdrive = freezed,Object? idAbebooksDe = freezed,Object? idBritishLibrary = freezed,Object? idBritishNationalBibliography = freezed,Object? time = freezed,Object? timeFacet = freezed,Object? timeKey = freezed,Object? subtitle = freezed,}) {
  return _then(_OLSearchResultDocModel(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,seed: freezed == seed ? _self._seed : seed // ignore: cast_nullable_to_non_nullable
as List<String>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,titleSuggest: freezed == titleSuggest ? _self.titleSuggest : titleSuggest // ignore: cast_nullable_to_non_nullable
as String?,editionCount: freezed == editionCount ? _self.editionCount : editionCount // ignore: cast_nullable_to_non_nullable
as int?,editionKey: freezed == editionKey ? _self._editionKey : editionKey // ignore: cast_nullable_to_non_nullable
as List<String>?,publishDate: freezed == publishDate ? _self._publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as List<String>?,publishYear: freezed == publishYear ? _self._publishYear : publishYear // ignore: cast_nullable_to_non_nullable
as List<int>?,firstPublishYear: freezed == firstPublishYear ? _self.firstPublishYear : firstPublishYear // ignore: cast_nullable_to_non_nullable
as int?,medianPages: freezed == medianPages ? _self.medianPages : medianPages // ignore: cast_nullable_to_non_nullable
as int?,lccn: freezed == lccn ? _self._lccn : lccn // ignore: cast_nullable_to_non_nullable
as List<String>?,publishPlace: freezed == publishPlace ? _self._publishPlace : publishPlace // ignore: cast_nullable_to_non_nullable
as List<String>?,oclc: freezed == oclc ? _self._oclc : oclc // ignore: cast_nullable_to_non_nullable
as List<String>?,contributor: freezed == contributor ? _self._contributor : contributor // ignore: cast_nullable_to_non_nullable
as List<String>?,lcc: freezed == lcc ? _self._lcc : lcc // ignore: cast_nullable_to_non_nullable
as List<String>?,ddc: freezed == ddc ? _self._ddc : ddc // ignore: cast_nullable_to_non_nullable
as List<String>?,isbn: freezed == isbn ? _self._isbn : isbn // ignore: cast_nullable_to_non_nullable
as List<String>?,lastModifiedI: freezed == lastModifiedI ? _self.lastModifiedI : lastModifiedI // ignore: cast_nullable_to_non_nullable
as int?,ebookCountI: freezed == ebookCountI ? _self.ebookCountI : ebookCountI // ignore: cast_nullable_to_non_nullable
as int?,ebookAccess: freezed == ebookAccess ? _self.ebookAccess : ebookAccess // ignore: cast_nullable_to_non_nullable
as EbookAccess?,hasFulltext: freezed == hasFulltext ? _self.hasFulltext : hasFulltext // ignore: cast_nullable_to_non_nullable
as bool?,publicScanB: freezed == publicScanB ? _self.publicScanB : publicScanB // ignore: cast_nullable_to_non_nullable
as bool?,ia: freezed == ia ? _self._ia : ia // ignore: cast_nullable_to_non_nullable
as List<String>?,iaCollection: freezed == iaCollection ? _self._iaCollection : iaCollection // ignore: cast_nullable_to_non_nullable
as List<String>?,iaCollectionS: freezed == iaCollectionS ? _self.iaCollectionS : iaCollectionS // ignore: cast_nullable_to_non_nullable
as String?,lendingEditionS: freezed == lendingEditionS ? _self.lendingEditionS : lendingEditionS // ignore: cast_nullable_to_non_nullable
as String?,lendingIdentifierS: freezed == lendingIdentifierS ? _self.lendingIdentifierS : lendingIdentifierS // ignore: cast_nullable_to_non_nullable
as String?,printdisabledS: freezed == printdisabledS ? _self.printdisabledS : printdisabledS // ignore: cast_nullable_to_non_nullable
as String?,coverEditionKey: freezed == coverEditionKey ? _self.coverEditionKey : coverEditionKey // ignore: cast_nullable_to_non_nullable
as String?,coverI: freezed == coverI ? _self.coverI : coverI // ignore: cast_nullable_to_non_nullable
as int?,firstSentence: freezed == firstSentence ? _self._firstSentence : firstSentence // ignore: cast_nullable_to_non_nullable
as List<String>?,publisher: freezed == publisher ? _self._publisher : publisher // ignore: cast_nullable_to_non_nullable
as List<String>?,language: freezed == language ? _self._language : language // ignore: cast_nullable_to_non_nullable
as List<String>?,authorKey: freezed == authorKey ? _self._authorKey : authorKey // ignore: cast_nullable_to_non_nullable
as List<String>?,authorName: freezed == authorName ? _self._authorName : authorName // ignore: cast_nullable_to_non_nullable
as List<String>?,authorAlternativeName: freezed == authorAlternativeName ? _self._authorAlternativeName : authorAlternativeName // ignore: cast_nullable_to_non_nullable
as List<String>?,person: freezed == person ? _self._person : person // ignore: cast_nullable_to_non_nullable
as List<String>?,place: freezed == place ? _self._place : place // ignore: cast_nullable_to_non_nullable
as List<String>?,subject: freezed == subject ? _self._subject : subject // ignore: cast_nullable_to_non_nullable
as List<String>?,idAlibrisId: freezed == idAlibrisId ? _self._idAlibrisId : idAlibrisId // ignore: cast_nullable_to_non_nullable
as List<String>?,idAmazon: freezed == idAmazon ? _self._idAmazon : idAmazon // ignore: cast_nullable_to_non_nullable
as List<String>?,idBodleianOxfordUniversity: freezed == idBodleianOxfordUniversity ? _self._idBodleianOxfordUniversity : idBodleianOxfordUniversity // ignore: cast_nullable_to_non_nullable
as List<String>?,idDepsitoLegal: freezed == idDepsitoLegal ? _self._idDepsitoLegal : idDepsitoLegal // ignore: cast_nullable_to_non_nullable
as List<String>?,idGoodreads: freezed == idGoodreads ? _self._idGoodreads : idGoodreads // ignore: cast_nullable_to_non_nullable
as List<String>?,idGoogle: freezed == idGoogle ? _self._idGoogle : idGoogle // ignore: cast_nullable_to_non_nullable
as List<String>?,idHathiTrust: freezed == idHathiTrust ? _self._idHathiTrust : idHathiTrust // ignore: cast_nullable_to_non_nullable
as List<String>?,idLibrarything: freezed == idLibrarything ? _self._idLibrarything : idLibrarything // ignore: cast_nullable_to_non_nullable
as List<String>?,idPaperbackSwap: freezed == idPaperbackSwap ? _self._idPaperbackSwap : idPaperbackSwap // ignore: cast_nullable_to_non_nullable
as List<String>?,idWikidata: freezed == idWikidata ? _self._idWikidata : idWikidata // ignore: cast_nullable_to_non_nullable
as List<String>?,idYakaboo: freezed == idYakaboo ? _self._idYakaboo : idYakaboo // ignore: cast_nullable_to_non_nullable
as List<String>?,iaLoadedId: freezed == iaLoadedId ? _self._iaLoadedId : iaLoadedId // ignore: cast_nullable_to_non_nullable
as List<String>?,iaBoxId: freezed == iaBoxId ? _self._iaBoxId : iaBoxId // ignore: cast_nullable_to_non_nullable
as List<String>?,publisherFacet: freezed == publisherFacet ? _self._publisherFacet : publisherFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,personKey: freezed == personKey ? _self._personKey : personKey // ignore: cast_nullable_to_non_nullable
as List<String>?,placeKey: freezed == placeKey ? _self._placeKey : placeKey // ignore: cast_nullable_to_non_nullable
as List<String>?,personFacet: freezed == personFacet ? _self._personFacet : personFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,subjectFacet: freezed == subjectFacet ? _self._subjectFacet : subjectFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as double?,placeFacet: freezed == placeFacet ? _self._placeFacet : placeFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,lccSort: freezed == lccSort ? _self.lccSort : lccSort // ignore: cast_nullable_to_non_nullable
as String?,authorFacet: freezed == authorFacet ? _self._authorFacet : authorFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,subjectKey: freezed == subjectKey ? _self._subjectKey : subjectKey // ignore: cast_nullable_to_non_nullable
as List<String>?,ddcSort: freezed == ddcSort ? _self.ddcSort : ddcSort // ignore: cast_nullable_to_non_nullable
as String?,idAmazonCaAsin: freezed == idAmazonCaAsin ? _self._idAmazonCaAsin : idAmazonCaAsin // ignore: cast_nullable_to_non_nullable
as List<String>?,idAmazonCoUkAsin: freezed == idAmazonCoUkAsin ? _self._idAmazonCoUkAsin : idAmazonCoUkAsin // ignore: cast_nullable_to_non_nullable
as List<String>?,idAmazonDeAsin: freezed == idAmazonDeAsin ? _self._idAmazonDeAsin : idAmazonDeAsin // ignore: cast_nullable_to_non_nullable
as List<String>?,idAmazonItAsin: freezed == idAmazonItAsin ? _self._idAmazonItAsin : idAmazonItAsin // ignore: cast_nullable_to_non_nullable
as List<String>?,idCanadianNationalLibraryArchive: freezed == idCanadianNationalLibraryArchive ? _self._idCanadianNationalLibraryArchive : idCanadianNationalLibraryArchive // ignore: cast_nullable_to_non_nullable
as List<String>?,idOverdrive: freezed == idOverdrive ? _self._idOverdrive : idOverdrive // ignore: cast_nullable_to_non_nullable
as List<String>?,idAbebooksDe: freezed == idAbebooksDe ? _self._idAbebooksDe : idAbebooksDe // ignore: cast_nullable_to_non_nullable
as List<String>?,idBritishLibrary: freezed == idBritishLibrary ? _self._idBritishLibrary : idBritishLibrary // ignore: cast_nullable_to_non_nullable
as List<String>?,idBritishNationalBibliography: freezed == idBritishNationalBibliography ? _self._idBritishNationalBibliography : idBritishNationalBibliography // ignore: cast_nullable_to_non_nullable
as List<String>?,time: freezed == time ? _self._time : time // ignore: cast_nullable_to_non_nullable
as List<String>?,timeFacet: freezed == timeFacet ? _self._timeFacet : timeFacet // ignore: cast_nullable_to_non_nullable
as List<String>?,timeKey: freezed == timeKey ? _self._timeKey : timeKey // ignore: cast_nullable_to_non_nullable
as List<String>?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
