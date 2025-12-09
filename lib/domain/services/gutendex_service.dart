import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leafy/core/constants/enums/gutendex/gtd_lang.dart';
import 'package:leafy/core/constants/enums/gutendex/gtd_sort_type.dart';
import 'package:leafy/data/models/gutendex/gtd_book_result.dart';
import 'package:leafy/data/models/gutendex/gtd_books_result.dart';
import 'package:logger/logger.dart'; // Import for Logger

class GutendexService {
  static const gutendexUrl = 'https://gutendex.com/books';
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // No method calls to be displayed
      errorMethodCount: 5, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
    ),
  );

  Future<GtdBooksResult> getBooks({
    int? page,
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

    // ?page=1
    if (page != null) {
      queryParams['page'] = page.toString();
    }

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
    _logger.d('GutendexService: Fetching books from URI: $uri');

    try {
      final response = await http.get(uri);
      _logger.d('GutendexService: Received response for books with status: ${response.statusCode}');

      if (response.statusCode != 200) {
        _logger.e('GutendexService: Failed to load books. Body: ${response.body}');
        throw Exception('Failed to load books (status: ${response.statusCode})');
      }

      final json = jsonDecode(response.body);
      _logger.d('GutendexService: Successfully decoded JSON for books.');
      return GtdBooksResult.fromJson(json);
    } catch (e, st) {
      _logger.e('GutendexService: Error getting books: $e', error: e, stackTrace: st);
      throw Exception('Failed to get books: $e');
    }
  }

  Future<GtdBookResult> getBookDetail(int id) async {
    final uri = Uri.parse('$gutendexUrl/$id');
    _logger.d('GutendexService: Fetching book detail from URI: $uri');

    try {
      final response = await http.get(uri);
      _logger.d('GutendexService: Received response for book detail with status: ${response.statusCode}');

      if (response.statusCode != 200) {
        try {
          final json = jsonDecode(response.body);
          final detail = json['detail'] ?? 'Unknown error';
          _logger.e('GutendexService: Failed to load book detail ($id). Detail from API: $detail');
          throw Exception('Failed to load book: $detail (status: ${response.statusCode})');
        } catch (e, st) {
          _logger.e('GutendexService: Failed to decode error response for book detail ($id). Body: ${response.body}. Error: $e', error: e, stackTrace: st);
          throw Exception('Failed to load book detail (status: ${response.statusCode})');
        }
      }

      final json = jsonDecode(response.body);
      _logger.d('GutendexService: Successfully decoded JSON for book detail ($id).');
      return GtdBookResult.fromJson(json);
    } catch (e, st) {
      _logger.e('GutendexService: Error getting book detail for ID $id: $e', error: e, stackTrace: st);
      throw Exception('Failed to get book detail for ID $id: $e');
    }
  }
}
