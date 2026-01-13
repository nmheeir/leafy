import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/usecase/get_book_resources.dart';
import 'package:leafy/domain/book_resource/usecase/params/get_book_resources_params.dart';
import 'package:leafy/domain/book_resource/usecase/params/update_book_resource_file_params.dart';
import 'package:leafy/domain/book_resource/usecase/update_book_resource_file.dart';
import 'package:leafy/domain/epub_file/repositories/epub_file_repository.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_state.dart';

@injectable
class BookResourceCubit extends Cubit<BookResourceState> {
  final GetBookResourcesUseCase _getBookResourcesUseCase;
  final EpubFileRepository _epubFileRepository;
  final UpdateBookResourceFileUseCase _updateBookResourceFileUseCase;

  BookResourceCubit(
    this._getBookResourcesUseCase,
    this._epubFileRepository,
    this._updateBookResourceFileUseCase,
  ) : super(const BookResourceState.initial());

  int? _bookId;

  Future<void> loadResources(int bookId) async {
    _bookId = bookId;
    emit(const BookResourceState.loading());
    final result = await _getBookResourcesUseCase(
      GetBookResourcesParams(bookId: bookId),
    );

    result.fold(
      (failure) =>
          emit(BookResourceState.failure(failure.message ?? 'Unknown error')),
      (resources) => emit(BookResourceState.success(resources)),
    );
  }

  Future<void> downloadResource(BookResource resource) async {
    if (resource.url == null) {
      emit(const BookResourceState.failure("Resource has no URL"));
      return;
    }

    emit(BookResourceState.downloading(resource.uuid, 0.0));

    // 1. Download file
    final downloadResult = await _epubFileRepository.getEpub(
      url: resource.url!,
      onProgress: (progress) {
        emit(BookResourceState.downloading(resource.uuid, progress));
      },
      forceReload: true,
    );

    await downloadResult.fold(
      (failure) async {
        emit(BookResourceState.failure(failure.message ?? 'Download failed'));
        // Reload resources to reset state to success/list
        // NOTE: this logic might be buggy if we don't have bookId here.
        // Assuming this cubit is used in a context where we can't easily retry without params.
        // Actually better to just emit failure, then maybe user refreshes?
        // For now let's just stick to failure.
        if (_bookId != null) loadResources(_bookId!);
      },
      (file) async {
        // 2. Update resource in DB
        final updateResult = await _updateBookResourceFileUseCase(
          UpdateBookResourceFileParams(
            resourceUuid: resource.uuid,
            newPath: file.path,
            newFileSize: await file.length(),
          ),
        );

        updateResult.fold(
          (failure) =>
              emit(BookResourceState.failure("Failed to update resource path")),
          (_) async {
            // 3. Update local state manually or reload
            // Since we don't know bookId here (unless we store it),
            // we can construct the new list if we had it.
            // But we don't have previous state easily if we are in _Downloading.
            // Improvement: Store current resources in a property or rely on caller to reload.
            // Let's store bookId? Or just emit a special "Downloaded" state?
            // Best: Store loaded resources in local variable.
            // 3. Reload resources
            if (_bookId != null) {
              await loadResources(_bookId!);
            } else {
              emit(const BookResourceState.success([])); // Should not happen
            }
          },
        );
      },
    );
  }
}
