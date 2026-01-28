import 'package:leafy/data/models/reading_session/reading_session_model.dart';

abstract class ReadingSessionLocalDatasource {
  Future<void> insertSession(ReadingSessionModel session);

  /// Get all sessions for a specific book (via book_resources join)
  Future<List<ReadingSessionModel>> getSessionsByBookId(int bookId);

  /// Get all sessions (for statistics)
  Future<List<ReadingSessionModel>> getAllSessions();

  /// Delete all sessions for a specific book
  Future<void> deleteSessionsByBookId(int bookId);

  /// Get total reading duration for a book in milliseconds
  Future<int> getTotalDurationByBookId(int bookId);

  /// Get session count for a book
  Future<int> getSessionCountByBookId(int bookId);

  /// Get the most recent session for a book
  Future<ReadingSessionModel?> getLastSessionByBookId(int bookId);

  /// Get sessions with resource info (for history display)
  Future<List<Map<String, dynamic>>> getSessionsWithResourceByBookId(
    int bookId,
  );
}
