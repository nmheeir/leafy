// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AISettingsState _$AISettingsStateFromJson(Map<String, dynamic> json) =>
    _AISettingsState(
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
      apiKey: json['apiKey'] as String?,
      availableModels:
          (json['availableModels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedModel: json['selectedModel'] as String?,
      selectedProvider:
          $enumDecodeNullable(_$AIProviderEnumMap, json['selectedProvider']) ??
          AIProvider.gemini,
    );

Map<String, dynamic> _$AISettingsStateToJson(_AISettingsState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'error': instance.error,
      'apiKey': instance.apiKey,
      'availableModels': instance.availableModels,
      'selectedModel': instance.selectedModel,
      'selectedProvider': _$AIProviderEnumMap[instance.selectedProvider]!,
    };

const _$AIProviderEnumMap = {
  AIProvider.gemini: 'gemini',
  AIProvider.openAI: 'openAI',
  AIProvider.claude: 'claude',
};
