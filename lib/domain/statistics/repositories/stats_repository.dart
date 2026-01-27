import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/statistics/entities/daily_reading.dart';
import 'package:leafy/domain/statistics/entities/genre_stats.dart';

abstract class StatsRepository {
  Future<Either<Failure, List<DailyReading>>> getDailyReadingActivity(
    DateTime start,
    DateTime end,
  );
  Future<Either<Failure, List<GenreStats>>> getGenreStats();
}
