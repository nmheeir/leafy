import 'package:equatable/equatable.dart';
import 'package:leafy/domain/book/entities/book.dart';

class BookYearlyStat extends Equatable {
  final Book? book;
  final int? year;
  final String value;
  final String? title;

  const BookYearlyStat({this.book, this.year, this.title, required this.value});

  @override
  List<Object?> get props => [book, year, value, title];
}
