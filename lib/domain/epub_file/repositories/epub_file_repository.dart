import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';

abstract class EpubFileRepository {
  Future<Either<Failure, File>> getEpub({
    required String url,
    bool forceReload,
    void Function(double progress)? onProgress,
    CancelToken? cancelToken,
  });
}
