import 'package:equatable/equatable.dart';

class AddTagToBookByIdParams extends Equatable {
  final int bookId;
  final int tagId;

  const AddTagToBookByIdParams({required this.bookId, required this.tagId});

  @override
  List<Object?> get props => [bookId, tagId];
}
