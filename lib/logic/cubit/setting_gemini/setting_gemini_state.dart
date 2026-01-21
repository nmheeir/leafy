part of 'setting_gemini_cubit.dart';

class SettingGeminiState extends Equatable {
  final bool isLoading;
  final String? error;
  final String? apiKey;
  final List<String> availableModels;
  final String? selectedModel;

  const SettingGeminiState({
    this.isLoading = false,
    this.error,
    this.apiKey,
    this.availableModels = const [],
    this.selectedModel,
  });

  SettingGeminiState copyWith({
    bool? isLoading,
    String? error,
    String? apiKey,
    List<String>? availableModels,
    String? selectedModel,
  }) {
    return SettingGeminiState(
      isLoading: isLoading ?? this.isLoading,
      error:
          error, // Clear error on new state unless explicitly set? Or keep? Usually clear if not provided.
      // Actually standard copyWith keeps previous value if null.
      // To allow clearing, we might need a specific sentinal or just explicit logic in Cubit.
      // Here I will follow standard copyWith pattern.
      apiKey: apiKey ?? this.apiKey,
      availableModels: availableModels ?? this.availableModels,
      selectedModel: selectedModel ?? this.selectedModel,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    error,
    apiKey,
    availableModels,
    selectedModel,
  ];
}
