import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/epub_cache/entities/epub_cache.dart';

abstract class EpubCacheRepository {
  Future<Either<Failure, File>> getEpub({
    required String url,
    bool forceReload,
    void Function(double progress)? onProgress,
  });

  Future<Either<Failure, Unit>> saveMeta(EpubCache cache);
  Future<Either<Failure, EpubCache?>> loadMeta(String url);
}
