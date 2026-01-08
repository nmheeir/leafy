import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/book_resource/usecase/params/get_book_resource_by_uuid_params.dart';

@injectable
class GetBookResourceByUuidUseCase
    implements UseCase<Option<BookResource>, GetBookResourceByUuidParams> {
  final BookResourceRepository repository;

  GetBookResourceByUuidUseCase(this.repository);

  @override
  Future<Either<Failure, Option<BookResource>>> call(
    GetBookResourceByUuidParams params,
  ) {
    return repository.getResourceByUuid(params.uuid);
  }
}
