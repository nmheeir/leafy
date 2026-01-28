import 'package:leafy/domain/reading_session/entities/reading_session.dart';

/// Summary stats for a book's reading history
class ReadingHistorySummary {
  final int totalDurationMs;
  final int sessionCount;
  final DateTime? lastReadAt;

  const ReadingHistorySummary({
    required this.totalDurationMs,
    required this.sessionCount,
    this.lastReadAt,
  });

  Duration get totalDuration => Duration(milliseconds: totalDurationMs);

  Duration get averageDuration => sessionCount > 0
      ? Duration(milliseconds: totalDurationMs ~/ sessionCount)
      : Duration.zero;
}

/// Session with resource format info for display
class SessionWithResource {
  final ReadingSession session;
  final String resourceFormat; // epub, pdf, audio

  const SessionWithResource({
    required this.session,
    required this.resourceFormat,
  });
}

abstract class ReadingSessionRepository {
  Future<void> logSession(ReadingSession session);

  /// Get all sessions for a specific book
  Future<List<ReadingSession>> getSessionsByBookId(int bookId);

  /// Get all sessions (for statistics)
  Future<List<ReadingSession>> getAllSessions();

  /// Delete all sessions for a specific book
  Future<void> deleteSessionsByBookId(int bookId);

  /// Get reading history summary for a book
  Future<ReadingHistorySummary> getHistorySummaryByBookId(int bookId);

  /// Get sessions with resource info for history display
  Future<List<SessionWithResource>> getSessionsWithResourceByBookId(int bookId);
}
