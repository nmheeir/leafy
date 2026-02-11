import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class IntroService {
  final SharedPreferences _prefs;

  IntroService(this._prefs);

  static const String _keyIsFirstTime = 'is_first_time';

  bool get isFirstTime => _prefs.getBool(_keyIsFirstTime) ?? true;

  Future<void> completeIntro() async {
    await _prefs.setBool(_keyIsFirstTime, false);
  }
}
