import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../domain/book_marks/entities/book_mark.dart';
import '../../domain/book_marks/repositories/book_mark_repository.dart';
import '../datasources/local/book_mark_local_datasource.dart';

@LazySingleton(as: BookMarkRepository)
class BookMarkRepositoryImpl implements BookMarkRepository {
  final BookMarkLocalDataSource _localDataSource;

  BookMarkRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, int>> saveBookMark(BookMark mark) async {
    try {
      final id = await _localDataSource.saveBookMark(mark);
      return Right(id);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookMark>>> getBookMarks(int resourceId) async {
    try {
      final marks = await _localDataSource.getBookMarks(resourceId);
      return Right(marks);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBookMark(int id) async {
    try {
      await _localDataSource.deleteBookMark(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.database(e.toString()));
    }
  }
}
