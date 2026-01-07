import 'package:equatable/equatable.dart';

class DeleteBookResourceParams extends Equatable {
  final String resourceUuid;

  const DeleteBookResourceParams({required this.resourceUuid});

  @override
  List<Object> get props => [resourceUuid];
}
