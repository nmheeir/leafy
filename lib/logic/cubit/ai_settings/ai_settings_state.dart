part of 'ai_settings_cubit.dart';

@freezed
abstract class AISettingsState with _$AISettingsState {
  const factory AISettingsState({
    @Default(false) bool isLoading,
    String? error,
    String? apiKey,
    @Default([]) List<String> availableModels,
    String? selectedModel,
    @Default(AIProvider.gemini) AIProvider selectedProvider,
  }) = _AISettingsState;

  factory AISettingsState.fromJson(Map<String, dynamic> json) =>
      _$AISettingsStateFromJson(json);
}
