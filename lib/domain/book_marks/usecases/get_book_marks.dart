import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import '../entities/book_mark.dart';
import '../repositories/book_mark_repository.dart';

@lazySingleton
class GetBookMarksUseCase {
  final BookMarkRepository _repository;

  GetBookMarksUseCase(this._repository);

  Future<Either<Failure, List<BookMark>>> call(int resourceId) {
    return _repository.getBookMarks(resourceId);
  }
}
