import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/ol_search_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/remote/ol_remote_data_source.dart';
import 'package:leafy/domain/open_lib/entities/ol_search_result.dart';
import 'package:leafy/domain/open_lib/repositories/open_lib_repository.dart';

@LazySingleton(as: OpenLibRepository)
class OpenLibRepositoryImpl implements OpenLibRepository {
  final OlRemoteDataSource remoteDataSource;

  const OpenLibRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, OLSearchResult>> search({
    required String query,
    required int offset,
    required int limit,
    required OLSearchType searchType,
  }) async {
    try {
      final result = await remoteDataSource.getResults(
        query: searchType == OLSearchType.general ? query : null,
        author: searchType == OLSearchType.author ? query : null,
        title: searchType == OLSearchType.title ? query : null,
        isbn: searchType == OLSearchType.isbn ? query : null,
        olid: searchType == OLSearchType.openlibraryId ? query : null,
        limit: 20,
        offset: offset,
      );

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}
