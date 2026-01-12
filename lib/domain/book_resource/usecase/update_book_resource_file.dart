import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/book_resource/usecase/params/update_book_resource_file_params.dart';

@injectable
class UpdateBookResourceFileUseCase
    implements UseCase<Unit, UpdateBookResourceFileParams> {
  final BookResourceRepository repository;

  UpdateBookResourceFileUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateBookResourceFileParams params) {
    return repository.updateFilePath(
      resourceUuid: params.resourceUuid,
      newPath: params.newPath,
      newFileHash: params.newFileHash,
      newFileSize: params.newFileSize,
    );
  }
}
