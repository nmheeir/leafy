import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import '../entities/book_mark.dart';

abstract class BookMarkRepository {
  Future<Either<Failure, int>> saveBookMark(BookMark mark);
  Future<Either<Failure, List<BookMark>>> getBookMarks(int resourceId);
  Future<Either<Failure, void>> deleteBookMark(int id);
}
