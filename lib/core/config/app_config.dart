import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/env.dart';

abstract class AppConfig {
  Future<String?> getApiKey(String provider);
  Future<void> saveApiKey(String provider, String key);
  Future<String?> getSelectedModel();
  Future<void> saveSelectedModel(String model);
  Future<String?> getSelectedProvider();
  Future<void> saveSelectedProvider(String provider);

  // Deprecated/Legacy support wrappers
  Future<String?> getGeminiApiKey();
  Future<void> saveGeminiApiKey(String key);
}

@LazySingleton(as: AppConfig)
class AppConfigImpl implements AppConfig {
  final FlutterSecureStorage _storage;
  static const String _selectedModelKey = 'leafy_selected_model';
  static const String _selectedProviderKey = 'leafy_selected_provider';

  // Legacy key for backward compatibility
  static const String _legacyGeminiKey = 'gemini_api_key';

  AppConfigImpl(this._storage);

  String _getStorageKeyForProvider(String provider) {
    if (provider == 'gemini') return _legacyGeminiKey;
    return 'api_key_$provider';
  }

  @override
  Future<String?> getApiKey(String provider) async {
    final key = _getStorageKeyForProvider(provider);
    final storageKey = await _storage.read(key: key);

    if (storageKey != null && storageKey.isNotEmpty) {
      return storageKey;
    }

    if (kDebugMode && provider == 'gemini') {
      try {
        final envKey = Env.geminiApiKey;
        if (envKey.isNotEmpty &&
            envKey != 'your_gemini_api_key_here' &&
            envKey != 'TODO_ENTER_YOUR_KEY_HERE') {
          return envKey;
        }
      } catch (_) {}
    }

    return null;
  }

  @override
  Future<void> saveApiKey(String provider, String key) async {
    final storageKey = _getStorageKeyForProvider(provider);
    await _storage.write(key: storageKey, value: key);
  }

  @override
  Future<String?> getSelectedModel() async {
    return await _storage.read(key: _selectedModelKey);
  }

  @override
  Future<void> saveSelectedModel(String model) async {
    await _storage.write(key: _selectedModelKey, value: model);
  }

  @override
  Future<String?> getSelectedProvider() async {
    return await _storage.read(key: _selectedProviderKey);
  }

  @override
  Future<void> saveSelectedProvider(String provider) async {
    await _storage.write(key: _selectedProviderKey, value: provider);
  }

  @override
  Future<String?> getGeminiApiKey() => getApiKey('gemini');

  @override
  Future<void> saveGeminiApiKey(String key) => saveApiKey('gemini', key);
}
