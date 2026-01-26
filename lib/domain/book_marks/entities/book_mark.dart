import 'package:equatable/equatable.dart';

class BookMark extends Equatable {
  final int? id;
  final int resourceId;
  final int pageIndex;
  final int? startOffset;
  final int? endOffset;
  final int color; // int value of Color
  final String? text;
  final String rects; // JSON string of rects

  const BookMark({
    this.id,
    required this.resourceId,
    required this.pageIndex,
    this.startOffset,
    this.endOffset,
    required this.color,
    this.text,
    required this.rects,
  });

  @override
  List<Object?> get props => [
    id,
    resourceId,
    pageIndex,
    startOffset,
    endOffset,
    color,
    text,
    rects,
  ];
}
