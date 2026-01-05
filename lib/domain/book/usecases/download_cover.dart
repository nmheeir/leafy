import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/usecases/results/donwload_cover_result.dart';
import 'package:leafy/domain/open_lib/repositories/open_lib_repository.dart';

@injectable
class DownloadCoverUseCase implements UseCase<DownloadCoverResult, String> {
  final OpenLibRepository openLibRepository;

  DownloadCoverUseCase(this.openLibRepository);

  @override
  Future<Either<Failure, DownloadCoverResult>> call(String coverOLID) async {
    return await openLibRepository.downloadCover(coverOLID);
  }
}
