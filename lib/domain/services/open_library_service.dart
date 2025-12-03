import 'dart:developer' as developer;

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/ol_author_result.dart';
import 'package:leafy/data/models/ol_edition_result.dart';
import 'package:leafy/data/models/ol_search_result.dart';
import 'package:leafy/data/models/ol_work_result.dart';

class OpenLibraryService {
  static const baseUrl = 'https://openlibrary.org';
  static const coversBaseUrl = 'https://covers.openlibrary.org';

  Future<OLSearchResult> getResults({
    required String query,
    required int offset,
    required int limit,
    required OLSearchType searchType,
  }) async {
    final searchTypeParam = searchType == OLSearchType.general
        ? 'q'
        : searchType == OLSearchType.author
        ? 'author'
        : searchType == OLSearchType.title
        ? 'title'
        : searchType == OLSearchType.isbn
        ? 'isbn'
        : 'q';
    const modeParam = '&mode=everything';
    const fieldsParam =
        '&fields=key,title,subtitle,author_key,author_name,editions,number_of_pages_median,first_publish_year,isbn,edition_key,cover_edition_key,cover_i';
    final offsetParam = '&offset=$offset';
    final limitParam = '&limit=$limit';

    final uri = Uri.parse(
      '$baseUrl/search.json?$searchTypeParam=$query$limitParam$offsetParam$modeParam$fieldsParam',
    );

    developer.log('Fetching results from: $uri');
    final response = await get(uri);
    return openLibrarySearchResultFromJson(response.body);
  }

  Future<OLEditionResult> getEdition(String edition) async {
    final uri = Uri.parse('$baseUrl/works/$edition.json');
    developer.log('Fetching edition from: $uri');
    final response = await get(uri);
    return openLibraryEditionResultFromJson(response.body);
  }

  Future<OLWorkResult> getWork(String work) async {
    final uri = Uri.parse('$baseUrl/$work.json');
    developer.log('Fetching work from: $uri');
    final response = await get(uri);
    return openLibraryWorkResultFromJson(response.body);
  }

  Future<Uint8List?> getCover(String isbn) async {
    try {
      final uri = Uri.parse('$coversBaseUrl/b/isbn/$isbn-L.jpg');
      developer.log('Fetching cover from: $uri');
      final response = await get(uri);

      // If the response is less than 500 bytes,
      // probably the cover is not available
      if (response.bodyBytes.length < 500) {
        developer.log('Cover not available for ISBN $isbn (response too small)');
        return null;
      }

      return response.bodyBytes;
    } catch (e, s) {
      developer.log('Error fetching cover for ISBN $isbn: $e', stackTrace: s);
      return null;
    }
  }

  Future<OLEditionResult?> getEditionByISBN({required String isbn}) async {
    final uri = Uri.parse('$baseUrl/isbn/$isbn.json');
    developer.log('Fetching edition by ISBN from: $uri');

    final response = await get(uri);

    if (response.statusCode == 200) {
      return openLibraryEditionResultFromJson(response.body);
    } else {
      developer.log(
          'Failed to fetch edition for ISBN $isbn. Status code: ${response.statusCode}');
      return null;
    }
  }

  Future<OLAuthorResult?> getAuthor({required String key}) async {
    final uri = Uri.parse('$baseUrl$key.json');
    developer.log('Fetching author from: $uri');

    final response = await get(uri);

    if (response.statusCode == 200) {
      return openLibraryAuthorResultFromJson(response.body);
    } else {
      developer.log(
          'Failed to fetch author for key $key. Status code: ${response.statusCode}');
      return null;
    }
  }
}
