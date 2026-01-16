import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/file_helper.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/usecase/delete_book_resource_use_case.dart';
import 'package:leafy/domain/book_resource/usecase/download_resource.dart';
import 'package:leafy/domain/book_resource/usecase/get_book_resources.dart';
import 'package:leafy/domain/book_resource/usecase/params/download_resource_params.dart';
import 'package:leafy/domain/book_resource/usecase/params/get_book_resources_params.dart';
import 'package:leafy/domain/book_resource/usecase/params/update_book_resource_file_params.dart';
import 'package:leafy/domain/book_resource/usecase/update_book_resource_file.dart';
import 'package:leafy/domain/file_import/usecases/params/process_local_files_params.dart';
import 'package:leafy/domain/file_import/usecases/pick_local_files_use_case.dart';
import 'package:leafy/domain/file_import/usecases/process_local_files_use_case.dart';
import 'package:leafy/domain/file_import/usecases/save_imported_resource_use_case.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_state.dart';
import 'package:logger/logger.dart';

@injectable
class BookResourceCubit extends Cubit<BookResourceState> {
  final GetBookResourcesUseCase _getBookResourcesUseCase;
  final UpdateBookResourceFileUseCase _updateBookResourceFileUseCase;
  final PickLocalFilesUseCase _pickLocalFilesUseCase;
  final ProcessLocalFilesUseCase _processLocalFilesUseCase;
  final DeleteBookResourceUseCase _deleteBookResourceUseCase;
  final SaveImportedResourceUseCase _saveImportedResourceUseCase;
  final DownloadResourceUseCase _downloadResourceUseCase;
  final Logger _logger;

  BookResourceCubit(
    this._logger,
    this._getBookResourcesUseCase,
    this._updateBookResourceFileUseCase,
    this._pickLocalFilesUseCase,
    this._processLocalFilesUseCase,
    this._saveImportedResourceUseCase,
    this._deleteBookResourceUseCase,
    this._downloadResourceUseCase,
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
    final downloadResult = await _downloadResourceUseCase(
      DownloadResourceParams(
        fileName: resource.uuid.take(6),
        url: resource.url!,
        onProgress: (progress) {
          _logger.d("Download progress: $progress");
          emit(BookResourceState.downloading(resource.uuid, progress));
        },
        forceReload: true,
      ),
    );

    await downloadResult.fold(
      (failure) async {
        emit(BookResourceState.failure(failure.message ?? 'Download failed'));
        if (_bookId != null) loadResources(_bookId!);
      },
      (file) async {
        final hash = await FileHelper.hashFile(file);
        // 2. Update resource in DB
        final updateResult = await _updateBookResourceFileUseCase(
          UpdateBookResourceFileParams(
            resourceUuid: resource.uuid,
            newPath: file.path,
            newFileHash: hash,
            newFileSize: file.lengthSync(),
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
          _logger.d("Pick cancelled");
          await loadResources(_bookId!);
        } else {
          _logger.d("Pick failed: ${failure.message}");
          emit(BookResourceState.failure(failure.message ?? 'Pick failed'));
        }
      },
      (files) async {
        _logger.i("Pick success: ${files.length} files");
        // 2. Process Files
        final processResult = await _processLocalFilesUseCase(
          ProcessLocalFilesParams(files: files, bookId: _bookId),
        );

        await processResult.fold(
          (failure) async {
            _logger.e("Process failed: ${failure.message}");
            emit(
              BookResourceState.failure(failure.message ?? 'Process failed'),
            );
          },
          (processedFiles) async {
            // 3. Save to DB
            final saveResult = await _saveImportedResourceUseCase(
              SaveImportedResourceParams(
                processedFiles: processedFiles,
                bookId: _bookId!,
              ),
            );

            await saveResult.fold(
              (failure) async {
                _logger.e("Save failed: ${failure.message}");
                emit(
                  BookResourceState.failure(failure.message ?? 'Save failed'),
                );
              },
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
      (failure) {
        _logger.e("Delete failed: ${failure.message}");
        emit(BookResourceState.failure(failure.message ?? 'Delete failed'));
      },
      (_) {
        _logger.i("Delete success");
        loadResources(_bookId!);
      },
    );
  }
}
