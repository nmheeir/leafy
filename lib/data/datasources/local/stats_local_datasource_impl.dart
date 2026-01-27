import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/datasources/local/stats_local_datasource.dart';
import 'package:leafy/data/models/stats/daily_reading_model.dart';
import 'package:leafy/data/models/stats/genre_stats_model.dart';

@LazySingleton(as: StatsLocalDataSource)
class StatsLocalDataSourceImpl implements StatsLocalDataSource {
  final DatabaseService _db;

  StatsLocalDataSourceImpl(this._db);

  @override
  Future<List<DailyReadingModel>> getDailyReadingDuration(
    int startContext,
    int endContext,
  ) async {
    final db = await _db.database;
    // reading_sessions: start_time (int), duration_ms (int)
    // We group by day. But start_time is ms.
    // SQLite doesn't have easy Date functions on int ms unless we convert.
    // simpler: fetch all within range and process in Dart? Or use strftime.
    // strftime('%Y-%m-%d', start_time / 1000, 'unixepoch')

    final result = await db.rawQuery(
      '''
      SELECT 
        start_time,
        duration_ms
      FROM reading_sessions
      WHERE start_time BETWEEN ? AND ?
    ''',
      [startContext, endContext],
    );

    // We process grouping in Dart to be safe with timezones or strict SQL limits
    return result.map((e) => DailyReadingModel.fromJson(e)).toList();
  }

  @override
  Future<List<GenreStatsModel>> getReadingDistributionByFormat() async {
    final db = await _db.database;
    // Join books -> book_resources -> reading_sessions
    // to get total duration per format

    /*
      books (id, book_format)
      book_resources (id, book_id)
      reading_sessions (resource_id, duration_ms)
    */

    final result = await db.rawQuery('''
      SELECT 
        b.book_format as format,
        COUNT(DISTINCT b.id) as book_count,
        COALESCE(SUM(rs.duration_ms), 0) as total_duration
      FROM books b
      LEFT JOIN book_resources br ON br.book_id = b.id
      LEFT JOIN reading_sessions rs ON rs.resource_id = br.id
      WHERE b.deleted = 0
      GROUP BY b.book_format
    ''');

    return result.map((e) => GenreStatsModel.fromJson(e)).toList();
  }
}
