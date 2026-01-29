import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/update_tag_order_params.dart';

@injectable
class UpdateTagOrderUseCase implements UseCase<Unit, UpdateTagOrderParams> {
  final BookTagRepository _repository;

  const UpdateTagOrderUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateTagOrderParams params) async {
    return _repository.updateTagOrder(params.bookId, params.tagIds);
  }
}
