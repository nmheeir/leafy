import 'package:injectable/injectable.dart';

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
  // TODO: Add Dio or Gemini client injection here
  // final Dio _dio;

  GeminiTranslationDataSource();

  @override
  Future<Map<String, String>> translateChapter({
    required List<String> originalParagraphs,
    required String context,
    required String targetLang,
  }) async {
    // TODO: Implement actual API call to Gemini/OpenAI
    // Steps:
    // 1. Construct prompt with System Instruction (Role, Context, JSON requirement)
    // 2. Format input as Indexed List: [{"i": 0, "t": "..."}]
    // 3. Call API
    // 4. Parse JSON output to Map<String, String>

    // Mock implementation for now to unblock Repository
    await Future.delayed(const Duration(seconds: 2));
    final mockResult = <String, String>{};
    for (int i = 0; i < originalParagraphs.length; i++) {
      mockResult[i.toString()] = '[Dịch] ${originalParagraphs[i]}';
    }
    return mockResult;
  }

  @override
  Future<String> summarizeContent({required String content}) async {
    // TODO: Implement actual API call
    await Future.delayed(const Duration(seconds: 1));
    return 'Bản tóm tắt nội dung...';
  }
}
