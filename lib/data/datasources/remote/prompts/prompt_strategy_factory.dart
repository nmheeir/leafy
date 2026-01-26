import 'package:leafy/core/constants/enums/translation_language.dart';
import 'package:leafy/data/datasources/remote/prompts/default_prompts.dart';
import 'package:leafy/data/datasources/remote/prompts/english_prompts.dart';
import 'package:leafy/data/datasources/remote/prompts/japanese_prompts.dart';
import 'package:leafy/data/datasources/remote/prompts/translation_prompt_strategy.dart';
import 'package:leafy/data/datasources/remote/prompts/vietnamese_prompts.dart';

class PromptStrategyFactory {
  static TranslationPromptStrategy getStrategy(TranslationLanguage language) {
    switch (language) {
      case TranslationLanguage.vietnamese:
        return VietnamesePrompts();
      case TranslationLanguage.japanese:
        return JapanesePrompts();
      case TranslationLanguage.unitedStates:
        return EnglishPrompts();
      default:
        // Use default prompts for other languages or English if appropriate
        return DefaultPrompts();
    }
  }
}
