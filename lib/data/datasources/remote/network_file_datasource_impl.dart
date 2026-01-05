import 'dart:io';

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/remote/network_file_datasource.dart';

@LazySingleton(as: NetworkFileDataSource)
class NetworkFileDataSourceImpl implements NetworkFileDataSource {
  final Dio _dio;

  NetworkFileDataSourceImpl(this._dio);

  @override
  Future<Uint8List> downloadBytes(
    String url, {
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<List<int>>(
        url,
        cancelToken: cancelToken,
        options: Options(
          headers: headers,
          responseType: ResponseType.bytes,
          followRedirects: true,
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return Uint8List.fromList(response.data!);
      } else {
        throw Exception(
          "Download bytes failed. Status: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Network error (bytes): $e");
    }
  }

  @override
  Future<File> downloadToFile({
    required String url,
    required String savePath,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    void Function(int received, int total)? onReceiveProgress,
  }) {
    // TODO: implement downloadToFile
    throw UnimplementedError();
  }
}
