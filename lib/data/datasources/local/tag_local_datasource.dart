import 'package:leafy/data/models/tag/tag_model.dart';

abstract class TagLocalDataSource {
  /// Create a new tag
  Future<int> create(TagModel tag);

  /// Get all active tags (not deleted)
  Future<List<TagModel>> getAllActive();

  /// Get all tags including deleted
  Future<List<TagModel>> getAll();

  /// Get tag by ID
  Future<TagModel?> getById(int id);

  /// Get tag by name
  Future<TagModel?> getByName(String name);

  /// Get system tags
  Future<List<TagModel>> getSystemTags();

  /// Get user tags
  Future<List<TagModel>> getUserTags();

  /// Get tags by category
  Future<List<TagModel>> getByCategory(String category);

  /// Update tag
  Future<int> update(TagModel tag);

  /// Soft delete tag
  Future<int> softDelete(int id);

  /// Hard delete tag
  Future<int> hardDelete(int id);

  /// Restore soft deleted tag
  Future<int> restore(int id);

  /// Find orphaned tags (tags not assigned to any book)
  Future<List<TagModel>> findOrphanedTags();

  /// Get tag statistics (tag_id -> book count)
  Future<Map<int, int>> getTagStatistics();

  /// Merge two tags (move all assignments from sourceId to targetId, then delete source)
  Future<void> mergeTags(int sourceTagId, int targetTagId);
}
