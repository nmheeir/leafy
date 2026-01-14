import 'package:leafy/domain/reading_session/entities/reading_session.dart';

abstract class ReadingSessionRepository {
  Future<void> logSession(ReadingSession session);
}
