import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/book_resource/usecase/params/add_book_resource_params.dart';

@injectable
class AddBookResourceUseCase
    implements UseCase<BookResource, AddBookResourceParams> {
  final BookResourceRepository repository;

  AddBookResourceUseCase(this.repository);

  @override
  Future<Either<Failure, BookResource>> call(AddBookResourceParams params) {
    return repository.addResource(
      bookId: params.bookId,
      uuid: params.uuid,
      format: params.format,
      filePath: params.filePath,
      fileHash: params.fileHash,
      fileSize: params.fileSize,
      language: params.language,
      storageType: params.storageType,
      url: params.url,
    );
  }
}
