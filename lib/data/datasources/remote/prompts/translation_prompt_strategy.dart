import 'package:leafy/core/constants/enums/translation_language.dart';

abstract interface class TranslationPromptStrategy {
  String translateChapter({
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  });

  String summarizeContent(String content);

  String translateAndSummarizeChapter({
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  });

  String streamTranslateChapter({
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  });
}
