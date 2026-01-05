class ServerException implements Exception {
  final String message;
  final int? code;
  ServerException({
    required this.message,
    this.code,
  }); // Chứa message từ API trả về
}

class CacheException implements Exception {}
