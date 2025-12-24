class ServerException implements Exception {
  final String message;
  ServerException(this.message); // Chứa message từ API trả về
}

class CacheException implements Exception {}
