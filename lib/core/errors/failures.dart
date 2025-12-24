import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Lỗi do Server (API chết, 404, 500)
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

// Lỗi do mất mạng
class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

// Lỗi do dữ liệu cache
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
