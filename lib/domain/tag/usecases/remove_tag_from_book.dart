import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/remove_tag_from_book_params.dart';

@injectable
class RemoveTagFromBookUseCase
    implements UseCase<Unit, RemoveTagFromBookParams> {
  final BookTagRepository _repository;

  const RemoveTagFromBookUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(RemoveTagFromBookParams params) async {
    return _repository.removeTagFromBook(params.bookId, params.tagId);
  }
}
