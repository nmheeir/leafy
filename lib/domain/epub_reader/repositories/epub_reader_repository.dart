import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';

abstract class EpubReaderRepository {
  Future<Either<Failure, EpubBook>> parseEpub(String filePath);
}
