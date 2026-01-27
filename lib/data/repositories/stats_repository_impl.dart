import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/stats_local_datasource.dart';
import 'package:leafy/domain/statistics/entities/daily_reading.dart';
import 'package:leafy/domain/statistics/entities/genre_stats.dart';
import 'package:leafy/domain/statistics/repositories/stats_repository.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: StatsRepository)
class StatsRepositoryImpl implements StatsRepository {
  final StatsLocalDataSource _datasource;
  final Logger _logger;

  StatsRepositoryImpl(this._datasource, this._logger);

  @override
  Future<Either<Failure, List<DailyReading>>> getDailyReadingActivity(
    DateTime start,
    DateTime end,
  ) async {
    try {
      final startMs = start.millisecondsSinceEpoch;
      final endMs = end.millisecondsSinceEpoch;

      final models = await _datasource.getDailyReadingDuration(startMs, endMs);

      final entities = models.map((e) {
        return DailyReading(
          date: DateTime.fromMillisecondsSinceEpoch(e.startTime),
          duration: Duration(milliseconds: e.durationMs),
        );
      }).toList();

      return Right(entities);
    } catch (e, s) {
      _logger.e(
        'StatsRepository: getDailyReadingActivity failed',
        error: e,
        stackTrace: s,
      );
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GenreStats>>> getGenreStats() async {
    try {
      final models = await _datasource.getReadingDistributionByFormat();

      final entities = models.map((e) {
        return GenreStats(
          genre: e.format,
          bookCount: e.bookCount,
          duration: Duration(milliseconds: e.totalDuration),
        );
      }).toList();

      return Right(entities);
    } catch (e, s) {
      _logger.e(
        'StatsRepository: getGenreStats failed',
        error: e,
        stackTrace: s,
      );
      return Left(Failure.database(e.toString()));
    }
  }
}
