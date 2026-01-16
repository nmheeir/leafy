import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/reader_progress/entities/reader_progress.dart';
import 'package:leafy/domain/reader_progress/repositories/reader_progress_repository.dart';

@lazySingleton
class GetReaderProgressByPathUseCase {
  final ReaderProgressRepository _readerProgressRepository;
  final BookResourceRepository _bookResourceRepository;

  GetReaderProgressByPathUseCase(
    this._readerProgressRepository,
    this._bookResourceRepository,
  );

  Future<ReaderProgress?> call(String filePath) async {
    // 1. Get resource from file path
    final resourceOrFailure = await _bookResourceRepository.getResourceByPath(
      filePath,
    );

    return resourceOrFailure.fold((failure) => null, (resourceOption) async {
      return resourceOption.fold(() => null, (resource) async {
        if (resource.id == null) return null;

        return _readerProgressRepository.getProgress(resource.id!);
      });
    });
  }
}
