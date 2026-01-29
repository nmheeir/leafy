import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';

@injectable
class CountBooksForTagUseCase implements UseCase<int, int> {
  final BookTagRepository _repository;

  const CountBooksForTagUseCase(this._repository);

  @override
  Future<Either<Failure, int>> call(int params) async {
    return _repository.countBooksForTag(params);
  }
}
