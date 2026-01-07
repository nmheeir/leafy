import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/book_resource_local_datasource.dart';
import 'package:leafy/data/datasources/local/reader_progress_local_datasource.dart';
import 'package:leafy/data/models/book_resource/book_resource_model.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';

@LazySingleton(as: BookResourceRepository)
class BookResourceRepositoryImpl implements BookResourceRepository {
  final BookResourceLocalDatasource _resourceDs;
  final ReaderProgressLocalDatasource _progressDs;

  BookResourceRepositoryImpl(this._resourceDs, this._progressDs);

  @override
  Future<Either<Failure, BookResource>> addResource({
    required int bookId,
    required String uuid,
    required BookResourceFormat format,
    required String filePath,
    String? fileHash,
    int? fileSize,
    String? language,
  }) async {
    try {
      final model = BookResourceModel(
        id: null,
        uuid: uuid,
        bookId: bookId,
        format: format,
        filePath: filePath,
        fileHash: fileHash,
        fileSize: fileSize,
        language: language,
        createdAt: DateTime.now(),
      );

      final id = await _resourceDs.insert(model);

      return Right(model.copyWith(id: id).toEntity());
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteResource(String resourceUuid) async {
    try {
      await _resourceDs.deleteByUuid(resourceUuid);
      return right(unit);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> existsByUuid(String uuid) async {
    try {
      final exists = await _resourceDs.existsByUuid(uuid);
      return Right(exists);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> existsByFileHash(String fileHash) async {
    try {
      final exists = await _resourceDs.existsByFileHash(fileHash);
      return Right(exists);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookResource>>> getResourcesByBookId(
    int bookId,
  ) async {
    try {
      final list = await _resourceDs.getByBookId(bookId);
      return Right(list.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Option<BookResource>>> getResourceByUuid(
    String uuid,
  ) async {
    try {
      final model = await _resourceDs.getByUuid(uuid);
      return Right(model == null ? const None() : Some(model.toEntity()));
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Option<BookResource>>> getLastReadResource(
    int bookId,
  ) async {
    try {
      final model = await _resourceDs.getLastReadByBookId(bookId);
      return Right(model == null ? const None() : Some(model.toEntity()));
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookResource>>> getBrokenResources() async {
    try {
      final list = await _resourceDs.getBrokenResources();
      return Right(list.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveReaderProgress({
    required String resourceUuid,
    required String locator,
    required double progress,
    required int lastReadAt,
  }) async {
    try {
      final resource = await _resourceDs.getByUuid(resourceUuid);
      if (resource == null) {
        return Left(Failure.notFound('Resource not found'));
      }

      await _progressDs.upsert(
        resourceId: resource.id!,
        locator: locator,
        progress: progress,
        lastReadAt: lastReadAt,
      );

      return right(unit);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> rebindProgress({
    required String resourceUuid,
    required String locator,
    required double progress,
    required int lastReadAt,
  }) {
    // Về bản chất giống saveReaderProgress
    return saveReaderProgress(
      resourceUuid: resourceUuid,
      locator: locator,
      progress: progress,
      lastReadAt: lastReadAt,
    );
  }

  @override
  Future<Either<Failure, Unit>> clearReaderProgress(String resourceUuid) async {
    try {
      final resource = await _resourceDs.getByUuid(resourceUuid);
      if (resource == null) {
        return Left(Failure.notFound('Resource not found'));
      }

      await _progressDs.deleteByResourceId(resource.id!);
      return right(unit);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateFilePath({
    required String resourceUuid,
    required String newPath,
    String? newFileHash,
    int? newFileSize,
  }) async {
    try {
      await _resourceDs.updateFilePath(
        uuid: resourceUuid,
        path: newPath,
        hash: newFileHash,
        size: newFileSize,
      );
      return right(unit);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }
}
