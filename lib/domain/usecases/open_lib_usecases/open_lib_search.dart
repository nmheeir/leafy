import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/entities/ol_search_result.dart';
import 'package:leafy/domain/repositories/open_lib_repository.dart';
import 'package:leafy/domain/usecases/open_lib_usecases/open_lib_search_params.dart';

@injectable
class OpenLibSearchUseCase
    implements UseCase<OLSearchResult, OpenLibSearchParams> {
  final OpenLibRepository openLibRepository;

  OpenLibSearchUseCase(this.openLibRepository);

  @override
  Future<Either<Failure, OLSearchResult>> call(
    OpenLibSearchParams params,
  ) async {
    return await openLibRepository.search(
      query: params.query,
      offset: params.offset,
      limit: params.limit,
      searchType: params.searchType,
    );
  }
}
