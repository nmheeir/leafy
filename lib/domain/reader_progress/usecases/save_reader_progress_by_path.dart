import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';

@lazySingleton
class SaveReaderProgressByPathUseCase {
  final BookResourceRepository _repository;

  SaveReaderProgressByPathUseCase(this._repository);

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
          // 2. Save progress using UUID
          return _repository.saveReaderProgress(
            resourceUuid: resource.uuid,
            locator: locator,
            progress: progress,
            lastReadAt: lastReadAt,
          );
        },
      );
    });
  }
}
