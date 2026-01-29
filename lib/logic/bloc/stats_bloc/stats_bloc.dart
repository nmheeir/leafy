import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/stats_result.dart';
import 'package:leafy/domain/book/usecases/stat_calculator.dart';
import 'package:leafy/domain/statistics/entities/daily_reading.dart';
import 'package:leafy/domain/statistics/entities/genre_stats.dart';
import 'package:leafy/domain/statistics/repositories/stats_repository.dart';

import 'package:logger/logger.dart';

part 'stats_event.dart';
part 'stats_state.dart';

@injectable
class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final StatsCalculator _statsCalculator;
  final StatsRepository _statsRepository;
  final Logger _logger;

  StatsBloc(this._statsCalculator, this._statsRepository, this._logger)
    : super(StatsLoading()) {
    on<StatsLoad>(_onStatsLoad);
  }

  Future<void> _onStatsLoad(StatsLoad event, Emitter<StatsState> emit) async {
    _logger.d('StatsBloc: Loading stats for ${event.books.length} books');
    emit(StatsLoading());

    try {
      // 1. Calculate existing stats (Legacy & Summaries)
      final statsResult = _statsCalculator.calculate(event.books);
      _logger.d(
        'StatsBloc: Calculator result obtained. Years: ${statsResult.years}',
      );

      // 2. Fetch Daily Reading (Last 365 days)
      final now = DateTime.now();
      final oneYearAgo = now.subtract(const Duration(days: 365));
      final dailyResult = await _statsRepository.getDailyReadingActivity(
        oneYearAgo,
        now,
      );
      _logger.d(
        'StatsBloc: Daily reading result: ${dailyResult.isRight() ? "Success" : "Failure"}',
      );

      // 3. Fetch Genre Stats
      final genreResult = await _statsRepository.getGenreStats();
      _logger.d(
        'StatsBloc: Genre stats result: ${genreResult.isRight() ? "Success" : "Failure"}',
      );

      // 4. Combine Results
      final dailyReadings = dailyResult.getOrElse((_) => []);
      final genres = genreResult.getOrElse((_) => []);

      _logger.d(
        'StatsBloc: Emitting StatsLoaded with dailyReadings: ${dailyReadings.length}, genres: ${genres.length}',
      );
      emit(
        StatsLoaded(
          result: statsResult,
          dailyReadingActivity: dailyReadings,
          genreStats: genres,
        ),
      );
    } on StatsEmptyException {
      _logger.e('StatsBloc: StatsEmptyException caught');
      emit(const StatsFailure(StatsFailureType.emptyData));
    } catch (e, stackTrace) {
      _logger.e(
        'StatsBloc: Unknown error caught',
        error: e,
        stackTrace: stackTrace,
      );
      emit(const StatsFailure(StatsFailureType.unknown));
    }
  }
}
