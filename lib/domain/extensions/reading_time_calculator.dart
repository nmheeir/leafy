import 'package:leafy/domain/book/entities/reading.dart';

extension ReadingTimeCalculator on Reading {
  int get days => (readingTimeMs ?? 0) ~/ (24 * 3600 * 1000);

  int get hours {
    int remainingMs = (readingTimeMs ?? 0) % (24 * 3600 * 1000);
    return remainingMs ~/ (3600 * 1000);
  }

  int get minutes {
    int remainingMs = (readingTimeMs ?? 0) % (3600 * 1000);
    return remainingMs ~/ (60 * 1000);
  }
}
