import 'dart:io';
import 'package:dio/dio.dart';

abstract class EpubRemoteDataSource {
  Future<void> download({
    required String url,
    required File target,
    CancelToken? cancelToken,
    void Function(double progress)? onProgress,
  });
}
