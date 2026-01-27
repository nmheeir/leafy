import 'package:equatable/equatable.dart';

class DailyReading extends Equatable {
  final DateTime date;
  final Duration duration;

  const DailyReading({required this.date, required this.duration});

  @override
  List<Object?> get props => [date, duration];
}
