import 'dart:convert';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/app_config.dart';
import 'package:leafy/data/datasources/remote/gemini_prompts.dart';
import 'package:logger/logger.dart';

abstract class TranslationRemoteDataSource {
  /// Translates a list of paragraphs.
  /// Returns a Map where key is the index string "0", "1", etc. and value is the translated text.
  Future<Map<String, String>> translateChapter({
    required List<String> originalParagraphs,
    required String context,
    required String targetLang,
  });

  /// Summarizes a chapter or a range of chapters.
  Future<String> summarizeContent({required String content});
}

@LazySingleton(as: TranslationRemoteDataSource)
class GeminiTranslationDataSource implements TranslationRemoteDataSource {
  final AppConfig _appConfig;
  final Logger _logger;

  GeminiTranslationDataSource(this._appConfig, this._logger);

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
    required String targetLang,
  }) async {
    try {
      _logger.i(
        'Gemini: Starting translation for ${originalParagraphs.length} paragraphs to $targetLang',
      );
      final client = await _getClient();

      final prompt = GeminiPrompts.translateChapter(
        targetLang: targetLang,
        context: context,
        paragraphs: originalParagraphs,
      );

      _logger.d('Gemini Prompt: $prompt');

      final response = await client.models.generateContent(
        model: 'gemini-3-flash-preview',
        request: GenerateContentRequest(
          contents: [Content.text(prompt)],
          generationConfig: const GenerationConfig(
            responseMimeType: 'application/json',
          ),
        ),
      );

      final text = response.text;

      if (text == null) {
        throw Exception('Empty response from Gemini');
      }

      _logger.i('Gemini: Translation successful');
      _logger.d('Gemini Response: $text');

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

      final response = await client.models.generateContent(
        model: 'gemini-3-flash-preview',
        request: GenerateContentRequest(contents: [Content.text(prompt)]),
      );

      final result = response.text ?? '';
      _logger.i('Gemini: Summarization successful');
      _logger.d('Gemini Summary: $result');

      return result;
    } catch (e, stackTrace) {
      _logger.e(
        'Gemini: Summarization failed',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
