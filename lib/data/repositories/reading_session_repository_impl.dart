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
