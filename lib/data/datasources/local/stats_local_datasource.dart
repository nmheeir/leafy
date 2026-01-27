import 'package:leafy/data/models/stats/daily_reading_model.dart';
import 'package:leafy/data/models/stats/genre_stats_model.dart'; // I will create these models

abstract class StatsLocalDataSource {
  Future<List<DailyReadingModel>> getDailyReadingDuration(
    int startContext,
    int endContext,
  );
  Future<List<GenreStatsModel>> getReadingDistributionByFormat();
}
