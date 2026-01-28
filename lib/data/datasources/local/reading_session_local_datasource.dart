import 'package:leafy/data/models/reading_session/reading_session_model.dart';

abstract class ReadingSessionLocalDatasource {
  Future<void> insertSession(ReadingSessionModel session);

  /// Get all sessions for a specific book
  Future<List<ReadingSessionModel>> getSessionsByBookId(int bookId);

  /// Get all sessions (for statistics)
  Future<List<ReadingSessionModel>> getAllSessions();

  /// Delete all sessions for a specific book
  Future<void> deleteSessionsByBookId(int bookId);
}
