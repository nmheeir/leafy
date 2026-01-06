import 'package:dio/dio.dart';

class GetEpubParam {
  final String url;
  final CancelToken? cancelToken;
  final void Function(double progress) onProgress;
  final bool forceReload;

  GetEpubParam({
    required this.url,
    this.cancelToken,
    required this.onProgress,
    required this.forceReload,
  });
}
