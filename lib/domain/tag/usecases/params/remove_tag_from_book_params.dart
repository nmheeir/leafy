import 'package:equatable/equatable.dart';

class RemoveTagFromBookParams extends Equatable {
  final int bookId;
  final int tagId;

  const RemoveTagFromBookParams({required this.bookId, required this.tagId});

  @override
  List<Object?> get props => [bookId, tagId];
}
