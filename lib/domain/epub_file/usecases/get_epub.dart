import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/epub_file/repositories/epub_file_repository.dart';
import 'package:leafy/domain/epub_file/usecases/params/get_epub_param.dart';

@injectable
class GetEpubUseCase implements UseCase<File, GetEpubParam> {
  final EpubFileRepository epubFileRepository;

  GetEpubUseCase(this.epubFileRepository);

  @override
  Future<Either<Failure, File>> call(GetEpubParam params) {
    return epubFileRepository.getEpub(
      url: params.url,
      onProgress: params.onProgress,
      forceReload: params.forceReload,
      cancelToken: params.cancelToken,
    );
  }
}
