import 'package:leafy/domain/reading_session/entities/reading_session.dart';

abstract class ReadingSessionRepository {
  Future<void> logSession(ReadingSession session);

  /// Get all sessions for a specific book
  Future<List<ReadingSession>> getSessionsByBookId(int bookId);

  /// Get all sessions (for statistics)
  Future<List<ReadingSession>> getAllSessions();

  /// Delete all sessions for a specific book
  Future<void> deleteSessionsByBookId(int bookId);
}
