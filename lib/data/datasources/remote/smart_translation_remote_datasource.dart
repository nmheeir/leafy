import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/app_config.dart';
import 'package:leafy/core/constants/enums/translation_language.dart';
import 'package:leafy/data/datasources/remote/translation_remote_datasource.dart';
import 'package:leafy/data/models/translation/translate_and_summarize_response.dart';
import 'package:leafy/domain/models/ai_provider.dart';
import 'package:leafy/domain/translation/entities/translation_update.dart';

@LazySingleton(as: TranslationRemoteDataSource)
class SmartTranslationRemoteDataSource implements TranslationRemoteDataSource {
  final AppConfig _appConfig;
  final TranslationRemoteDataSource _geminiDataSource;
  // TODO: Add other data sources here
  // final TranslationRemoteDataSource _openAIDataSource;
  // final TranslationRemoteDataSource _claudeDataSource;

  SmartTranslationRemoteDataSource(
    this._appConfig,
    @Named('gemini') this._geminiDataSource,
  );

  Future<TranslationRemoteDataSource> _getDataSource() async {
    final providerStr = await _appConfig.getSelectedProvider();
    final provider = AIProvider.fromString(providerStr ?? 'gemini');

    switch (provider) {
      case AIProvider.gemini:
        return _geminiDataSource;
      case AIProvider.openAI:
        // return _openAIDataSource;
        throw UnimplementedError('OpenAI provider not yet implemented');
      case AIProvider.claude:
        // return _claudeDataSource;
        throw UnimplementedError('Claude provider not yet implemented');
    }
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
    final dataSource = await _getDataSource();
    return dataSource.translateChapter(
      originalParagraphs: originalParagraphs,
      context: context,
      targetLang: targetLang,
      bookTitle: bookTitle,
      author: author,
      bookSummary: bookSummary,
    );
  }

  @override
  Future<String> summarizeContent({required String content}) async {
    final dataSource = await _getDataSource();
    return dataSource.summarizeContent(content: content);
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
    final dataSource = await _getDataSource();
    return dataSource.translateAndSummarizeChapter(
      originalParagraphs: originalParagraphs,
      context: context,
      targetLang: targetLang,
      bookTitle: bookTitle,
      author: author,
      bookSummary: bookSummary,
    );
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
    final dataSource = await _getDataSource();
    yield* dataSource.streamTranslateChapter(
      originalParagraphs: originalParagraphs,
      context: context,
      targetLang: targetLang,
      bookTitle: bookTitle,
      author: author,
      bookSummary: bookSummary,
    );
  }
}
