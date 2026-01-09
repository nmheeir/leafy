import 'package:equatable/equatable.dart';
import 'package:leafy/core/constants/enums/ebook_access.dart';

class OLSearchResultDoc extends Equatable {
  const OLSearchResultDoc({
    this.key,
    this.type,
    this.seed,
    this.title,
    this.description,
    this.titleSuggest,
    this.editionCount,
    this.editionKey,
    this.publishDate,
    this.publishYear,
    this.firstPublishYear,
    this.medianPages,
    this.lccn,
    this.publishPlace,
    this.oclc,
    this.contributor,
    this.lcc,
    this.ddc,
    this.isbn,
    this.lastModifiedI,
    this.ebookCountI,
    this.ebookAccess,
    this.hasFulltext,
    this.publicScanB,
    this.ia,
    this.iaCollection,
    this.iaCollectionS,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.printdisabledS,
    this.coverEditionKey,
    this.coverI,
    this.firstSentence,
    this.publisher,
    this.language,
    this.authorKey,
    this.authorName,
    this.authorAlternativeName,
    this.person,
    this.place,
    this.subject,
    this.idAlibrisId,
    this.idAmazon,
    this.idBodleianOxfordUniversity,
    this.idDepsitoLegal,
    this.idGoodreads,
    this.idGoogle,
    this.idHathiTrust,
    this.idLibrarything,
    this.idPaperbackSwap,
    this.idWikidata,
    this.idYakaboo,
    this.iaLoadedId,
    this.iaBoxId,
    this.publisherFacet,
    this.personKey,
    this.placeKey,
    this.personFacet,
    this.subjectFacet,
    this.version,
    this.placeFacet,
    this.lccSort,
    this.authorFacet,
    this.subjectKey,
    this.ddcSort,
    this.idAmazonCaAsin,
    this.idAmazonCoUkAsin,
    this.idAmazonDeAsin,
    this.idAmazonItAsin,
    this.idCanadianNationalLibraryArchive,
    this.idOverdrive,
    this.idAbebooksDe,
    this.idBritishLibrary,
    this.idBritishNationalBibliography,
    this.time,
    this.timeFacet,
    this.timeKey,
    this.subtitle,
  });

  final String? key;
  final String? type;
  final List<String>? seed;
  final String? title;
  final String? description;
  final String? titleSuggest;
  final int? editionCount;
  final List<String>? editionKey;
  final List<String>? publishDate;
  final List<int>? publishYear;
  final int? firstPublishYear;
  final int? medianPages;
  final List<String>? lccn;
  final List<String>? publishPlace;
  final List<String>? oclc;
  final List<String>? contributor;
  final List<String>? lcc;
  final List<String>? ddc;
  final List<String>? isbn;
  final int? lastModifiedI;
  final int? ebookCountI;
  final EbookAccess? ebookAccess;
  final bool? hasFulltext;
  final bool? publicScanB;
  final List<String>? ia;
  final List<String>? iaCollection;
  final String? iaCollectionS;
  final String? lendingEditionS;
  final String? lendingIdentifierS;
  final String? printdisabledS;
  final String? coverEditionKey;
  final int? coverI;
  final List<String>? firstSentence;
  final List<String>? publisher;
  final List<String>? language;
  final List<String>? authorKey;
  final List<String>? authorName;
  final List<String>? authorAlternativeName;
  final List<String>? person;
  final List<String>? place;
  final List<String>? subject;
  final List<String>? idAlibrisId;
  final List<String>? idAmazon;
  final List<String>? idBodleianOxfordUniversity;
  final List<String>? idDepsitoLegal;
  final List<String>? idGoodreads;
  final List<String>? idGoogle;
  final List<String>? idHathiTrust;
  final List<String>? idLibrarything;
  final List<String>? idPaperbackSwap;
  final List<String>? idWikidata;
  final List<String>? idYakaboo;
  final List<String>? iaLoadedId;
  final List<String>? iaBoxId;
  final List<String>? publisherFacet;
  final List<String>? personKey;
  final List<String>? placeKey;
  final List<String>? personFacet;
  final List<String>? subjectFacet;
  final double? version;
  final List<String>? placeFacet;
  final String? lccSort;
  final List<String>? authorFacet;
  final List<String>? subjectKey;
  final String? ddcSort;
  final List<String>? idAmazonCaAsin;
  final List<String>? idAmazonCoUkAsin;
  final List<String>? idAmazonDeAsin;
  final List<String>? idAmazonItAsin;
  final List<String>? idCanadianNationalLibraryArchive;
  final List<String>? idOverdrive;
  final List<String>? idAbebooksDe;
  final List<String>? idBritishLibrary;
  final List<String>? idBritishNationalBibliography;
  final List<String>? time;
  final List<String>? timeFacet;
  final List<String>? timeKey;
  final String? subtitle;

  @override
  List<Object?> get props => [
    key,
    type,
    seed,
    title,
    description,
    titleSuggest,
    editionCount,
    editionKey,
    publishDate,
    publishYear,
    firstPublishYear,
    medianPages,
    lccn,
    publishPlace,
    oclc,
    contributor,
    lcc,
    ddc,
    isbn,
    lastModifiedI,
    ebookCountI,
    ebookAccess,
    hasFulltext,
    publicScanB,
    ia,
    iaCollection,
    iaCollectionS,
    lendingEditionS,
    lendingIdentifierS,
    printdisabledS,
    coverEditionKey,
    coverI,
    firstSentence,
    publisher,
    language,
    authorKey,
    authorName,
    authorAlternativeName,
    person,
    place,
    subject,
    idAlibrisId,
    idAmazon,
    idBodleianOxfordUniversity,
    idDepsitoLegal,
    idGoodreads,
    idGoogle,
    idHathiTrust,
    idLibrarything,
    idPaperbackSwap,
    idWikidata,
    idYakaboo,
    iaLoadedId,
    iaBoxId,
    publisherFacet,
    personKey,
    placeKey,
    personFacet,
    subjectFacet,
    version,
    placeFacet,
    lccSort,
    authorFacet,
    subjectKey,
    ddcSort,
    idAmazonCaAsin,
    idAmazonCoUkAsin,
    idAmazonDeAsin,
    idAmazonItAsin,
    idCanadianNationalLibraryArchive,
    idOverdrive,
    idAbebooksDe,
    idBritishLibrary,
    idBritishNationalBibliography,
    time,
    timeFacet,
    timeKey,
    subtitle,
  ];
}
