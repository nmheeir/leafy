import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/app_config.dart';
import 'package:leafy/domain/models/ai_provider.dart';
import 'package:leafy/domain/services/gemini_service.dart';

part 'ai_settings_state.dart';
part 'ai_settings_cubit.freezed.dart';
part 'ai_settings_cubit.g.dart';

@injectable
class AISettingsCubit extends HydratedCubit<AISettingsState> {
  final AppConfig _appConfig;
  final GeminiService _geminiService;

  AISettingsCubit(this._appConfig, this._geminiService)
    : super(const AISettingsState()) {
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final providerStr = await _appConfig.getSelectedProvider();
    final provider = AIProvider.fromString(providerStr ?? 'gemini');

    final apiKey = await _appConfig.getApiKey(provider.name);
    final selectedModel = await _appConfig.getSelectedModel();

    emit(
      state.copyWith(
        selectedProvider: provider,
        apiKey: apiKey,
        selectedModel: selectedModel,
      ),
    );

    if (apiKey != null && apiKey.isNotEmpty) {
      await loadModels(apiKey, provider);
    }
  }

  Future<void> setProvider(AIProvider provider) async {
    emit(
      state.copyWith(selectedProvider: provider, isLoading: true, error: null),
    );
    await _appConfig.saveSelectedProvider(provider.name);

    // Load config for new provider
    final apiKey = await _appConfig.getApiKey(provider.name);
    emit(state.copyWith(apiKey: apiKey, isLoading: false));

    if (apiKey != null && apiKey.isNotEmpty) {
      await loadModels(apiKey, provider);
    } else {
      emit(state.copyWith(availableModels: []));
    }
  }

  Future<void> setApiKey(String apiKey) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await _appConfig.saveApiKey(state.selectedProvider.name, apiKey);
      emit(state.copyWith(apiKey: apiKey));
      await loadModels(apiKey, state.selectedProvider);
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadModels(String apiKey, AIProvider provider) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      List<String> models = [];
      if (provider == AIProvider.gemini) {
        models = await _geminiService.getAvailableModels(apiKey);
      } else {
        // Placeholder for other providers
        models = ['default-model'];
      }

      emit(state.copyWith(isLoading: false, availableModels: models));
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: 'Failed to load models: $e'),
      );
    }
  }

  Future<void> selectModel(String model) async {
    emit(state.copyWith(selectedModel: model));
    try {
      await _appConfig.saveSelectedModel(model);
    } catch (e) {
      // ignore
    }
  }

  @override
  AISettingsState? fromJson(Map<String, dynamic> json) {
    try {
      return AISettingsState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AISettingsState state) {
    return state.toJson();
  }
}
