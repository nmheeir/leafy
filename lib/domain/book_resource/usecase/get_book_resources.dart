import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/book_resource/usecase/params/get_book_resources_params.dart';

class GetBookResourcesUseCase
    implements UseCase<List<BookResource>, GetBookResourcesParams> {
  final BookResourceRepository repository;

  GetBookResourcesUseCase(this.repository);

  @override
  Future<Either<Failure, List<BookResource>>> call(
    GetBookResourcesParams params,
  ) {
    return repository.getResourcesByBookId(params.bookId);
  }
}
