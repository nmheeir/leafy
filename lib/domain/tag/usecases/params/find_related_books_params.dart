import 'package:equatable/equatable.dart';

class FindRelatedBooksParams extends Equatable {
  final int bookId;
  final int limit;

  const FindRelatedBooksParams({required this.bookId, this.limit = 10});

  @override
  List<Object?> get props => [bookId, limit];
}
