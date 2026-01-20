import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/screen_orientation.dart';
import 'package:screen_brightness/screen_brightness.dart';

abstract class DeviceLocalDataSource {
  Future<double> get currentBrightness;
  Future<void> setBrightness(double brightness);
  Future<void> resetBrightness();
  Future<void> setOrientation(ScreenOrientation orientation);
}

@LazySingleton(as: DeviceLocalDataSource)
class DeviceLocalDataSourceImpl implements DeviceLocalDataSource {
  final ScreenBrightness _screenBrightness;

  DeviceLocalDataSourceImpl(this._screenBrightness);

  @override
  Future<double> get currentBrightness => _screenBrightness.system;

  @override
  Future<void> setBrightness(double brightness) =>
      _screenBrightness.setApplicationScreenBrightness(brightness);

  @override
  Future<void> resetBrightness() =>
      _screenBrightness.resetApplicationScreenBrightness();

  @override
  Future<void> setOrientation(ScreenOrientation orientation) async {
    switch (orientation) {
      case ScreenOrientation.defaultValue:
      case ScreenOrientation.free:
        await SystemChrome.setPreferredOrientations([]);
        break;
      case ScreenOrientation.portrait:
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        break;
      case ScreenOrientation.landscape:
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        break;
      case ScreenOrientation.lockedPortrait:
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        break;
      case ScreenOrientation.lockedLandscape:
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
        ]);
        break;
    }
  }
}
