import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/file_import/entities/file_temporary_object.dart';
import 'package:leafy/domain/file_import/services/file_picker_service.dart';

@lazySingleton
class PickLocalFilesUseCase
    implements UseCase<List<FileTemporaryObject>, NoParams> {
  final FilePickerService service;

  PickLocalFilesUseCase(this.service);

  @override
  Future<Either<Failure, List<FileTemporaryObject>>> call(NoParams params) {
    return service.pickFiles();
  }
}
