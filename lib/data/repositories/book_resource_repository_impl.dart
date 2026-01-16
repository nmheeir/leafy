import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/constants/enums/storage_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/utils/helpers/file_helper.dart';
import 'package:leafy/data/datasources/local/book_resource_local_datasource.dart';
import 'package:leafy/data/datasources/local/epub_file_local_datasource.dart';
import 'package:leafy/data/datasources/local/reader_progress_local_datasource.dart';
import 'package:leafy/data/datasources/remote/network_file_datasource.dart';
import 'package:leafy/data/models/book_resource/book_resource_model.dart';
import 'package:leafy/data/models/reader_progress.dart/reader_progress_model.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: BookResourceRepository)
class BookResourceRepositoryImpl implements BookResourceRepository {
  final BookResourceLocalDatasource _resourceDs;
  final ReaderProgressLocalDatasource _progressDs;
  final NetworkFileDataSource _networkDs;
  final EpubFileLocalDataSource _epubFileLocalDataSource;
  final Logger _logger;

  BookResourceRepositoryImpl(
    this._resourceDs,
    this._progressDs,
    this._networkDs,
    this._epubFileLocalDataSource,
    this._logger,
  );

  @override
  Future<Either<Failure, BookResource>> addResource({
    required int bookId,
    required String uuid,
    required BookResourceFormat format,
    required String filePath,
    required StorageType storageType,
    String? url,
    String? fileHash,
    int? fileSize,
    String? language,
  }) async {
    try {
      final model = BookResourceModel(
        uuid: uuid,
        bookId: bookId,
        format: format,
        filePath: filePath,
        fileHash: fileHash,
        fileSize: fileSize,
        language: language,
        storageType: storageType,
        url: url,
        createdAt: DateTime.now(),
      );

      final id = await _resourceDs.insert(model);

      return Right(model.copyWith(id: id).toEntity());
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> existsByUuid(String uuid) async {
    try {
      final exists = await _resourceDs.existsByUuid(uuid);
      return Right(exists);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> existsByFileHash(
    String fileHash, {
    int? bookId,
  }) async {
    try {
      final exists = await _resourceDs.existsByFileHash(
        fileHash,
        bookId: bookId,
      );
      return Right(exists);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookResource>>> getResourcesByBookId(
    int bookId,
  ) async {
    try {
      final list = await _resourceDs.getByBookId(bookId);

      final result = <BookResource>[];
      for (final model in list) {
        if (model.id == null) {
          result.add(model.toEntity());
          continue;
        }

        final progress = await _progressDs.getByResourceId(model.id!);
        // We use copyWith on the ENTITY to injecting the progress data
        // keeping the Model clean.
        result.add(
          model.toEntity().copyWith(readProgress: progress?.progressPct),
        );
      }

      return Right(result);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Option<BookResource>>> getResourceByPath(
    String path,
  ) async {
    try {
      final model = await _resourceDs.findByPath(path);
      return Right(model == null ? const None() : Some(model.toEntity()));
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Option<BookResource>>> getResourceByUuid(
    String uuid,
  ) async {
    try {
      final model = await _resourceDs.getByUuid(uuid);
      return Right(model == null ? const None() : Some(model.toEntity()));
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Option<BookResource>>> getLastReadResource(
    int bookId,
  ) async {
    try {
      final model = await _resourceDs.getLastReadByBookId(bookId);
      return Right(model == null ? const None() : Some(model.toEntity()));
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookResource>>> getBrokenResources() async {
    try {
      final list = await _resourceDs.getBrokenResources();
      return Right(list.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveReaderProgress({
    required String resourceUuid,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  }) async {
    try {
      final resource = await _resourceDs.getByUuid(resourceUuid);
      if (resource == null) {
        _logger.w('Resource not found');
        return Left(Failure.notFound('Resource not found'));
      }

      _logger.i('Prepare to upsert reader progress');

      await _progressDs.upsert(
        ReaderProgressModel(
          resourceId: resource.id!,
          locator: locator,
          progressPct: progress,
          lastReadAt: lastReadAt,
        ),
      );

      _logger.i('upsert reader progress successfully');

      return right(unit);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> rebindProgress({
    required String resourceUuid,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  }) {
    // Về bản chất giống saveReaderProgress
    return saveReaderProgress(
      resourceUuid: resourceUuid,
      locator: locator,
      progress: progress,
      lastReadAt: lastReadAt,
    );
  }

  @override
  Future<Either<Failure, Unit>> clearReaderProgress(String resourceUuid) async {
    try {
      final resource = await _resourceDs.getByUuid(resourceUuid);
      if (resource == null) {
        return Left(Failure.notFound('Resource not found'));
      }

      await _progressDs.deleteByResourceId(resource.id!);
      return right(unit);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateFilePath({
    required String resourceUuid,
    required String newPath,
    String? newFileHash,
    int? newFileSize,
  }) async {
    try {
      await _resourceDs.updateFilePath(
        uuid: resourceUuid,
        path: newPath,
        hash: newFileHash,
        size: newFileSize,
      );
      return right(unit);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteResource(String uuid) async {
    try {
      // 1. Get resource to find path and ID
      final resourceModel = await _resourceDs.getByUuid(uuid);

      if (resourceModel == null) {
        return const Left(Failure.notFound("Resource not found"));
      }

      // 2. Delete from DB
      // Delete Reader Progress first
      await _progressDs.deleteByResourceId(resourceModel.id!);

      // Delete Resource Record
      await _resourceDs.deleteByUuid(uuid);

      // 3. Delete File
      if (resourceModel.filePath != null &&
          resourceModel.storageType == StorageType.local) {
        final file = File(resourceModel.filePath!);
        if (await file.exists()) {
          await file.delete();
        }
      }

      return const Right(unit);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, File>> downloadResource({
    required String url,
    required String fileName,
    bool forceReload = true,
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final file = await _networkDs.downloadToFile(
        url: url,
        savePath: FileHelper.generateEpubFilePath(fileName),
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            onProgress?.call((received / total).clamp(0.0, 1.0));
          }
        },
      );

      // 4. Validate lại file sau khi tải xong
      if (!await _epubFileLocalDataSource.isValidEpub(file)) {
        // Nếu tải xong mà file lỗi -> Xóa đi để tránh lỗi lần sau
        if (await file.exists()) await file.delete();
        return Left(Failure.unexpected('File downloaded but corrupted'));
      }

      return Right(file);
    } on DioException catch (e) {
      // Xử lý lỗi mạng cụ thể nếu cần
      if (CancelToken.isCancel(e)) {
        return Left(Failure.unexpected('Download cancelled'));
      }
      return Left(Failure.unexpected(e.message ?? 'Network error'));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}
