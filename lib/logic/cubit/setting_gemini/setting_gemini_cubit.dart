import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/app_config.dart';
import 'package:leafy/domain/services/gemini_service.dart';

part 'setting_gemini_state.dart';

@injectable
class SettingGeminiCubit extends HydratedCubit<SettingGeminiState> {
  final AppConfig _appConfig;
  final GeminiService _geminiService;

  SettingGeminiCubit(this._appConfig, this._geminiService)
    : super(const SettingGeminiState()) {
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final apiKey = await _appConfig.getGeminiApiKey();
    final selectedModel = await _appConfig.getSelectedModel();
    if (apiKey != null && apiKey.isNotEmpty) {
      emit(state.copyWith(apiKey: apiKey, selectedModel: selectedModel));
      // Optionally verify/load models if we have a key
      await loadModels(apiKey);
    }
  }

  Future<void> setApiKey(String apiKey) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await _appConfig.saveGeminiApiKey(apiKey);
      emit(state.copyWith(apiKey: apiKey));
      await loadModels(apiKey);
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadModels(String apiKey) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final models = await _geminiService.getAvailableModels(apiKey);
      emit(state.copyWith(isLoading: false, availableModels: models));
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: 'Failed to load models: $e'),
      );
    }
  }

  Future<void> selectModel(String model) async {
    await _appConfig.saveSelectedModel(model);
    emit(state.copyWith(selectedModel: model));
  }

  @override
  SettingGeminiState? fromJson(Map<String, dynamic> json) {
    return SettingGeminiState(
      availableModels: List<String>.from(json['availableModels'] ?? []),
      selectedModel: json['selectedModel'],
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingGeminiState state) {
    return {
      'availableModels': state.availableModels,
      'selectedModel': state.selectedModel,
    };
  }
}
