import 'package:equatable/equatable.dart';

class GetBookResourceByUuidParams extends Equatable {
  final String uuid;

  const GetBookResourceByUuidParams({required this.uuid});

  @override
  List<Object> get props => [uuid];
}
