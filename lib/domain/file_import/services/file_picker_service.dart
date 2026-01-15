import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/file_import/entities/file_temporary_object.dart';

abstract class FilePickerService {
  Future<Either<Failure, List<FileTemporaryObject>>> pickFiles();
}
