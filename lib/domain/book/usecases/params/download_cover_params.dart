import 'package:leafy/core/constants/enums/ol_cover_type.dart';

/// Tham số dùng để tải ảnh bìa sách từ Open Library Cover API
class DownloadCoverParams {
  /// Giá trị định danh (ví dụ: 1736063, 9780140328721, OL7353617M)
  final String value;

  /// Kiểu định danh dùng để xây dựng endpoint
  final OlCoverType type;

  const DownloadCoverParams({required this.value, required this.type});
}
