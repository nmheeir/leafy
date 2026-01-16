import 'package:dio/dio.dart';

class DownloadResourceParams {
  final String fileName;
  final String url;
  final CancelToken? cancelToken;
  final void Function(double progress) onProgress;
  final bool forceReload;

  DownloadResourceParams({
    required this.fileName,
    required this.url,
    this.cancelToken,
    required this.onProgress,
    required this.forceReload,
  });
}
