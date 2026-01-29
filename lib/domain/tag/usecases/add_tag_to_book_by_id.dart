import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/add_tag_to_book_by_id_params.dart';

@injectable
class AddTagToBookByIdUseCase implements UseCase<Unit, AddTagToBookByIdParams> {
  final BookTagRepository _repository;

  const AddTagToBookByIdUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(AddTagToBookByIdParams params) async {
    return _repository.addTagToBookById(params.bookId, params.tagId);
  }
}
