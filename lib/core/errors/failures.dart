import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  /// Lỗi server (có thể kèm message debug hoặc code lỗi)
  const factory Failure.server([String? message]) = _ServerFailure;

  /// Lỗi mạng/kết nối
  const factory Failure.connection([String? message]) = _ConnectionFailure;

  /// Lỗi cache
  const factory Failure.cache([String? message]) = _CacheFailure;

  /// Lỗi truy vấn trong database
  const factory Failure.database([String? message]) = _DatabaseFailure;

  /// Lỗi không xác định
  const factory Failure.unexpected([String? message]) = _UnexpectedFailure;

  /// Lỗi không tìm thấy
  const factory Failure.notFound([String? message]) = _NotFoundFailure;
}
