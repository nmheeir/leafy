import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';
import 'package:leafy/domain/epub_reader/repositories/epub_reader_repository.dart';

@lazySingleton
class ParseEpubUseCase implements UseCase<EpubBook, String> {
  final EpubReaderRepository epubReaderRepository;

  ParseEpubUseCase(this.epubReaderRepository);

  @override
  Future<Either<Failure, EpubBook>> call(String filePath) async {
    return await epubReaderRepository.parseEpub(filePath);
  }
}
