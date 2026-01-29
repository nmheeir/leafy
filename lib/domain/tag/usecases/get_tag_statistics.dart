import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';

@injectable
class GetTagStatisticsUseCase implements UseCase<Map<Tag, int>, NoParams> {
  final TagRepository _repository;

  const GetTagStatisticsUseCase(this._repository);

  @override
  Future<Either<Failure, Map<Tag, int>>> call(NoParams params) async {
    return _repository.getTagStatistics();
  }
}
