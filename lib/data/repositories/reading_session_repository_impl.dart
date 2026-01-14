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
}
