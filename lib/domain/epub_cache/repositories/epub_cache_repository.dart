import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/epub_cache/entities/epub_cache.dart';

abstract class EpubCacheRepository {
  Future<Either<Failure, File>> getEpub({
    required String url,
    bool forceReload,
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> saveMeta(EpubMeta cache);
  Future<Either<Failure, Option<EpubMeta>>> loadMeta(String url);
}
