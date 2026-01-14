import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/reading_session/entities/reading_session.dart';
import 'package:leafy/domain/reading_session/repositories/reading_session_repository.dart';

@lazySingleton
class LogReadingSessionByPathUseCase {
  final ReadingSessionRepository _sessionRepository;
  final BookResourceRepository _resourceRepository;

  LogReadingSessionByPathUseCase(
    this._sessionRepository,
    this._resourceRepository,
  );

  Future<void> call({
    required String sessionId,
    required String filePath,
    required DateTime startTime,
    required DateTime endTime,
    required int durationMs,
    required String? startLocator,
    required String? endLocator,
    int? chapterIndex,
  }) async {
    final resourceOrFailure = await _resourceRepository.getResourceByPath(
      filePath,
    );

    await resourceOrFailure.fold(
      (failure) async {
        // Silently ignore failure for now as this is analytics/tracking
      },
      (resourceOption) async {
        await resourceOption.fold(
          () async {
            // Resource not found, cannot log
          },
          (resource) async {
            if (resource.id == null) return;

            final session = ReadingSession(
              id: sessionId,
              resourceId: resource.id!,
              startTime: startTime,
              endTime: endTime,
              durationMs: durationMs,
              startLocator: startLocator,
              endLocator: endLocator,
              chapterIndex: chapterIndex,
            );

            await _sessionRepository.logSession(session);
          },
        );
      },
    );
  }
}
