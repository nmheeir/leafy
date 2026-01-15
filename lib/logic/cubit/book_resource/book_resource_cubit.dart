import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/usecase/get_book_resources.dart';
import 'package:leafy/domain/book_resource/usecase/params/get_book_resources_params.dart';
import 'package:leafy/domain/book_resource/usecase/params/update_book_resource_file_params.dart';
import 'package:leafy/domain/book_resource/usecase/update_book_resource_file.dart';
import 'package:leafy/domain/epub_file/repositories/epub_file_repository.dart';
import 'package:leafy/domain/file_import/usecases/pick_local_files_use_case.dart';
import 'package:leafy/domain/file_import/usecases/process_local_files_use_case.dart';
import 'package:leafy/domain/file_import/usecases/save_imported_resource_use_case.dart';
import 'package:leafy/domain/book_resource/usecase/delete_book_resource_use_case.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_state.dart';

@injectable
class BookResourceCubit extends Cubit<BookResourceState> {
  final GetBookResourcesUseCase _getBookResourcesUseCase;
  final EpubFileRepository _epubFileRepository;
  final UpdateBookResourceFileUseCase _updateBookResourceFileUseCase;
  final PickLocalFilesUseCase _pickLocalFilesUseCase;
  final ProcessLocalFilesUseCase _processLocalFilesUseCase;
  final DeleteBookResourceUseCase _deleteBookResourceUseCase;
  final SaveImportedResourceUseCase _saveImportedResourceUseCase;

  BookResourceCubit(
    this._getBookResourcesUseCase,
    this._epubFileRepository,
    this._updateBookResourceFileUseCase,
    this._pickLocalFilesUseCase,
    this._processLocalFilesUseCase,
    this._saveImportedResourceUseCase,
    this._deleteBookResourceUseCase,
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
            if (_bookId != null) {
              await loadResources(_bookId!);
            } else {
              emit(const BookResourceState.success([]));
            }
          },
        );
      },
    );
  }

  Future<void> importFiles() async {
    if (_bookId == null) return;

    emit(const BookResourceState.importing());

    // 1. Pick Files
    final pickResult = await _pickLocalFilesUseCase(NoParams());

    await pickResult.fold(
      (failure) async {
        if (failure.message?.contains('cancelled') == true) {
          await loadResources(_bookId!); // Re-emit success from latest data
        } else {
          emit(BookResourceState.failure(failure.message ?? 'Pick failed'));
        }
      },
      (files) async {
        // 2. Process Files
        final processResult = await _processLocalFilesUseCase(files);

        await processResult.fold(
          (failure) async => emit(
            BookResourceState.failure(failure.message ?? 'Process failed'),
          ),
          (processedFiles) async {
            // 3. Save to DB
            final saveResult = await _saveImportedResourceUseCase(
              SaveImportedResourceParams(
                processedFiles: processedFiles,
                bookId: _bookId!,
              ),
            );

            await saveResult.fold(
              (failure) async => emit(
                BookResourceState.failure(failure.message ?? 'Save failed'),
              ),
              (newResources) async {
                // Refresh list with new data
                await loadResources(_bookId!);
              },
            );
          },
        );
      },
    );
  }

  Future<void> deleteResource(String uuid) async {
    if (_bookId == null) return;

    final result = await _deleteBookResourceUseCase(uuid);

    result.fold(
      (failure) =>
          emit(BookResourceState.failure(failure.message ?? 'Delete failed')),
      (_) => loadResources(_bookId!),
    );
  }
}
