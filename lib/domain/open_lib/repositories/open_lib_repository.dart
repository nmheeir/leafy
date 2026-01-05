import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/constants/enums/ol_search_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/open_lib/entities/ol_search_result.dart';

abstract class OpenLibRepository {
  Future<Either<Failure, OLSearchResult>> search({
    required String query,
    required int offset,
    required int limit,
    required OLSearchType searchType,
  });
}
