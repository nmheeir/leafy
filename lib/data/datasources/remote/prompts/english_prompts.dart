import 'dart:convert';
import 'package:leafy/core/constants/enums/translation_language.dart';
import 'package:leafy/data/datasources/remote/prompts/translation_prompt_strategy.dart';

class EnglishPrompts implements TranslationPromptStrategy {
  @override
  String translateChapter({
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  }) {
    final inputData = <Map<String, dynamic>>[];
    for (int i = 0; i < paragraphs.length; i++) {
      inputData.add({'i': i, 't': paragraphs[i]});
    }

    final bookProfile = [
      "Title: $bookTitle",
      if (author != null && author.isNotEmpty) "Author: $author",
      if (bookSummary != null && bookSummary.isNotEmpty)
        "Summary: $bookSummary",
    ].join("\n");

    return '''
You are a professional literary translator.
Translate the following list of paragraphs into: ${targetLang.displayName}.

--- BOOK PROFILE ---
$bookProfile
Context: $chapterContext

--- TRANSLATION INSTRUCTIONS ---
1. Style: Translate in the style of the author ${author ?? 'mentioned above'}. The translation should be smooth, evocative, and preserve the soul of the original work.
2. JSON Rules (MANDATORY):
   - Return ONLY a single JSON object.
   - Format: {"index": "translated content"}.
   - DO NOT include any explanations or Markdown tags (like ```json).
   - Do not repeat words at the end of the result.
   - End the JSON immediately after the last paragraph with a closing brace }.
   - Do not add any text after the closing JSON brace.
3. Accuracy: Keep proper nouns and jargon as is if the context requires. Ensure the translation flow fits the story context.

--- INPUT DATA (JSON) ---
${jsonEncode(inputData)}
''';
  }

  @override
  String summarizeContent(String content) {
    return 'Summarize the following content briefly and concisely (about 3-5 sentences), focusing on key plot points to serve as context for translating subsequent chapters:\n\n$content';
  }

  @override
  String translateAndSummarizeChapter({
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  }) {
    final inputData = <Map<String, dynamic>>[];
    for (int i = 0; i < paragraphs.length; i++) {
      inputData.add({'id': i, 'text': paragraphs[i]});
    }

    final bookProfile = [
      "Title: $bookTitle",
      if (author != null && author.isNotEmpty) "Author: $author",
      if (bookSummary != null && bookSummary.isNotEmpty)
        "General Plot Summary: $bookSummary",
    ].join("\n");

    return '''
You are an outstanding literary translator with a rich vocabulary and a delicate sense of literature.
Your task is to translate the provided list of paragraphs into: "${targetLang.displayName}" and summarize that content.

--- BOOK PROFILE ---
$bookProfile
Chapter Context: $chapterContext

--- TRANSLATION REQUIREMENTS (IMPORTANT) ---
1. **Literary Quality**: 
   - Absolutely avoid dry "word-by-word" translation.
   - Translate freely and expressively, using "expensive" and evocative words.
   - Prioritize smoothness and naturalness in the target language.
2. **Accuracy**: Preserve proper names and locations.

--- OUTPUT REQUIREMENTS (JSON MANDATORY) ---
You must return ONLY a valid JSON object, without any leading text or Markdown (```json). The structure must have "translation" before "summary" as follows:

{
  "translation": {
    "0": "Translated content of paragraph id 0",
    "1": "Translated content of paragraph id 1",
    ... (corresponding to all input ids)
  },
  "summary": "Write a short summary (3-5 sentences) of the main events in the translated section. This summary will be used as context for the next translation."
}

--- INPUT DATA ---
${jsonEncode(inputData)}
''';
  }

  @override
  String streamTranslateChapter({
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  }) {
    final inputData = <Map<String, dynamic>>[];
    for (int i = 0; i < paragraphs.length; i++) {
      inputData.add({'id': i, 'text': paragraphs[i]});
    }

    final bookProfile = [
      "Title: $bookTitle",
      if (author != null && author.isNotEmpty) "Author: $author",
      if (bookSummary != null && bookSummary.isNotEmpty)
        "General Plot Summary: $bookSummary",
    ].join("\n");

    return '''
You are an outstanding literary translator with a rich vocabulary and a delicate sense of literature.
Your task is to translate the provided list of paragraphs into: "${targetLang.displayName}".

--- BOOK PROFILE ---
$bookProfile
Chapter Context: $chapterContext

--- REQUIREMENTS ---
1. Translate literarily, freely, and emotionally.
2. Return in JSON Lines format (each line is a valid JSON object).
3. DO NOT wrap in markdown block (```json). Just pure JSON lines.

--- TRANSLATION REQUIREMENTS (IMPORTANT) ---
1. **Literary Quality**: 
   - Absolutely avoid dry "word-by-word" translation.
   - Translate freely and expressively.
   - Prioritize smoothness and naturalness in the target language.
2. **Accuracy**: Preserve proper names and locations.

Structure per line (MANDATORY newline after each object):
- Translation: {"type": "translation", "id": "index", "text": "translated content"}
- Summary (at the very end): {"type": "summary", "content": "summary of content 3-5 sentences"}

--- INPUT DATA ---
${jsonEncode(inputData)}
''';
  }
}
