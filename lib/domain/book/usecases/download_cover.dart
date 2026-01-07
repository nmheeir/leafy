import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/usecases/params/download_cover_params.dart';
import 'package:leafy/domain/book/usecases/results/donwload_cover_result.dart';
import 'package:leafy/domain/open_lib/repositories/open_lib_repository.dart';

@injectable
class DownloadCoverUseCase
    implements UseCase<DownloadCoverResult, DownloadCoverParams> {
  final OpenLibRepository openLibRepository;

  DownloadCoverUseCase(this.openLibRepository);

  @override
  Future<Either<Failure, DownloadCoverResult>> call(DownloadCoverParams params) async {
    return await openLibRepository.downloadCover(params);
  }
}
