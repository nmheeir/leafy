import 'package:equatable/equatable.dart';

class GetBookResourcesParams extends Equatable {
  final int bookId;

  const GetBookResourcesParams({required this.bookId});

  @override
  List<Object> get props => [bookId];
}
