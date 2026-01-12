import 'package:equatable/equatable.dart';

class ClearReaderProgressParams extends Equatable {
  final String resourceUuid;

  const ClearReaderProgressParams({required this.resourceUuid});

  @override
  List<Object> get props => [resourceUuid];
}
