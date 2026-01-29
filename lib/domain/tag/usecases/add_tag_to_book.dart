import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/add_tag_to_book_params.dart';

@injectable
class AddTagToBookUseCase implements UseCase<Unit, AddTagToBookParams> {
  final BookTagRepository _repository;

  const AddTagToBookUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(AddTagToBookParams params) async {
    return _repository.addTagToBook(params.bookId, params.tagName);
  }
}
