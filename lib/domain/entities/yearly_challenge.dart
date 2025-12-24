import 'package:equatable/equatable.dart';

class YearlyChallenge extends Equatable {
  final int year;
  final int? books;
  final int? pages;

  const YearlyChallenge({required this.year, this.books, this.pages});

  @override
  List<Object?> get props => [year, books, pages];
}
