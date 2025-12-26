import 'package:equatable/equatable.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/domain/book/entities/reading.dart';

class Book extends Equatable {
  final int? id;
  final String title;
  final String? subtitle;
  final String author;
  final String? description;
  final BookStatus status;
  final bool favorite;
  final bool deleted;
  final int? rating;
  final int? pages;
  final int? publicationYear;
  final String? isbn;
  final String? olid;
  final String? tags;
  final String? myReview;
  final String? notes;
  final String? blurHash;
  final BookFormat bookFormat;
  final bool hasCover;
  final List<Reading> readings;
  final DateTime dateAdded;
  final DateTime dateModified;

  const Book({
    this.id,
    required this.title,
    required this.author,
    required this.status,
    this.subtitle,
    this.description,
    this.favorite = false,
    this.deleted = false,
    this.rating,
    this.pages,
    this.publicationYear,
    this.isbn,
    this.olid,
    this.tags,
    this.myReview,
    this.notes,
    this.blurHash,
    this.bookFormat = BookFormat.paperback,
    this.hasCover = false,
    required this.readings,
    required this.dateAdded,
    required this.dateModified,
  });

  Book copyWith({
    int? id,
    String? title,
    bool? favorite,
    List<Reading>? readings,
    DateTime? dateModified,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author,
      status: status,
      favorite: favorite ?? this.favorite,
      readings: readings ?? this.readings,
      dateAdded: dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    author,
    status,
    favorite,
    deleted,
    rating,
    pages,
    publicationYear,
    isbn,
    olid,
    tags,
    myReview,
    notes,
    blurHash,
    bookFormat,
    hasCover,
    readings,
    dateAdded,
    dateModified,
  ];
}
