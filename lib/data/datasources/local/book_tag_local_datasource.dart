import 'package:leafy/data/models/book/book/book_model.dart';
import 'package:leafy/data/models/tag/book_tag_model.dart';
import 'package:leafy/data/models/tag/tag_model.dart';

abstract class BookTagLocalDataSource {
  /// Add tag to book
  Future<int> addTagToBook(BookTagModel bookTag);

  /// Remove tag from book
  Future<int> removeTagFromBook(int bookId, int tagId);

  /// Get all tags for a specific book
  Future<List<TagModel>> getTagsForBook(int bookId);

  /// Get all books with a specific tag
  Future<List<BookModel>> getBooksWithTag(int tagId);

  /// Get books with multiple tags (AND logic)
  Future<List<BookModel>> getBooksWithAllTags(List<int> tagIds);

  /// Get books with any of the tags (OR logic)
  Future<List<BookModel>> getBooksWithAnyTag(List<int> tagIds);

  /// Get books with tag A but NOT tag B (negative filtering)
  Future<List<BookModel>> getBooksWithTagExcludingTag(
    int includeTagId,
    int excludeTagId,
  );

  /// Remove all tags from a book
  Future<int> removeAllTagsFromBook(int bookId);

  /// Update tag order for a book
  Future<void> updateTagOrder(int bookId, List<int> tagIds);

  /// Find related books based on shared tags
  Future<List<Map<String, dynamic>>> findRelatedBooks(
    int bookId, {
    int limit = 10,
  });

  /// Get frequently co-occurring tags for a given tag
  Future<List<Map<String, dynamic>>> getFrequentlyTaggedTogether(
    int tagId, {
    int limit = 5,
  });

  /// Count books per tag
  Future<Map<int, int>> countBooksPerTag();

  /// Get books count for a specific tag
  Future<int> countBooksForTag(int tagId);
}
