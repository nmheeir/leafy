import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/epub_file/repositories/epub_file_repository.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';
import 'package:leafy/domain/epub_reader/repositories/epub_reader_repository.dart';

@lazySingleton
class OpenNetworkBookUseCase implements UseCase<EpubBook, String> {
  final EpubFileRepository _fileRepository;
  final EpubReaderRepository _readerRepository;

  OpenNetworkBookUseCase(this._fileRepository, this._readerRepository);

  @override
  Future<Either<Failure, EpubBook>> call(String url) async {
    final fileResult = await _fileRepository.getEpub(url: url);

    return fileResult.fold((failure) => Left(failure), (file) async {
      return await _readerRepository.parseEpub(file.path);
    });
  }
}
