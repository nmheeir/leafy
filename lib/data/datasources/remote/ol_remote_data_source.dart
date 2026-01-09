import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/data/models/ol_edition_result.dart';
import 'package:leafy/data/models/open_library/ol_search_result/ol_search_result.dart';
import 'package:leafy/data/models/open_library/ol_work/ol_work.dart';
import 'package:retrofit/retrofit.dart';

part 'ol_remote_data_source.g.dart';

@lazySingleton
@RestApi(baseUrl: "https://openlibrary.org")
abstract class OlRemoteDataSource {
  @factoryMethod
  factory OlRemoteDataSource(Dio dio) = _OlRemoteDataSource;

  @GET("/search.json")
  Future<OLSearchResultModel> getResults({
    @Query("q") String? query,
    @Query("author") String? author,
    @Query("title") String? title,
    @Query("isbn") String? isbn,
    @Query("olid") String? olid,
    @Query("limit") required int limit,
    @Query("offset") required int offset,
    @Query("mode") String mode = 'everything',
    @Query("fields")
    String fields =
        'key,title,subtitle,author_key,author_name,editions,number_of_pages_median,first_publish_year,isbn,edition_key,cover_edition_key,cover_i',
  });

  @GET("/{workId}.json")
  Future<OLWork> getWork(@Path("workId") String workId);

  @GET("/works/{editionId}.json")
  Future<OLEditionResult> getEdition(@Path("editionId") String edtionId);
}
