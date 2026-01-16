import 'package:leafy/domain/reader_progress/entities/reader_progress.dart';

abstract class ReaderProgressRepository {
  Future<void> saveProgress({
    required int resourceId,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  });

  Future<ReaderProgress?> getProgress(int resourceId);
}
