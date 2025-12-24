import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_lang.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_sort_type.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/models/gutendex/gtd_books_result/gtd_books_result.dart';

abstract class GutendexRepository {
  Future<Either<Failure, GtdBooksResult>> getBooks({
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
  });
}
