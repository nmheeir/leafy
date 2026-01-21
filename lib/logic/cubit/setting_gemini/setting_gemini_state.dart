part of 'setting_gemini_cubit.dart';

@freezed
abstract class SettingGeminiState with _$SettingGeminiState {
  const factory SettingGeminiState({
    @Default(false) bool isLoading,
    String? error,
    String? apiKey,
    @Default([]) List<String> availableModels,
    String? selectedModel,
  }) = _SettingGeminiState;

  factory SettingGeminiState.fromJson(Map<String, dynamic> json) =>
      _$SettingGeminiStateFromJson(json);
}
