import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';

/// Base interface cho một Use Case theo Clean Architecture.
///
/// [T] là kiểu dữ liệu trả về khi thực thi thành công.
/// [P] là kiểu tham số đầu vào của use case.
///
/// Use case chỉ tập trung vào nghiệp vụ, không phụ thuộc UI hay data source.
/// Kết quả luôn được bọc trong [Either]:
/// - [Left] chứa [Failure] khi có lỗi.
/// - [Right] chứa dữ liệu [T] khi thành công.
abstract class UseCase<T, P> {
  /// Thực thi use case với tham số [params].
  ///
  /// Trả về [Either<Failure, T>] để biểu diễn kết quả thành công hoặc thất bại
  /// mà không ném exception ra ngoài.
  Future<Either<Failure, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
