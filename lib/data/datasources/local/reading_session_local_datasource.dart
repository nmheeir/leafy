import 'package:leafy/data/models/reading_session/reading_session_model.dart';

abstract class ReadingSessionLocalDatasource {
  Future<void> insertSession(ReadingSessionModel session);
}
