import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_lang.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_sort_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/remote/gutendex_remote_datasource/gutendex_remote_datasource.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';
import 'package:leafy/domain/gutendex/entities/gtd_books.dart';
import 'package:leafy/domain/gutendex/repositories/gutendex_repository.dart';

@LazySingleton(as: GutendexRepository)
class GutendexRepositoryImpl implements GutendexRepository {
  final GutendexRemoteDataSource gutendexRemoteDataSource;

  GutendexRepositoryImpl(this.gutendexRemoteDataSource);

  @override
  Future<Either<Failure, GtdBooks>> getBooks({
    required int? page,
    required int? authorYearStart,
    required int? authorYearEnd,
    required List<bool?>? copyright,
    required List<int>? ids,
    required List<GtdLang>? languages,
    required String? mimeType,
    required String? search,
    required GtdSortType? sort,
    required String? topic,
    required CancelToken? cancelToken,
  }) async {
    try {
      // 1. Xử lý Copyright (List<bool?> -> "true,false,null")
      final copyrightStr = copyright
          ?.map((e) => e?.toString() ?? 'null')
          .join(',');

      // 2. Xử lý IDs (List<int> -> "1,2,3")
      final idsStr = ids?.join(',');

      // 3. Xử lý Languages (List<GtdLang> -> "en,fr,vi")
      // Giả định GtdLang enum có field .code
      final langStr = languages?.map((e) => e.code).join(',');

      // 4. Xử lý Sort (Enum -> String value)
      final sortStr = sort?.value;

      // 5. Gọi Remote Data Source
      final result = await gutendexRemoteDataSource.getBooks(
        page: page,
        authorYearStart: authorYearStart,
        authorYearEnd: authorYearEnd,
        copyright: copyrightStr,
        ids: idsStr,
        languages: langStr,
        mimeType: mimeType,
        search: search,
        sort: sortStr,
        topic: topic,
      );

      // 6. Trả về kết quả thành công (Right)
      return Right(result.toEntity());
    } catch (e) {
      // 7. Trả về lỗi (Left)
      // Bạn có thể check if (e is DioException) để trả về lỗi cụ thể hơn
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GtdBook>> getBook({required int id}) async {
    try {
      final result = await gutendexRemoteDataSource.getBookDetail(id);

      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
