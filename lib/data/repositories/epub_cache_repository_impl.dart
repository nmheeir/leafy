import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/epub_file_local_datasource.dart';
import 'package:leafy/data/datasources/remote/network_file_datasource.dart';
import 'package:leafy/data/models/epub_cache/epub_cache_model.dart';
import 'package:leafy/domain/epub_cache/entities/epub_cache.dart';
import 'package:leafy/domain/epub_cache/repositories/epub_cache_repository.dart';

@LazySingleton(as: EpubCacheRepository)
class EpubCacheRepositoryImpl implements EpubCacheRepository {
  final EpubFileLocalDataSource _localDataSource;
  final NetworkFileDataSource _networkDataSource;

  EpubCacheRepositoryImpl(this._localDataSource, this._networkDataSource);

  @override
  Future<Either<Failure, File>> getEpub({
    required String url,
    bool forceReload = false,
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      // 1. Lấy đường dẫn file dự kiến từ Local Data Source
      final file = _localDataSource.epubFile(url);

      // 2. Kiểm tra Cache (nếu không bắt buộc reload)
      if (!forceReload && await _localDataSource.isValidEpub(file)) {
        onProgress?.call(1.0); // Báo đã xong nếu có cache
        return Right(file);
      }

      // 3. Nếu chưa có hoặc forceReload -> Gọi Network Data Source tải về
      await _networkDataSource.downloadToFile(
        url: url,
        savePath: file.path,
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            onProgress?.call((received / total).clamp(0.0, 1.0));
          }
        },
      );

      // 4. Validate lại file sau khi tải xong
      if (!await _localDataSource.isValidEpub(file)) {
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

  @override
  Future<Either<Failure, Unit>> saveMeta(EpubMeta cache) async {
    try {
      final epubCacheModel = EpubCacheModel.fromEntity(cache);
      await _localDataSource.saveMeta(epubCacheModel);
      return Right(unit);
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Option<EpubMeta>>> loadMeta(String url) async {
    try {
      final metaModel = await _localDataSource.loadMeta(url);
      if (metaModel != null) {
        return Right(Some(metaModel.toEntity()));
      }

      return right(none());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}
