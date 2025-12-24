import 'package:equatable/equatable.dart';
import 'package:leafy/domain/entities/reading_time.dart';

class Reading extends Equatable {
  final DateTime? startDate;
  final DateTime? finishDate;
  final ReadingTime? customReadingTime;

  const Reading({this.startDate, this.finishDate, this.customReadingTime});

  Reading copyWith({
    DateTime? startDate,
    DateTime? finishDate,
    ReadingTime? customReadingTime,
  }) {
    return Reading(
      startDate: startDate ?? this.startDate,
      finishDate: finishDate ?? this.finishDate,
      customReadingTime: customReadingTime ?? this.customReadingTime,
    );
  }

  @override
  List<Object?> get props => [startDate, finishDate, customReadingTime];
}
