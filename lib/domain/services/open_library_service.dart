import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/ol_author_result.dart';
import 'package:leafy/data/models/ol_edition_result.dart';
import 'package:leafy/data/models/ol_search_result.dart';
import 'package:leafy/data/models/ol_work_result.dart';
import 'package:logger/logger.dart';

@lazySingleton
class OpenLibraryService {
  static const baseUrl = 'https://openlibrary.org';
  static const coversBaseUrl = 'https://covers.openlibrary.org';

  final Dio _dio;
  final Logger _logger;

  OpenLibraryService(this._dio, this._logger);

  Future<OLSearchResult> getResults({
    required String query,
    required int offset,
    required int limit,
    required OLSearchType searchType,
  }) async {
    final searchTypeParam = switch (searchType) {
      OLSearchType.general => 'q',
      OLSearchType.author => 'author',
      OLSearchType.title => 'title',
      OLSearchType.isbn => 'isbn',
      OLSearchType.openlibraryId => 'olid',
    };

    final queryParams = {
      searchTypeParam: query,
      'limit': limit,
      'offset': offset,
      'mode': 'everything',
      'fields':
          'key,title,subtitle,author_key,author_name,editions,number_of_pages_median,first_publish_year,isbn,edition_key,cover_edition_key,cover_i',
    };

    final uri = '$baseUrl/search.json';
    _logger.d('Fetching results from: $uri with params: $queryParams');

    try {
      final response = await _dio.get(uri, queryParameters: queryParams);
      return OLSearchResult.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e, st) {
      _logger.e(
        'DioError fetching results: ${e.message}',
        error: e,
        stackTrace: st,
      );
      rethrow;
    } catch (e, st) {
      _logger.e('Error fetching results: $e', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<OLEditionResult> getEdition(String edition) async {
    final uri = '$baseUrl/works/$edition.json';
    _logger.d('Fetching edition from: $uri');

    try {
      final response = await _dio.get(uri);
      return OLEditionResult.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e, st) {
      _logger.e(
        'DioError fetching edition: ${e.message}',
        error: e,
        stackTrace: st,
      );
      rethrow;
    } catch (e, st) {
      _logger.e('Error fetching edition: $e', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<OLWorkResult> getWork(String work) async {
    final uri = '$baseUrl/$work.json';
    _logger.d('Fetching work from: $uri');

    try {
      final response = await _dio.get(uri);
      return OLWorkResult.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e, st) {
      _logger.e(
        'DioError fetching work: ${e.message}',
        error: e,
        stackTrace: st,
      );
      rethrow;
    } catch (e, st) {
      _logger.e('Error fetching work: $e', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<Uint8List?> getCover(String isbn) async {
    final uri = '$coversBaseUrl/b/isbn/$isbn-L.jpg';
    _logger.d('Fetching cover from: $uri');

    try {
      final response = await _dio.get(
        uri,
        options: Options(responseType: ResponseType.bytes),
      );

      final bytes = Uint8List.fromList(response.data as List<int>);

      // If the response is less than 500 bytes, probably the cover is not available
      if (bytes.length < 500) {
        _logger.w('Cover not available for ISBN $isbn (response too small)');
        return null;
      }

      return bytes;
    } catch (e, st) {
      // Log warning instead of error since cover missing is common
      _logger.w('Error fetching cover for ISBN $isbn: $e', stackTrace: st);
      return null;
    }
  }

  Future<OLEditionResult?> getEditionByISBN({required String isbn}) async {
    final uri = '$baseUrl/isbn/$isbn.json';
    _logger.d('Fetching edition by ISBN from: $uri');

    try {
      final response = await _dio.get(uri);
      return OLEditionResult.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // Dio throws on non-200 status codes by default
      _logger.w(
        'Failed to fetch edition for ISBN $isbn. Status: ${e.response?.statusCode}',
      );
      return null;
    } catch (e, st) {
      _logger.e('Error fetching edition by ISBN: $e', error: e, stackTrace: st);
      return null;
    }
  }

  Future<OLAuthorResult?> getAuthor({required String key}) async {
    final uri = '$baseUrl$key.json';
    _logger.d('Fetching author from: $uri');

    try {
      final response = await _dio.get(uri);
      return OLAuthorResult.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _logger.w(
        'Failed to fetch author for key $key. Status: ${e.response?.statusCode}',
      );
      return null;
    } catch (e, st) {
      _logger.e('Error fetching author: $e', error: e, stackTrace: st);
      return null;
    }
  }
}
