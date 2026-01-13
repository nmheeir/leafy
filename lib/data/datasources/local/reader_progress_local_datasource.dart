import 'package:leafy/data/models/reader_progress.dart/reader_progress_model.dart';

abstract class ReaderProgressLocalDatasource {
  Future<void> upsert(ReaderProgressModel model);

  Future<void> deleteByResourceId(int resourceId);
}
