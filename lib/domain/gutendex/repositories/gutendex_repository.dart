import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_lang.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_sort_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book/usecases/results/donwload_cover_result.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';
import 'package:leafy/domain/gutendex/entities/gtd_books.dart';

abstract class GutendexRepository {
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
  });

  Future<Either<Failure, GtdBook>> getBook({required int id});

  Future<Either<Failure, DownloadCoverResult>> downloadCover({
    required String gtdCoverUrl,
  });
}
