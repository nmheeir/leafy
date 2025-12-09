import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leafy/core/constants/enums/gutendex/gtd_lang.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_sort_type.dart';
import 'package:leafy/data/models/gutendex/gtd_book_result.dart';
import 'package:leafy/data/models/gutendex/gtd_books_result.dart';

class GutendexService {
  static const gutendexUrl = 'https://gutendex.com/books';

  Future<GtdBooksResult> getBooks({
    int? authorYearStart,
    int? authorYearEnd,
    List<bool?>? copyright,
    List<int>? ids,
    List<GtdLang>? languages,
    String? mimeType,
    String? search,
    GtdSortType? sort,
    String? topic,
  }) async {
    final queryParams = <String, String>{};

    // author_year_start / author_year_end
    if (authorYearStart != null) {
      queryParams['author_year_start'] = authorYearStart.toString();
    }
    if (authorYearEnd != null) {
      queryParams['author_year_end'] = authorYearEnd.toString();
    }

    // copyright=true,false,null  (comma-separated)
    if (copyright != null && copyright.isNotEmpty) {
      final values = copyright.map((e) => e?.toString() ?? 'null').join(',');
      queryParams['copyright'] = values;
    }

    // ids=1,2,3
    if (ids != null && ids.isNotEmpty) {
      queryParams['ids'] = ids.join(',');
    }

    // languages=en,fr
    if (languages != null && languages.isNotEmpty) {
      queryParams['languages'] = languages.map((e) => e.code).join(',');
    }

    // mime_type=text/html  (URL encoded tự động bởi Uri)
    if (mimeType != null && mimeType.isNotEmpty) {
      queryParams['mime_type'] = mimeType;
    }

    // search=some words
    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }

    // sort=ascending | descending | popular
    if (sort != null) {
      queryParams['sort'] = sort.value;
    }

    // topic=children
    if (topic != null && topic.isNotEmpty) {
      queryParams['topic'] = topic;
    }

    final uri = Uri.parse(gutendexUrl).replace(queryParameters: queryParams);

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load books');
    }

    final json = jsonDecode(response.body);
    return GtdBooksResult.fromJson(json);
  }

  Future<GtdBookResult> getBookDetail(int id) async {
    final uri = Uri.parse('$gutendexUrl/$id');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      try {
        final json = jsonDecode(response.body);
        final detail = json['detail'] ?? 'Unknown error';
        throw Exception('Failed to load book: $detail');
      } catch (_) {
        throw Exception('Failed to load book detail');
      }
    }

    final json = jsonDecode(response.body);
    return GtdBookResult.fromJson(json);
  }
}
