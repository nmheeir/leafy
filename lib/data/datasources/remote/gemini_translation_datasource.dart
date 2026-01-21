import 'dart:convert';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/app_config.dart';
import 'package:leafy/data/datasources/remote/gemini_prompts.dart';
import 'package:leafy/data/datasources/remote/translation_remote_datasource.dart';
import 'package:logger/logger.dart';

@Named('gemini')
@Injectable(as: TranslationRemoteDataSource)
class GeminiRemoteDataSource implements TranslationRemoteDataSource {
  final AppConfig _appConfig;
  final Logger _logger;

  GeminiRemoteDataSource(this._appConfig, this._logger);

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

      final model =
          await _appConfig.getSelectedModel() ?? 'gemini-3-flash-preview';

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

      final model =
          await _appConfig.getSelectedModel() ?? 'gemini-3-flash-preview';

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

  String _cleanResponse(String rawResponse) {
    String result = rawResponse.trim();
    final RegExp jsonRegex = RegExp(r'\{[\s\S]*\}', multiLine: true);

    final match = jsonRegex.stringMatch(result);

    if (match != null) {
      return match.trim();
    }

    // 3. Dự phòng: Nếu không tìm thấy cặp {}, thử xóa Markdown theo cách cũ
    if (result.startsWith("```json")) {
      result = result.replaceFirst("```json", "");
    }
    if (result.endsWith("```")) {
      result = result.substring(0, result.length - 3);
    }

    return result.trim();
  }
}
