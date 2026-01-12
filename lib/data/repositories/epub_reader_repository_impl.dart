import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/epub_reader_local_datasource.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';
import 'package:leafy/domain/epub_reader/repositories/epub_reader_repository.dart';

@LazySingleton(as: EpubReaderRepository)
class EpubBookRepositoryImpl implements EpubReaderRepository {
  final EpubReaderLocalDataSource dataSource;

  EpubBookRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, EpubBook>> parseEpub(String filePath) async {
    try {
      final bookModel = await dataSource.parseEpub(filePath);
      return Right(bookModel.toEntity());
    } catch (e) {
      return Left(Failure.parse(e.toString()));
    }
  }
}
