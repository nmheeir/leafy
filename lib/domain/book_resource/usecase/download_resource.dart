import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';
import 'package:leafy/domain/book_resource/usecase/params/download_resource_params.dart';

@injectable
class DownloadResourceUseCase implements UseCase<File, DownloadResourceParams> {
  final BookResourceRepository repository;

  DownloadResourceUseCase(this.repository);

  @override
  Future<Either<Failure, File>> call(DownloadResourceParams params) {
    return repository.downloadResource(
      fileName: params.fileName,
      url: params.url,
      cancelToken: params.cancelToken,
      onProgress: params.onProgress,
      forceReload: params.forceReload,
    );
  }
}
