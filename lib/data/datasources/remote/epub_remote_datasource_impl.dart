import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'epub_remote_datasource.dart';

@LazySingleton(as: EpubRemoteDataSource)
class EpubRemoteDataSourceImpl implements EpubRemoteDataSource {
  final Dio _dio;

  EpubRemoteDataSourceImpl(this._dio);

  @override
  Future<void> download({
    required String url,
    required File target,
    CancelToken? cancelToken,
    void Function(double progress)? onProgress,
  }) async {
    await _dio.download(
      url,
      target.path,
      cancelToken: cancelToken,
      deleteOnError: true,
      onReceiveProgress: (received, total) {
        if (total > 0 && onProgress != null) {
          onProgress((received / total).clamp(0.0, 1.0));
        }
      },
    );
  }
}
