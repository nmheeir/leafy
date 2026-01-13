abstract class ReaderProgressRepository {
  Future<void> saveProgress({
    required int resourceId,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  });
}
