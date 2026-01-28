import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/book_tag_local_datasource.dart';
import 'package:leafy/data/datasources/local/tag_local_datasource.dart';
import 'package:leafy/data/models/tag/book_tag_model.dart';
import 'package:leafy/data/models/tag/tag_model.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: BookTagRepository)
class BookTagRepositoryImpl implements BookTagRepository {
  final BookTagLocalDataSource _bookTagLocalDataSource;
  final TagLocalDataSource _tagLocalDataSource;
  final Logger _logger;

  BookTagRepositoryImpl(
    this._bookTagLocalDataSource,
    this._tagLocalDataSource,
    this._logger,
  );

  @override
  Future<Either<Failure, Unit>> addTagToBook(int bookId, String tagName) async {
    try {
      _logger.d('BookTagRepository: Adding tag "$tagName" to book $bookId...');

      // Get or create tag
      var tag = await _tagLocalDataSource.getByName(tagName);

      if (tag == null) {
        _logger.d(
          'BookTagRepository: Tag "$tagName" not found, creating new...',
        );
        final now = DateTime.now();
        final newTag = TagModel(
          name: tagName,
          isSystem: false,
          deleted: false,
          createdAt: now,
          updatedAt: now,
        );
        final tagId = await _tagLocalDataSource.create(newTag);
        tag = newTag.copyWith(id: tagId);
      }

      // Check if relationship already exists
      final existingTags = await _bookTagLocalDataSource.getTagsForBook(bookId);
      final tagId = tag.id;
      if (tagId != null && existingTags.any((t) => t.id == tagId)) {
        _logger.w('BookTagRepository: Tag already assigned to book');
        return right(unit);
      }

      // Ensure tag has an ID
      if (tagId == null) {
        _logger.e('BookTagRepository: Tag ID is null after creation');
        return Left(Failure.unexpected('Tag ID is null'));
      }

      // Add relationship
      final bookTag = BookTagModel(
        bookId: bookId,
        tagId: tag.id!,
        orderIndex: existingTags.length,
        createdAt: DateTime.now(),
      );

      await _bookTagLocalDataSource.addTagToBook(bookTag);
      _logger.i('BookTagRepository: Tag assigned successfully');

      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: addTagToBook failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addTagToBookById(int bookId, int tagId) async {
    try {
      _logger.d('BookTagRepository: Adding tag ID $tagId to book $bookId...');

      // Check if tag exists
      final tag = await _tagLocalDataSource.getById(tagId);
      if (tag == null) {
        _logger.w('BookTagRepository: Tag ID $tagId not found');
        return Left(Failure.notFound());
      }

      // Check if relationship already exists
      final existingTags = await _bookTagLocalDataSource.getTagsForBook(bookId);
      if (existingTags.any((t) => t.id == tagId)) {
        _logger.w('BookTagRepository: Tag already assigned to book');
        return right(unit);
      }

      // Add relationship
      final bookTag = BookTagModel(
        bookId: bookId,
        tagId: tagId,
        orderIndex: existingTags.length,
        createdAt: DateTime.now(),
      );

      await _bookTagLocalDataSource.addTagToBook(bookTag);
      _logger.i('BookTagRepository: Tag assigned successfully');

      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: addTagToBookById failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeTagFromBook(int bookId, int tagId) async {
    try {
      _logger.d('BookTagRepository: Removing tag $tagId from book $bookId...');

      await _bookTagLocalDataSource.removeTagFromBook(bookId, tagId);

      _logger.i('BookTagRepository: Tag removed successfully');
      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: removeTagFromBook failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Tag>>> getTagsForBook(int bookId) async {
    try {
      final tags = await _bookTagLocalDataSource.getTagsForBook(bookId);
      return Right(tags.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: getTagsForBook failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksWithTag(int tagId) async {
    try {
      final books = await _bookTagLocalDataSource.getBooksWithTag(tagId);
      return Right(books.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: getBooksWithTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksWithAllTags(
    List<int> tagIds,
  ) async {
    try {
      _logger.d('BookTagRepository: Finding books with ALL tags: $tagIds');
      final books = await _bookTagLocalDataSource.getBooksWithAllTags(tagIds);
      return Right(books.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: getBooksWithAllTags failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksWithAnyTag(
    List<int> tagIds,
  ) async {
    try {
      _logger.d('BookTagRepository: Finding books with ANY tags: $tagIds');
      final books = await _bookTagLocalDataSource.getBooksWithAnyTag(tagIds);
      return Right(books.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: getBooksWithAnyTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksWithTagExcludingTag(
    int includeTagId,
    int excludeTagId,
  ) async {
    try {
      _logger.d(
        'BookTagRepository: Finding books with tag $includeTagId excluding $excludeTagId',
      );
      final books = await _bookTagLocalDataSource.getBooksWithTagExcludingTag(
        includeTagId,
        excludeTagId,
      );
      return Right(books.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: getBooksWithTagExcludingTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeAllTagsFromBook(int bookId) async {
    try {
      _logger.d('BookTagRepository: Removing all tags from book $bookId...');

      await _bookTagLocalDataSource.removeAllTagsFromBook(bookId);

      _logger.i('BookTagRepository: All tags removed successfully');
      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: removeAllTagsFromBook failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTagOrder(
    int bookId,
    List<int> tagIds,
  ) async {
    try {
      _logger.d('BookTagRepository: Updating tag order for book $bookId...');

      await _bookTagLocalDataSource.updateTagOrder(bookId, tagIds);

      _logger.i('BookTagRepository: Tag order updated');
      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: updateTagOrder failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> findRelatedBooks(
    int bookId, {
    int limit = 10,
  }) async {
    try {
      _logger.d('BookTagRepository: Finding related books for book $bookId...');

      final relatedBooks = await _bookTagLocalDataSource.findRelatedBooks(
        bookId,
        limit: limit,
      );

      _logger.d(
        'BookTagRepository: Found ${relatedBooks.length} related books',
      );
      return Right(relatedBooks);
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: findRelatedBooks failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>>
  getFrequentlyTaggedTogether(int tagId, {int limit = 5}) async {
    try {
      _logger.d(
        'BookTagRepository: Finding frequently co-occurring tags for tag $tagId...',
      );

      final coOccurringTags = await _bookTagLocalDataSource
          .getFrequentlyTaggedTogether(tagId, limit: limit);

      _logger.d(
        'BookTagRepository: Found ${coOccurringTags.length} co-occurring tags',
      );
      return Right(coOccurringTags);
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: getFrequentlyTaggedTogether failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, int>> countBooksForTag(int tagId) async {
    try {
      final count = await _bookTagLocalDataSource.countBooksForTag(tagId);
      return Right(count);
    } catch (e, stackTrace) {
      _logger.e(
        'BookTagRepository: countBooksForTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }
}
