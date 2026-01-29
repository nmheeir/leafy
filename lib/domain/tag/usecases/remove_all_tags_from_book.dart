import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';

@injectable
class RemoveAllTagsFromBookUseCase implements UseCase<Unit, int> {
  final BookTagRepository _repository;

  const RemoveAllTagsFromBookUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(int params) async {
    return _repository.removeAllTagsFromBook(params);
  }
}
