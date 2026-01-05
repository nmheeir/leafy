import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/open_lib/entities/ol_work_result.dart';
import 'package:leafy/domain/open_lib/repositories/open_lib_repository.dart';

@injectable
class OlGetWorkUseCase implements UseCase<OLWorkResult, String> {
  final OpenLibRepository openLibRepository;

  OlGetWorkUseCase(this.openLibRepository);

  @override
  Future<Either<Failure, OLWorkResult>> call(String workId) async {
    return await openLibRepository.getWork(workId);
  }
}
