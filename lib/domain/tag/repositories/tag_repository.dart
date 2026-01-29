import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

abstract class TagRepository {
  /// Get all active tags (not deleted)
  Future<Either<Failure, List<Tag>>> getAllActiveTags();

  /// Get tag by ID
  Future<Either<Failure, Tag>> getTagById(int id);

  /// Get tag by name
  Future<Either<Failure, Tag?>> getTagByName(String name);

  /// Get or create tag (if not exists, create it)
  Future<Either<Failure, Tag>> getOrCreateTag(
    String name, {
    int? color,
    String? icon,
    int priority = 0,
    bool isSystem = false,
    String? category,
  });

  /// Create a new tag
  Future<Either<Failure, Tag>> createTag(Tag tag);

  /// Update tag
  Future<Either<Failure, Unit>> updateTag(Tag tag);

  /// Delete tag (soft delete)
  Future<Either<Failure, Unit>> deleteTag(int id);

  /// Restore deleted tag
  Future<Either<Failure, Unit>> restoreTag(int id);

  /// Get system tags
  Future<Either<Failure, List<Tag>>> getSystemTags();

  /// Get user tags
  Future<Either<Failure, List<Tag>>> getUserTags();

  /// Get tags by category
  Future<Either<Failure, List<Tag>>> getTagsByCategory(String category);

  /// Find orphaned tags (tags not used by any book)
  Future<Either<Failure, List<Tag>>> findOrphanedTags();

  /// Cleanup orphaned tags (delete unused tags)
  Future<Either<Failure, int>> cleanupOrphanedTags();

  /// Get tag statistics (tag -> book count map)
  Future<Either<Failure, Map<Tag, int>>> getTagStatistics();

  /// Merge two tags
  Future<Either<Failure, Unit>> mergeTags(int sourceTagId, int targetTagId);

  /// Stream of active tag updates
  Stream<void> get activeTagsStream;
}
