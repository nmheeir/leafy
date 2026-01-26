import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import '../repositories/book_mark_repository.dart';

@lazySingleton
class DeleteBookMarkUseCase {
  final BookMarkRepository _repository;

  DeleteBookMarkUseCase(this._repository);

  Future<Either<Failure, void>> call(int id) {
    return _repository.deleteBookMark(id);
  }
}
