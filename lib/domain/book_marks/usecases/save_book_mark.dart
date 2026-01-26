import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import '../entities/book_mark.dart';
import '../repositories/book_mark_repository.dart';

@lazySingleton
class SaveBookMarkUseCase {
  final BookMarkRepository _repository;

  SaveBookMarkUseCase(this._repository);

  Future<Either<Failure, int>> call(BookMark mark) {
    return _repository.saveBookMark(mark);
  }
}
