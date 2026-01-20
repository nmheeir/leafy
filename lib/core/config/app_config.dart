import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/config/env.dart';

abstract class AppConfig {
  Future<String?> getGeminiApiKey();
  Future<void> saveGeminiApiKey(String key);
}

@LazySingleton(as: AppConfig)
class AppConfigImpl implements AppConfig {
  final FlutterSecureStorage _storage;
  static const String _geminiKey = 'gemini_api_key';

  AppConfigImpl(this._storage);

  @override
  Future<String?> getGeminiApiKey() async {
    // 1. Check from Envied (for dev)
    try {
      final envKey = Env.geminiApiKey;
      if (envKey.isNotEmpty && envKey != 'your_gemini_api_key_here') {
        return envKey;
      }
    } catch (_) {
      // Fallback if Env is not yet generated or fails
    }

    // 2. Check from secure storage (for users)
    return await _storage.read(key: _geminiKey);
  }

  @override
  Future<void> saveGeminiApiKey(String key) async {
    await _storage.write(key: _geminiKey, value: key);
  }
}
