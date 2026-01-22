import 'dart:convert';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/app_config.dart';
import 'package:leafy/core/constants/enums/translation_language.dart';
import 'package:leafy/data/datasources/remote/gemini_prompts.dart';
import 'package:leafy/domain/translation/entities/translation_update.dart';
import 'package:leafy/data/datasources/remote/translation_remote_datasource.dart';
import 'package:leafy/data/models/translation/translate_and_summarize_response.dart';
import 'package:logger/logger.dart';

@Named('gemini')
@Injectable(as: TranslationRemoteDataSource)
class GeminiRemoteDataSource implements TranslationRemoteDataSource {
  final AppConfig _appConfig;
  final Logger _logger;

  GeminiRemoteDataSource(this._appConfig, this._logger);

  final String _defaultModel = 'gemini-2.5-flash-lite';

  Future<GoogleAIClient> _getClient() async {
    final apiKey = await _appConfig.getGeminiApiKey();
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('GEMINI_API_KEY_MISSING');
    }
    return GoogleAIClient(
      config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey)),
    );
  }

  @override
  Future<Map<String, String>> translateChapter({
    required List<String> originalParagraphs,
    required String context,
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  }) async {
    try {
      _logger.i(
        'Gemini: Starting translation for ${originalParagraphs.length} paragraphs to $targetLang',
      );
      final client = await _getClient();

      final prompt = GeminiPrompts.translateChapter(
        targetLang: targetLang,
        bookTitle: bookTitle,
        author: author,
        bookSummary: bookSummary,
        chapterContext: context,
        paragraphs: originalParagraphs,
      );

      final model = await _appConfig.getSelectedModel() ?? _defaultModel;

      _logger.d('Gemini Prompt: $prompt, Model: $model');

      final response = await client.models.generateContent(
        model: model,
        request: GenerateContentRequest(
          contents: [Content.text(prompt)],
          generationConfig: const GenerationConfig(
            responseMimeType: 'application/json',
          ),
        ),
      );

      final text = _cleanResponse(response.text ?? '');

      if (text.isEmpty) {
        throw Exception('Empty response from Gemini');
      }

      _logger.i('Gemini: Translation successful');
      _logger.d('Gemini Response (cleaned): $text');

      final Map<String, dynamic> rawMap = jsonDecode(text);
      return rawMap.map((key, value) => MapEntry(key, value.toString()));
    } catch (e, stackTrace) {
      _logger.e('Gemini: Translation failed', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<String> summarizeContent({required String content}) async {
    try {
      _logger.i('Gemini: Starting content summarization');
      final client = await _getClient();

      final prompt = GeminiPrompts.summarizeContent(content);

      final model = await _appConfig.getSelectedModel() ?? _defaultModel;

      _logger.d('Gemini Prompt: $prompt, Model: $model');

      final response = await client.models.generateContent(
        model: model,
        request: GenerateContentRequest(contents: [Content.text(prompt)]),
      );

      final text = _cleanResponse(response.text ?? '');

      _logger.i('Gemini: Summarization successful');
      _logger.d('Gemini Summary: $text');

      return text;
    } catch (e, stackTrace) {
      _logger.e(
        'Gemini: Summarization failed',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<TranslateAndSummarizeResponse> translateAndSummarizeChapter({
    required List<String> originalParagraphs,
    required String context,
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  }) async {
    try {
      _logger.i(
        'Gemini: Starting translation and summarization for ${originalParagraphs.length} paragraphs to $targetLang',
      );
      final client = await _getClient();

      final prompt = GeminiPrompts.translateAndSummarizeChapter(
        targetLang: targetLang,
        bookTitle: bookTitle,
        author: author,
        bookSummary: bookSummary,
        chapterContext: context,
        paragraphs: originalParagraphs,
      );

      final model = await _appConfig.getSelectedModel() ?? _defaultModel;

      _logger.d('Gemini Prompt: $prompt, Model: $model');

      final response = await client.models.generateContent(
        model: model,
        request: GenerateContentRequest(
          contents: [Content.text(prompt)],
          generationConfig: const GenerationConfig(
            responseMimeType: 'application/json',
          ),
        ),
      );

      final text = _cleanResponse(response.text ?? '');

      if (text.isEmpty) {
        throw Exception('Empty response from Gemini');
      }

      _logger.i('Gemini: Translation and summarization successful');
      _logger.d('Gemini Response (cleaned): $text');

      final Map<String, dynamic> rawMap = jsonDecode(text);
      return TranslateAndSummarizeResponse.fromJson(rawMap);
    } catch (e, stackTrace) {
      _logger.e(
        'Gemini: Translation and summarization failed',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Stream<TranslationUpdate> streamTranslateChapter({
    required List<String> originalParagraphs,
    required String context,
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  }) async* {
    try {
      _logger.i(
        'Gemini: Streaming translation for ${originalParagraphs.length} paragraphs to $targetLang',
      );

      final client = await _getClient();
      final prompt = GeminiPrompts.streamTranslateChapter(
        targetLang: targetLang,
        bookTitle: bookTitle,
        author: author,
        bookSummary: bookSummary,
        chapterContext: context,
        paragraphs: originalParagraphs,
      );

      final model = await _appConfig.getSelectedModel() ?? _defaultModel;

      _logger.d('Gemini Stream Prompt: $prompt, Model: $model');

      final contentStream = client.models.streamGenerateContent(
        model: model,
        request: GenerateContentRequest(
          contents: [Content.text(prompt)],
          generationConfig: const GenerationConfig(
            responseMimeType: 'text/plain',
          ),
        ),
      );

      StringBuffer buffer = StringBuffer();

      await for (final chunk in contentStream) {
        final text = chunk.text;
        if (text == null || text.isEmpty) continue;

        _logger.d('Gemini Stream Chunk received: ${text.length} chars');

        buffer.write(text);

        // Process buffer for complete lines
        String currentBuffer = buffer.toString();
        // Check for newlines
        if (currentBuffer.contains('\n')) {
          final lines = currentBuffer.split('\n');
          // The last part might be incomplete, keep it in buffer
          final incompletePart = lines.last;

          // Process all complete lines
          for (int i = 0; i < lines.length - 1; i++) {
            final line = lines[i].trim();
            if (line.isNotEmpty) {
              final update = _parseJsonLine(line);
              if (update != null) {
                if (update is TranslationUpdateData) {
                  _logger.d('Gemini Stream Parsed ID: ${update.id}');
                } else if (update is TranslationUpdateSummary) {
                  _logger.d('Gemini Stream Parsed Summary');
                }
                yield update;
              }
            }
          }

          // Reset buffer to the incomplete part
          buffer.clear();
          buffer.write(incompletePart);
        }
      }

      // Process remaining buffer
      final remaining = buffer.toString().trim();
      if (remaining.isNotEmpty) {
        final lines = remaining.split('\n');
        for (final line in lines) {
          final trimmed = line.trim();
          if (trimmed.isNotEmpty) {
            final update = _parseJsonLine(trimmed);
            if (update != null) yield update;
          }
        }
      }

      _logger.i('Gemini: Streaming translation finished');
    } catch (e, stackTrace) {
      _logger.e(
        'Gemini: Streaming translation failed',
        error: e,
        stackTrace: stackTrace,
      );
      yield* Stream.error(e, stackTrace);
    }
  }

  TranslationUpdate? _parseJsonLine(String line) {
    if (line.isEmpty) return null;
    try {
      if (line.startsWith('```')) return null;

      final json = jsonDecode(line);
      if (json is Map<String, dynamic>) {
        // Check for "type" field
        final type = json['type'];

        if (type == 'summary') {
          final content = json['content'];
          if (content != null) {
            return TranslationUpdateSummary(summary: content.toString());
          }
        } else if (type == 'translation') {
          final id = json['id'];
          final text = json['text'];
          if (id != null && text != null) {
            return TranslationUpdateData(
              id: id.toString(),
              text: text.toString(),
            );
          }
        } else {
          // Fallback for legacy or untyped
          final id = json['id'];
          final text = json['text'];
          if (id != null && text != null) {
            return TranslationUpdateData(
              id: id.toString(),
              text: text.toString(),
            );
          }
        }
      }
    } catch (e) {
      // Ignore parse error
      _logger.e('Gemini: Failed to parse line', error: e);
    }
    return null;
  }

  String _cleanResponse(String rawResponse) {
    String result = rawResponse.trim();
    final RegExp jsonRegex = RegExp(r'\{[\s\S]*\}', multiLine: true);

    final match = jsonRegex.stringMatch(result);

    if (match != null) {
      return match.trim();
    }

    if (result.startsWith("```json")) {
      result = result.replaceFirst("```json", "");
    }
    if (result.endsWith("```")) {
      result = result.substring(0, result.length - 3);
    }

    return result.trim();
  }
}
