import 'package:leafy/data/models/book_resource/book_resource_model.dart';

abstract class BookResourceLocalDatasource {
  Future<List<BookResourceModel>> getByBookId(int bookId);
  Future<BookResourceModel?> getByUuid(String uuid);
  Future<BookResourceModel?> getLastReadByBookId(int bookId);

  Future<int> insert(BookResourceModel model);
  Future<void> updateFilePath({
    required String uuid,
    required String path,
    String? hash,
    int? size,
  });
  Future<void> deleteByUuid(String uuid);

  Future<bool> existsByUuid(String uuid);
  Future<bool> existsByFileHash(String hash, {int? bookId});

  Future<BookResourceModel?> findByPath(String path);

  Future<List<BookResourceModel>> getBrokenResources();
}

abstract class ReaderProgressDao {
  Future<void> upsert({
    required int resourceId,
    required String locator,
    required double progress,
    required int lastReadAt,
  });

  Future<void> deleteByResourceId(int resourceId);
}
