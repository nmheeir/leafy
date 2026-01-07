import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/epub_cache/repositories/epub_cache_repository.dart';
import 'package:leafy/domain/epub_cache/usecases/params/get_epub_param.dart';

@injectable
class GetEpubUseCase implements UseCase<File, GetEpubParam> {
  final EpubCacheRepository epubCacheRepository;

  GetEpubUseCase(this.epubCacheRepository);

  // NOTE: cần trả về EpubMeta
  @override
  Future<Either<Failure, File>> call(GetEpubParam params) {
    return epubCacheRepository.getEpub(
      url: params.url,
      onProgress: params.onProgress,
      forceReload: params.forceReload,
      cancelToken: params.cancelToken,
    );
  }
}
