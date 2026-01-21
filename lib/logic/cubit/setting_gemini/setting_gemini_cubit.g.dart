// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_gemini_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingGeminiState _$SettingGeminiStateFromJson(Map<String, dynamic> json) =>
    _SettingGeminiState(
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
      apiKey: json['apiKey'] as String?,
      availableModels:
          (json['availableModels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedModel: json['selectedModel'] as String?,
    );

Map<String, dynamic> _$SettingGeminiStateToJson(_SettingGeminiState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'error': instance.error,
      'apiKey': instance.apiKey,
      'availableModels': instance.availableModels,
      'selectedModel': instance.selectedModel,
    };
