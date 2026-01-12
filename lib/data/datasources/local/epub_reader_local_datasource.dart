import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/data/models/epub_reader/epub_book/epub_book_model.dart';

abstract class EpubReaderLocalDataSource {
  Future<EpubBookModel> parseEpub(String filePath);
}

@LazySingleton(as: EpubReaderLocalDataSource)
class EpubReaderLocalDataSourceImpl implements EpubReaderLocalDataSource {
  // Channel name phải KHỚP với bên Android
  static const MethodChannel _channel = MethodChannel(
    'com.example.leafy/epub_channel',
  );

  @override
  Future<EpubBookModel> parseEpub(String filePath) async {
    try {
      final result = await _channel.invokeMethod('parseEpub', {
        'filePath': filePath,
      });

      if (result != null) {
        final cleanMap = _castToMapStringDynamic(result);
        return EpubBookModel.fromJson(cleanMap);
      } else {
        throw Exception("Result is null");
      }
    } on PlatformException catch (e) {
      throw Exception("Failed to parse epub: ${e.message}");
    }
  }

  // --- HÀM HELPER QUAN TRỌNG ---
  // Hàm này đệ quy để chuyển Map<Object?, Object?> thành Map<String, dynamic>
  Map<String, dynamic> _castToMapStringDynamic(Map<dynamic, dynamic> map) {
    return map.map((key, value) {
      final String stringKey = key.toString(); // Ép key thành String

      if (value is Map) {
        // Nếu value là Map con (ví dụ từng Chapter), đệ quy tiếp
        return MapEntry(stringKey, _castToMapStringDynamic(value));
      } else if (value is List) {
        // QUAN TRỌNG: Nếu là Uint8List (ảnh bìa), giữ nguyên để tối ưu hiệu năng
        if (value is Uint8List) {
          return MapEntry(stringKey, value);
        }

        // Nếu là List thường (List chapters), duyệt từng phần tử
        return MapEntry(
          stringKey,
          value.map((e) {
            if (e is Map) return _castToMapStringDynamic(e);
            return e;
          }).toList(),
        );
      } else {
        // Các kiểu cơ bản (String, int, bool...) giữ nguyên
        return MapEntry(stringKey, value);
      }
    });
  }
}
