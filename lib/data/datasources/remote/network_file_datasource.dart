import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';

abstract class NetworkFileDataSource {
  /// Tải dữ liệu nhị phân về RAM (Dùng cho ảnh, file nhỏ)
  Future<Uint8List> downloadBytes(
    String url, {
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  /// Tải file lớn và lưu trực tiếp xuống ổ cứng (Dùng cho PDF, Audio, Video)
  Future<File> downloadToFile({
    required String url,
    required String savePath,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    void Function(int received, int total)? onReceiveProgress,
  });
}
