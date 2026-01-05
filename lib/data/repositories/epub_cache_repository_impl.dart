import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/epub_file_local_datasource.dart';
import 'package:leafy/data/datasources/remote/epub_remote_datasource.dart';
import 'package:leafy/data/models/epub_cache/epub_cache_model.dart';
import 'package:leafy/domain/epub_cache/entities/epub_cache.dart';
import 'package:leafy/domain/epub_cache/repositories/epub_cache_repository.dart';

@LazySingleton(as: EpubCacheRepository)
class EpubCacheRepositoryImpl implements EpubCacheRepository {
  final EpubRemoteDataSource remote;
  final EpubFileLocalDataSource local;

  EpubCacheRepositoryImpl(this.remote, this.local);

  @override
  Future<Either<Failure, File>> getEpub({
    required String url,
    bool forceReload = false,
    void Function(double progress)? onProgress,
  }) async {
    final file = local.epubFile(url);

    if (!forceReload && await local.isValidEpub(file)) {
      return Right(file);
    }

    await remote.download(url: url, target: file, onProgress: onProgress);

    if (!await local.isValidEpub(file)) {
      if (await file.exists()) await file.delete();
      throw Exception('EPUB file corrupt or invalid');
    }

    return Right(file);
  }

  @override
  Future<Either<Failure, Unit>> saveMeta(cache) async {
    try {
      final epubCacheModel = EpubCacheModel.fromEntity(cache);
      await local.saveMeta(epubCacheModel);
      return Right(unit);
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EpubCache?>> loadMeta(String url) async {
    try {
      final meta = await local.loadMeta(url);
      if (meta != null) {
        return Right(meta.toEntity());
      }
      return Left(Failure.cache('Epub Cache meta not found'));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}
