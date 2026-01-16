import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/domain/book/usecases/params/update_book_param.dart';
import 'package:leafy/domain/book_resource/usecase/get_book_resource_by_path.dart';

@injectable
class MarkBookFinishedUseCase {
  final GetBookResourceByPathUseCase _getBookResourceByPathUseCase;
  final BookRepository _bookRepository;

  MarkBookFinishedUseCase(
    this._getBookResourceByPathUseCase,
    this._bookRepository,
  );

  Future<Either<Failure, Unit>> call(String filePath) async {
    // 1. Get Resource
    final resourceResult = await _getBookResourceByPathUseCase(filePath);

    return resourceResult.fold((failure) => left(failure), (
      resourceOption,
    ) async {
      return resourceOption.fold(
        () => left(Failure.notFound()), // Resource not found
        (resource) async {
          // 2. Get Book
          final bookResult = await _bookRepository.getBookById(resource.bookId);

          return bookResult.fold((failure) => left(failure), (book) async {
            // 3. Update Book Status if not already finished
            if (book.status == BookStatus.finished) {
              // Already finished, just return success
              return right(unit);
            }

            final updatedBook = book.copyWith(
              status: BookStatus.finished,
              finishDate: DateTime.now(),
            );

            return _bookRepository.updateBook(
              UpdateBookParams(book: updatedBook),
            );
          });
        },
      );
    });
  }
}
