import 'package:equatable/equatable.dart';

class UpdateTagOrderParams extends Equatable {
  final int bookId;
  final List<int> tagIds;

  const UpdateTagOrderParams({required this.bookId, required this.tagIds});

  @override
  List<Object?> get props => [bookId, tagIds];
}
