import 'package:leafy/core/constants/enums/gutendex/gtd_lang.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_sort_type.dart';

class GtdGetBooksParams {
  final int? page;
  final int? authorYearStart;
  final int? authorYearEnd;
  final List<bool?>? copyright;
  final List<int>? ids;
  final List<GtdLang>? languages;
  final String? mimeType;
  final String? search;
  final GtdSortType? sort;
  final String? topic;
  const GtdGetBooksParams({
    this.page,
    this.authorYearStart,
    this.authorYearEnd,
    this.copyright,
    this.ids,
    this.languages,
    this.mimeType,
    this.search,
    this.sort,
    this.topic,
  });
}
