import 'package:leafy/data/models/translation/translate_and_summarize_response.dart';

abstract class TranslationRemoteDataSource {
  /// Translates a list of paragraphs.
  /// Returns a Map where key is the index string "0", "1", etc. and value is the translated text.
  Future<Map<String, String>> translateChapter({
    required List<String> originalParagraphs,
    required String context,
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  });

  /// Summarizes a chapter or a range of chapters.
  Future<String> summarizeContent({required String content});

  /// Translates and summarizes a chapter in one go.
  Future<TranslateAndSummarizeResponse> translateAndSummarizeChapter({
    required List<String> originalParagraphs,
    required String context,
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  });
}
