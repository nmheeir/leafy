import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/data/models/gutendex/gtd_book_result/gtd_book_result_model.dart';
import 'package:leafy/data/models/gutendex/gtd_books_result/gtd_books_result_model.dart';
import 'package:retrofit/retrofit.dart';

part 'gutendex_remote_datasource.g.dart';

@lazySingleton
@RestApi(baseUrl: "https://gutendex.com")
abstract class GutendexRemoteDataSource {
  @factoryMethod
  factory GutendexRemoteDataSource(Dio dio) = _GutendexRemoteDataSource;

  @GET("/books")
  Future<GtdBooksResultModel> getBooks({
    @Query("page") int? page,
    @Query("author_year_start") int? authorYearStart,
    @Query("author_year_end") int? authorYearEnd,

    /// Gutendex yêu cầu format: "true,false,null"
    /// Xử lý logic .join(',') tại Repository trước khi truyền vào đây
    @Query("copyright") String? copyright,

    /// Gutendex yêu cầu format: "1,2,3"
    /// Xử lý logic ids.join(',') tại Repository
    @Query("ids") String? ids,

    /// Gutendex yêu cầu format: "en,fr"
    /// Xử lý logic languages.map((e) => e.code).join(',') tại Repository
    @Query("languages") String? languages,
    @Query("mime_type") String? mimeType,
    @Query("search") String? search,

    /// Truyền sort.value vào đây
    @Query("sort") String? sort,
    @Query("topic") String? topic,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET("/books/{id}")
  Future<GtdBookResultModel> getBookDetail(@Path("id") int id);
}
