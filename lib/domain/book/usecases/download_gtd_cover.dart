import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/usecases/results/donwload_cover_result.dart';
import 'package:leafy/domain/gutendex/repositories/gutendex_repository.dart';

@injectable
class DownloadGtdCoverUseCase implements UseCase<DownloadCoverResult, String> {
  final GutendexRepository gutendexRepository;

  DownloadGtdCoverUseCase(this.gutendexRepository);

  @override
  Future<Either<Failure, DownloadCoverResult>> call(String gtdCoverUrl) async {
    return await gutendexRepository.downloadCover(gtdCoverUrl: gtdCoverUrl);
  }
}
