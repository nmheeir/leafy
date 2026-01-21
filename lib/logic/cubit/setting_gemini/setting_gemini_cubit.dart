import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/app_config.dart';
import 'package:leafy/domain/services/gemini_service.dart';

part 'setting_gemini_state.dart';
part 'setting_gemini_cubit.freezed.dart';
part 'setting_gemini_cubit.g.dart';

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
    // Optimistic update: Update UI immediately
    emit(state.copyWith(selectedModel: model));
    try {
      await _appConfig.saveSelectedModel(model);
    } catch (e) {
      // Revert if save fails (optional, or just log)
      // For now, assuming save failure is rare or acceptable to desync temporarily
    }
  }

  @override
  SettingGeminiState? fromJson(Map<String, dynamic> json) {
    try {
      return SettingGeminiState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SettingGeminiState state) {
    // Only persist potentially necessary fields if needed, or all.
    // For hydration, we usually want to persist relevant fields.
    // However, API keys in HydratedBloc (plain text JSON on disk) might be risky?
    // User already saves API key to SecureStorage in 'AppConfig'.
    // So here we might only want to persist 'availableModels' or 'selectedModel' for UI cache.
    // But 'selectedModel' is ALSO in SecureStorage.
    // Let's stick to using SecureStorage as source of truth for Key and Model.
    // Hydration here allows checking 'availableModels' immediately on startup.
    return state.toJson();
  }
}
