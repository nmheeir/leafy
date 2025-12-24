import 'package:equatable/equatable.dart';

class ReadingTime extends Equatable {
  final int days;
  final int hours;
  final int minutes;
  final int milliSeconds;

  const ReadingTime({
    required this.days,
    required this.hours,
    required this.minutes,
    required this.milliSeconds,
  });

  factory ReadingTime.fromMilliSeconds(int milliSeconds) {
    int timeInSeconds = milliSeconds ~/ 1000;
    int days = timeInSeconds ~/ (24 * 3600);

    timeInSeconds = timeInSeconds % (24 * 3600);
    int hours = timeInSeconds ~/ 3600;

    timeInSeconds %= 3600;
    int minutes = timeInSeconds ~/ 60;

    return ReadingTime(
      milliSeconds: milliSeconds,
      days: days,
      minutes: minutes,
      hours: hours,
    );
  }

  factory ReadingTime.toMilliSeconds(int days, hours, minutes) {
    int seconds = ((days * 86400) + (hours * 3600) + (minutes * 60)).toInt();
    return ReadingTime(
      milliSeconds: seconds * 1000,
      days: days,
      minutes: minutes,
      hours: hours,
    );
  }

  @override
  List<Object?> get props => [days, hours, minutes];
}
