import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/book_resource/usecase/params/check_book_resource_exist_by_hash_params.dart';

@injectable
class CheckBookResourceExistsByHashUseCase
    implements UseCase<bool, CheckBookResourceExistsByHashParams> {
  final BookResourceRepository repository;

  CheckBookResourceExistsByHashUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    CheckBookResourceExistsByHashParams params,
  ) {
    return repository.existsByFileHash(params.fileHash);
  }
}
