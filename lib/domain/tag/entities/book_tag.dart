import 'package:equatable/equatable.dart';

class BookTag extends Equatable {
  final int? id;
  final int bookId;
  final int tagId;
  final int orderIndex;
  final DateTime createdAt;

  const BookTag({
    this.id,
    required this.bookId,
    required this.tagId,
    this.orderIndex = 0,
    required this.createdAt,
  });

  factory BookTag.empty({DateTime? now}) {
    final current = now ?? DateTime.now();
    return BookTag(
      id: null,
      bookId: 0,
      tagId: 0,
      orderIndex: 0,
      createdAt: current,
    );
  }

  BookTag copyWith({
    int? id,
    int? bookId,
    int? tagId,
    int? orderIndex,
    DateTime? createdAt,
  }) {
    return BookTag(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      tagId: tagId ?? this.tagId,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, bookId, tagId, orderIndex, createdAt];
}
