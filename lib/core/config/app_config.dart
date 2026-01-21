import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/env.dart';

abstract class AppConfig {
  Future<String?> getGeminiApiKey();
  Future<void> saveGeminiApiKey(String key);
  Future<String?> getSelectedModel();
  Future<void> saveSelectedModel(String model);
}

@LazySingleton(as: AppConfig)
class AppConfigImpl implements AppConfig {
  final FlutterSecureStorage _storage;
  static const String _geminiKey = 'gemini_api_key';
  static const String _selectedModelKey = 'gemini_selected_model';

  AppConfigImpl(this._storage);

  @override
  Future<String?> getGeminiApiKey() async {
    final storageKey = await _storage.read(key: _geminiKey);
    if (storageKey != null && storageKey.isNotEmpty) {
      return storageKey;
    }

    if (kDebugMode) {
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
  Future<void> saveGeminiApiKey(String key) async {
    await _storage.write(key: _geminiKey, value: key);
  }

  @override
  Future<String?> getSelectedModel() async {
    return await _storage.read(key: _selectedModelKey);
  }

  @override
  Future<void> saveSelectedModel(String model) async {
    await _storage.write(key: _selectedModelKey, value: model);
  }
}
