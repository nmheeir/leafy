import 'package:leafy/domain/file_import/entities/file_temporary_object.dart';

class ProcessLocalFilesParams {
  final List<FileTemporaryObject> files;
  final int? bookId;

  ProcessLocalFilesParams({required this.files, this.bookId});
}
