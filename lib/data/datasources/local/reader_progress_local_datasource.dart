abstract class ReaderProgressLocalDatasource {
  Future<void> upsert({
    required int resourceId,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  });

  Future<void> deleteByResourceId(int resourceId);
}
