import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/domain/book/usecases/params/update_book_param.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';

@lazySingleton
class SaveReaderProgressByPathUseCase {
  final BookResourceRepository _repository;
  final BookRepository _bookRepository;

  SaveReaderProgressByPathUseCase(this._repository, this._bookRepository);

  Future<Either<Failure, void>> call({
    required String filePath,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  }) async {
    // 1. Find resource by path
    final resourceOrFailure = await _repository.getResourceByPath(filePath);

    return resourceOrFailure.fold((failure) => Left(failure), (
      resourceOption,
    ) async {
      return resourceOption.fold(
        () => Left(const Failure.notFound('Resource not found for path')),
        (resource) async {
          final bookResult = await _bookRepository.getBookById(resource.bookId);
          return bookResult.fold((failure) => Left(failure), (book) async {
            // Cập nhật trạng thái sách nếu chưa đọc
            if (book.status == BookStatus.unfinished) {
              final updatedBook = book.copyWith(status: BookStatus.inProgress);
              await _bookRepository.updateBook(
                UpdateBookParams(book: updatedBook),
              );
            }
            // 2. Lưu tiến độ đọc sách
            return _repository.saveReaderProgress(
              resourceUuid: resource.uuid,
              locator: locator,
              progress: progress,
              lastReadAt: lastReadAt,
            );
          });
        },
      );
    });
  }
}
