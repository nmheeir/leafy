import 'package:injectable/injectable.dart';
import 'package:leafy/data/datasources/local/reader_progress_local_datasource.dart';
import 'package:leafy/data/models/reader_progress.dart/reader_progress_model.dart';
import 'package:leafy/domain/reader_progress/entities/reader_progress.dart';
import 'package:leafy/domain/reader_progress/repositories/reader_progress_repository.dart';

@LazySingleton(as: ReaderProgressRepository)
class ReaderProgressRepositoryImpl implements ReaderProgressRepository {
  final ReaderProgressLocalDatasource _datasource;

  ReaderProgressRepositoryImpl(this._datasource);

  @override
  Future<ReaderProgress?> getProgress(int resourceId) async {
    final model = await _datasource.getByResourceId(resourceId);
    if (model == null) return null;
    return model.toEntity();
  }

  @override
  Future<void> saveProgress({
    required int resourceId,
    required String locator,
    required double progress,
    required DateTime lastReadAt,
  }) async {
    await _datasource.upsert(
      ReaderProgressModel(
        resourceId: resourceId,
        locator: locator,
        progressPct: progress,
        lastReadAt: lastReadAt,
      ),
    );
  }
}
