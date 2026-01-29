import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/get_frequently_tagged_together_params.dart';

@injectable
class GetFrequentlyTaggedTogetherUseCase
    implements
        UseCase<List<Map<String, dynamic>>, GetFrequentlyTaggedTogetherParams> {
  final BookTagRepository _repository;

  const GetFrequentlyTaggedTogetherUseCase(this._repository);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> call(
    GetFrequentlyTaggedTogetherParams params,
  ) async {
    return _repository.getFrequentlyTaggedTogether(
      params.tagId,
      limit: params.limit,
    );
  }
}
