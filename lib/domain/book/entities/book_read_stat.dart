import 'package:equatable/equatable.dart';

class BookReadStat extends Equatable {
  final int? year;
  final List<int> values;

  const BookReadStat({this.year, required this.values});

  @override
  List<Object?> get props => [year, values];
}
