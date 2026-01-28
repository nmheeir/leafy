import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

abstract class BookTagRepository {
  /// Add tag to book (by tag name, will create if not exists)
  Future<Either<Failure, Unit>> addTagToBook(int bookId, String tagName);

  /// Add tag to book by tag ID
  Future<Either<Failure, Unit>> addTagToBookById(int bookId, int tagId);

  /// Remove tag from book
  Future<Either<Failure, Unit>> removeTagFromBook(int bookId, int tagId);

  /// Get all tags for a book
  Future<Either<Failure, List<Tag>>> getTagsForBook(int bookId);

  /// Get all books with a specific tag
  Future<Either<Failure, List<Book>>> getBooksWithTag(int tagId);

  /// Get books with all specified tags (AND logic)
  Future<Either<Failure, List<Book>>> getBooksWithAllTags(List<int> tagIds);

  /// Get books with any of the specified tags (OR logic)
  Future<Either<Failure, List<Book>>> getBooksWithAnyTag(List<int> tagIds);

  /// Get books with tag A but NOT tag B
  Future<Either<Failure, List<Book>>> getBooksWithTagExcludingTag(
    int includeTagId,
    int excludeTagId,
  );

  /// Remove all tags from a book
  Future<Either<Failure, Unit>> removeAllTagsFromBook(int bookId);

  /// Update tag display order for a book
  Future<Either<Failure, Unit>> updateTagOrder(int bookId, List<int> tagIds);

  /// Find related books based on shared tags
  Future<Either<Failure, List<Map<String, dynamic>>>> findRelatedBooks(
    int bookId, {
    int limit = 10,
  });

  /// Get tags frequently co-occurring with a given tag
  Future<Either<Failure, List<Map<String, dynamic>>>>
  getFrequentlyTaggedTogether(int tagId, {int limit = 5});

  /// Get book count for a specific tag
  Future<Either<Failure, int>> countBooksForTag(int tagId);
}
