import 'package:googleai_dart/googleai_dart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GeminiService {
  Future<List<String>> getAvailableModels(String apiKey) async {
    final client = GoogleAIClient(
      config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey)),
    );

    final response = await client.models.list();
    // Filter for models that support generating content (mostly 'generateContent')
    // and prefer 'gemini' models.
    final models = response.models
        .where(
          (m) =>
              m.name.contains('gemini') &&
              (m.supportedGenerationMethods?.contains('generateContent') ??
                  false),
        )
        .map((m) => m.name.replaceAll('models/', ''))
        .toList();

    return models;
  }
}
