import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/constants/enums/storage_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';

abstract class BookResourceRepository {
  /* --------------------------------------------------
   * 1. Query / Load
   * -------------------------------------------------- */

  /// Lấy tất cả resource của một cuốn sách
  Future<Either<Failure, List<BookResource>>> getResourcesByBookId(int bookId);

  /// Lấy resource theo UUID (entry point cho reader, deep link)
  Future<Either<Failure, Option<BookResource>>> getResourceByUuid(String uuid);

  /// Lấy resource theo đường dẫn file
  Future<Either<Failure, Option<BookResource>>> getResourceByPath(String path);

  /// Lấy resource đang đọc gần nhất của một cuốn sách
  Future<Either<Failure, Option<BookResource>>> getLastReadResource(int bookId);

  /* --------------------------------------------------
   * 2. Reader progress
   * -------------------------------------------------- */

  /// Cập nhật vị trí đọc (CFI / page / anchor)
  Future<Either<Failure, Unit>> saveReaderProgress({
    required String resourceUuid,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  });

  /// Reset progress của một resource (đổi file, đọc lại)
  Future<Either<Failure, Unit>> clearReaderProgress(String resourceUuid);

  /* --------------------------------------------------
   * 3. Resource lifecycle
   * -------------------------------------------------- */

  /// Thêm resource mới (import file)
  Future<Either<Failure, BookResource>> addResource({
    required int bookId,
    required String uuid,
    required BookResourceFormat format,
    required String filePath,
    required StorageType storageType,
    String? url,
    String? fileHash,
    int? fileSize,
    String? language,
  });

  /// Cập nhật đường dẫn file (file bị move / replace)
  Future<Either<Failure, Unit>> updateFilePath({
    required String resourceUuid,
    required String newPath,
    String? newFileHash,
    int? newFileSize,
  });

  /// Xóa resource (xóa file đọc, không xóa book)
  Future<Either<Failure, Unit>> deleteResource(String resourceUuid);

  /* --------------------------------------------------
   * 4. Validation / Integrity
   * -------------------------------------------------- */

  /// Kiểm tra file đã tồn tại trong DB chưa (tránh duplicate)
  Future<Either<Failure, bool>> existsByFileHash(
    String fileHash, {
    int? bookId,
  });

  /// Kiểm tra UUID đã tồn tại chưa
  Future<Either<Failure, bool>> existsByUuid(String uuid);

  /* --------------------------------------------------
   * 5. Maintenance / Recovery
   * -------------------------------------------------- */

  /// Phát hiện resource có file bị mất hoặc thay đổi
  Future<Either<Failure, List<BookResource>>> getBrokenResources();

  /// Đồng bộ lại progress sau khi restore DB
  Future<Either<Failure, Unit>> rebindProgress({
    required String resourceUuid,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  });
}
