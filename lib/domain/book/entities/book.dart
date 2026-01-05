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

  // NOTE: cần xem xét lại việc viết factory empty ở đây có vi phạm clean architecture hay không, hiện tại dùng tạm
  factory Book.empty({DateTime? now}) {
    final current = now ?? DateTime.fromMillisecondsSinceEpoch(0);

    return Book(
      id: null,
      title: '',
      subtitle: null,
      author: '',
      description: null,
      status: BookStatus.unfinished,
      favorite: false,
      deleted: false,
      rating: null,
      pages: null,
      publicationYear: null,
      isbn: null,
      olid: null,
      tags: null,
      myReview: null,
      notes: null,
      blurHash: null,
      bookFormat: BookFormat.paperback,
      hasCover: false,
      readings: const [],
      dateAdded: current,
      dateModified: current,
    );
  }

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
    String? subtitle,
    String? author,
    String? description,
    BookStatus? status,
    bool? favorite,
    bool? deleted,
    int? rating,
    int? pages,
    int? publicationYear,
    String? isbn,
    String? olid,
    String? tags,
    String? myReview,
    String? notes,
    String? blurHash,
    BookFormat? bookFormat,
    bool? hasCover,
    List<Reading>? readings,
    DateTime? dateAdded,
    DateTime? dateModified,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      author: author ?? this.author,
      description: description ?? this.description,
      status: status ?? this.status,
      favorite: favorite ?? this.favorite,
      deleted: deleted ?? this.deleted,
      rating: rating ?? this.rating,
      pages: pages ?? this.pages,
      publicationYear: publicationYear ?? this.publicationYear,
      isbn: isbn ?? this.isbn,
      olid: olid ?? this.olid,
      tags: tags ?? this.tags,
      myReview: myReview ?? this.myReview,
      notes: notes ?? this.notes,
      blurHash: blurHash ?? this.blurHash,
      bookFormat: bookFormat ?? this.bookFormat,
      hasCover: hasCover ?? this.hasCover,
      readings: readings ?? this.readings,
      dateAdded: dateAdded ?? this.dateAdded,
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
