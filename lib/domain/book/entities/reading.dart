import 'package:equatable/equatable.dart';

class Reading extends Equatable {
  final DateTime? startDate;
  final DateTime? finishDate;
  final int? readingTimeMs;

  const Reading({this.startDate, this.finishDate, this.readingTimeMs});

  Reading copyWith({
    DateTime? startDate,
    DateTime? finishDate,
    int? readingTimeMs,
  }) {
    return Reading(
      startDate: startDate ?? this.startDate,
      finishDate: finishDate ?? this.finishDate,
      readingTimeMs: readingTimeMs ?? this.readingTimeMs,
    );
  }

  @override
  List<Object?> get props => [startDate, finishDate, readingTimeMs];
}
