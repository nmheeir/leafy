import 'package:equatable/equatable.dart';

class AddTagToBookParams extends Equatable {
  final int bookId;
  final String tagName;

  const AddTagToBookParams({required this.bookId, required this.tagName});

  @override
  List<Object?> get props => [bookId, tagName];
}
