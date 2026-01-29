import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/tag_local_datasource.dart';
import 'package:leafy/data/models/tag/tag_model.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: TagRepository)
class TagRepositoryImpl implements TagRepository {
  final TagLocalDataSource _tagLocalDataSource;
  final Logger _logger;
  final _controller = StreamController<void>.broadcast();

  TagRepositoryImpl(this._tagLocalDataSource, this._logger);

  @override
  Stream<void> get activeTagsStream => _controller.stream;

  @override
  Future<Either<Failure, List<Tag>>> getAllActiveTags() async {
    try {
      _logger.d('TagRepository: Fetching all active tags...');
      final tags = await _tagLocalDataSource.getAllActive();
      return Right(tags.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: getAllActiveTags failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, Tag>> getTagById(int id) async {
    try {
      final tag = await _tagLocalDataSource.getById(id);
      if (tag == null) {
        _logger.w('TagRepository: Tag not found with ID: $id');
        return Left(Failure.notFound());
      }
      return Right(tag.toEntity());
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: getTagById failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tag?>> getTagByName(String name) async {
    try {
      final tag = await _tagLocalDataSource.getByName(name);
      return Right(tag?.toEntity());
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: getTagByName failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tag>> getOrCreateTag(
    String name, {
    int? color,
    String? icon,
    int priority = 0,
    bool isSystem = false,
    String? category,
  }) async {
    try {
      _logger.d('TagRepository: Get or create tag "$name"...');

      // Try to find existing tag
      final existingTag = await _tagLocalDataSource.getByName(name);

      if (existingTag != null) {
        _logger.d(
          'TagRepository: Tag "$name" already exists (ID: ${existingTag.id})',
        );
        return Right(existingTag.toEntity());
      }

      // Create new tag
      final now = DateTime.now();
      final newTag = TagModel(
        name: name,
        color: color,
        icon: icon,
        priority: priority,
        isSystem: isSystem,
        category: category,
        deleted: false,
        createdAt: now,
        updatedAt: now,
      );

      final tagId = await _tagLocalDataSource.create(newTag);
      _logger.i('TagRepository: Created new tag "$name" (ID: $tagId)');
      _controller.add(null);

      return Right(newTag.copyWith(id: tagId).toEntity());
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: getOrCreateTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tag>> createTag(Tag tag) async {
    try {
      _logger.i('TagRepository: Creating tag "${tag.name}"...');

      final tagId = await _tagLocalDataSource.create(TagModel.fromEntity(tag));
      _logger.i('TagRepository: Tag created successfully (ID: $tagId)');
      _controller.add(null);

      return Right(tag.copyWith(id: tagId));
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: createTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTag(Tag tag) async {
    try {
      _logger.i('TagRepository: Updating tag ID: ${tag.id}...');

      final updatedTag = tag.copyWith(updatedAt: DateTime.now());
      await _tagLocalDataSource.update(TagModel.fromEntity(updatedTag));

      _logger.i('TagRepository: Tag updated successfully');
      _controller.add(null);
      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: updateTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTag(int id) async {
    try {
      _logger.w('TagRepository: Soft deleting tag ID: $id...');

      await _tagLocalDataSource.softDelete(id);

      _logger.i('TagRepository: Tag soft deleted');
      _controller.add(null);
      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: deleteTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, Unit>> restoreTag(int id) async {
    try {
      _logger.i('TagRepository: Restoring tag ID: $id...');

      await _tagLocalDataSource.restore(id);

      _logger.i('TagRepository: Tag restored');
      _controller.add(null);
      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: restoreTag failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Tag>>> getSystemTags() async {
    try {
      final tags = await _tagLocalDataSource.getSystemTags();
      return Right(tags.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: getSystemTags failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Tag>>> getUserTags() async {
    try {
      final tags = await _tagLocalDataSource.getUserTags();
      return Right(tags.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: getUserTags failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Tag>>> getTagsByCategory(String category) async {
    try {
      final tags = await _tagLocalDataSource.getByCategory(category);
      return Right(tags.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: getTagsByCategory failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, List<Tag>>> findOrphanedTags() async {
    try {
      _logger.d('TagRepository: Finding orphaned tags...');
      final tags = await _tagLocalDataSource.findOrphanedTags();
      _logger.d('TagRepository: Found ${tags.length} orphaned tags');
      return Right(tags.map((e) => e.toEntity()).toList());
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: findOrphanedTags failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, int>> cleanupOrphanedTags() async {
    try {
      _logger.i('TagRepository: Cleaning up orphaned tags...');

      final orphanedTags = await _tagLocalDataSource.findOrphanedTags();

      int deletedCount = 0;
      for (final tag in orphanedTags) {
        if (tag.id != null) {
          await _tagLocalDataSource.softDelete(tag.id!);
          deletedCount++;
        }
      }

      _logger.i('TagRepository: Cleaned up $deletedCount orphaned tags');
      if (deletedCount > 0) _controller.add(null);
      return Right(deletedCount);
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: cleanupOrphanedTags failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, Map<Tag, int>>> getTagStatistics() async {
    try {
      _logger.d('TagRepository: Fetching tag statistics...');

      final stats = await _tagLocalDataSource.getTagStatistics();
      final Map<Tag, int> tagStats = {};

      for (final entry in stats.entries) {
        final tag = await _tagLocalDataSource.getById(entry.key);
        if (tag != null) {
          tagStats[tag.toEntity()] = entry.value;
        }
      }

      _logger.d(
        'TagRepository: Fetched statistics for ${tagStats.length} tags',
      );
      return Right(tagStats);
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: getTagStatistics failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }

  @override
  Future<Either<Failure, Unit>> mergeTags(
    int sourceTagId,
    int targetTagId,
  ) async {
    try {
      _logger.i('TagRepository: Merging tag $sourceTagId into $targetTagId...');

      await _tagLocalDataSource.mergeTags(sourceTagId, targetTagId);

      _logger.i('TagRepository: Tags merged successfully');
      _controller.add(null);
      return right(unit);
    } catch (e, stackTrace) {
      _logger.e(
        'TagRepository: mergeTags failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(Failure.database());
    }
  }
}
