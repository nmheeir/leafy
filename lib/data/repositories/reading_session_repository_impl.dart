import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/reading_session_local_datasource.dart';
import 'package:leafy/data/models/reading_session/reading_session_model.dart';
import 'package:leafy/domain/reading_session/entities/reading_session.dart';
import 'package:leafy/domain/reading_session/repositories/reading_session_repository.dart';

@LazySingleton(as: ReadingSessionRepository)
class ReadingSessionRepositoryImpl implements ReadingSessionRepository {
  final ReadingSessionLocalDatasource _datasource;

  ReadingSessionRepositoryImpl(this._datasource);

  @override
  Future<void> logSession(ReadingSession session) async {
    final model = ReadingSessionModel(
      id: session.id,
      resourceId: session.resourceId,
      startTime: session.startTime.millisecondsSinceEpoch,
      endTime: session.endTime.millisecondsSinceEpoch,
      durationMs: session.durationMs,
      startLocator: session.startLocator,
      endLocator: session.endLocator,
      chapterIndex: session.chapterIndex,
    );
    await _datasource.insertSession(model);
  }

  @override
  Future<List<ReadingSession>> getSessionsByBookId(int bookId) async {
    final models = await _datasource.getSessionsByBookId(bookId);
    return models.map(_modelToEntity).toList();
  }

  @override
  Future<List<ReadingSession>> getAllSessions() async {
    final models = await _datasource.getAllSessions();
    return models.map(_modelToEntity).toList();
  }

  @override
  Future<void> deleteSessionsByBookId(int bookId) async {
    await _datasource.deleteSessionsByBookId(bookId);
  }

  @override
  Future<ReadingHistorySummary> getHistorySummaryByBookId(int bookId) async {
    final totalDuration = await _datasource.getTotalDurationByBookId(bookId);
    final sessionCount = await _datasource.getSessionCountByBookId(bookId);
    final lastSession = await _datasource.getLastSessionByBookId(bookId);

    return ReadingHistorySummary(
      totalDurationMs: totalDuration,
      sessionCount: sessionCount,
      lastReadAt: lastSession != null
          ? DateTime.fromMillisecondsSinceEpoch(lastSession.endTime)
          : null,
    );
  }

  @override
  Future<List<SessionWithResource>> getSessionsWithResourceByBookId(
    int bookId,
  ) async {
    final rawData = await _datasource.getSessionsWithResourceByBookId(bookId);

    return rawData.map((row) {
      final session = ReadingSession(
        id: row['id'] as String,
        resourceId: row['resource_id'] as int,
        startTime: DateTime.fromMillisecondsSinceEpoch(
          row['start_time'] as int,
        ),
        endTime: DateTime.fromMillisecondsSinceEpoch(row['end_time'] as int),
        durationMs: row['duration_ms'] as int,
        startLocator: row['start_locator'] as String?,
        endLocator: row['end_locator'] as String?,
        chapterIndex: row['chapter_index'] as int?,
      );

      return SessionWithResource(
        session: session,
        resourceFormat: row['resource_format'] as String? ?? 'unknown',
      );
    }).toList();
  }

  ReadingSession _modelToEntity(ReadingSessionModel model) {
    return ReadingSession(
      id: model.id,
      resourceId: model.resourceId,
      startTime: DateTime.fromMillisecondsSinceEpoch(model.startTime),
      endTime: DateTime.fromMillisecondsSinceEpoch(model.endTime),
      durationMs: model.durationMs,
      startLocator: model.startLocator,
      endLocator: model.endLocator,
      chapterIndex: model.chapterIndex,
    );
  }
}
