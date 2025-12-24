import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/entities/ol_search_result.dart';
import 'package:leafy/domain/repositories/open_lib_repository.dart';

@injectable
class OpenLibSearch {
  final OpenLibRepository openLibRepository;

  OpenLibSearch(this.openLibRepository);

  Future<Either<Failure, OLSearchResult>> call({
    required String query,
    required int offset,
    required int limit,
    required OLSearchType searchType,
  }) async {
    return await openLibRepository.search(
      query: query,
      offset: offset,
      limit: limit,
      searchType: searchType,
    );
  }
}
