import 'package:injectable/injectable.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

class UpdateBookTagsParams {
  final int bookId;
  final List<Tag> tags;

  UpdateBookTagsParams({required this.bookId, required this.tags});
}

@lazySingleton
class UpdateBookTagsUseCase implements UseCase<void, UpdateBookTagsParams> {
  final BookTagRepository _bookTagRepository;
  final TagRepository _tagRepository;

  UpdateBookTagsUseCase(this._bookTagRepository, this._tagRepository);

  @override
  Future<Either<Failure, void>> call(UpdateBookTagsParams params) async {
    try {
      // 1. Resolve IDs for all target tags
      // If a tag doesn't have an ID (newly typed), create or get it first
      final List<int> targetTagIds = [];

      for (final tag in params.tags) {
        if (tag.id != null) {
          targetTagIds.add(tag.id!);
        } else {
          // New tag needs to be created first
          final createResult = await _tagRepository.getOrCreateTag(tag.name);
          if (createResult.isRight()) {
            createResult.map((t) {
              if (t.id != null) targetTagIds.add(t.id!);
            });
          }
        }
      }

      // 2. Fetch current tags for the book
      final currentTagsResult = await _bookTagRepository.getTagsForBook(
        params.bookId,
      );

      return await currentTagsResult.fold((failure) async => Left(failure), (
        currentTags,
      ) async {
        final currentTagIds = currentTags
            .map((t) => t.id)
            .whereType<int>()
            .toSet();
        final targetIdSet = targetTagIds.toSet();

        // 3. Calculate diff
        final idsToRemove = currentTagIds.difference(targetIdSet);
        final idsToAdd = targetIdSet.difference(currentTagIds);

        // 4. Remove tags causing the diff
        for (final id in idsToRemove) {
          final result = await _bookTagRepository.removeTagFromBook(
            params.bookId,
            id,
          );
          if (result.isLeft()) {
            // Optional: handling for partial failure
          }
        }

        // 5. Add new tags
        for (final id in idsToAdd) {
          final result = await _bookTagRepository.addTagToBookById(
            params.bookId,
            id,
          );
          if (result.isLeft()) {
            // Optional: handling for partial failure
          }
        }

        return const Right(null);
      });
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }
}
