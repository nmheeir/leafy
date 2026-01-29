import 'package:equatable/equatable.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

/// Aggregate entity that combines Book with its related data.
///
/// This entity provides a single source of truth for displaying
/// book details across the app (BookScreen, Home, Search, BookList...).
///
/// Designed for extensibility - new related data can be added as needed.
class BookWithDetails extends Equatable {
  final Book book;
  final List<Tag> tags;
  final List<BookResource> resources;

  const BookWithDetails({
    required this.book,
    this.tags = const [],
    this.resources = const [],
  });

  factory BookWithDetails.empty({DateTime? now}) {
    return BookWithDetails(
      book: Book.empty(now: now),
      tags: const [],
      resources: const [],
    );
  }

  /// Creates a BookWithDetails from just a Book (for progressive loading)
  factory BookWithDetails.fromBook(Book book) {
    return BookWithDetails(book: book, tags: const [], resources: const []);
  }

  // Convenience getters delegating to Book
  int? get id => book.id;
  String get title => book.title;
  String? get subtitle => book.subtitle;
  String get author => book.author;
  String? get description => book.description;
  bool get hasCover => book.hasCover;
  String? get blurHash => book.blurHash;

  /// Whether this aggregate has been fully loaded
  bool get isFullyLoaded => tags.isNotEmpty || resources.isNotEmpty;

  /// Whether this book has any tags
  bool get hasTags => tags.isNotEmpty;

  /// Whether this book has any resources
  bool get hasResources => resources.isNotEmpty;

  BookWithDetails copyWith({
    Book? book,
    List<Tag>? tags,
    List<BookResource>? resources,
  }) {
    return BookWithDetails(
      book: book ?? this.book,
      tags: tags ?? this.tags,
      resources: resources ?? this.resources,
    );
  }

  @override
  List<Object?> get props => [book, tags, resources];
}
