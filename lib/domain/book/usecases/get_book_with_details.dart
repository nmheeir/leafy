import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book_with_details.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/domain/book_resource/usecase/get_book_resources.dart';
import 'package:leafy/domain/book_resource/usecase/params/get_book_resources_params.dart';
import 'package:leafy/domain/tag/usecases/get_tags_for_book.dart';

/// Use case to fetch a Book with all its related details (tags, resources).
///
/// This aggregates data from multiple repositories into a single
/// [BookWithDetails] entity, following Clean Architecture principles.
///
/// The use case coordinates:
/// - BookRepository for the main book data
/// - GetTagsForBookUseCase for tags
/// - GetBookResourcesUseCase for resources
@injectable
class GetBookWithDetailsUseCase implements UseCase<BookWithDetails, int> {
  final BookRepository _bookRepository;
  final GetTagsForBookUseCase _getTagsForBookUseCase;
  final GetBookResourcesUseCase _getBookResourcesUseCase;

  const GetBookWithDetailsUseCase(
    this._bookRepository,
    this._getTagsForBookUseCase,
    this._getBookResourcesUseCase,
  );

  @override
  Future<Either<Failure, BookWithDetails>> call(int bookId) async {
    // 1. Fetch book first (required)
    final bookResult = await _bookRepository.getBookById(bookId);

    return bookResult.fold((failure) => left(failure), (book) async {
      // 2. Fetch related data in parallel (optional - don't fail if these fail)
      final results = await Future.wait([
        _getTagsForBookUseCase(bookId),
        _getBookResourcesUseCase(GetBookResourcesParams(bookId: bookId)),
      ]);

      final tagsResult = results[0];
      final resourcesResult = results[1];

      // Extract data, default to empty lists on failure
      final tags = tagsResult.fold((_) => <dynamic>[], (tags) => tags);

      final resources = resourcesResult.fold(
        (_) => <dynamic>[],
        (resources) => resources,
      );

      return right(
        BookWithDetails(
          book: book,
          tags: List.from(tags),
          resources: List.from(resources),
        ),
      );
    });
  }
}
