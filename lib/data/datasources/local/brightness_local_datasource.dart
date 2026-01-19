import 'package:injectable/injectable.dart';
import 'package:screen_brightness/screen_brightness.dart';

abstract class BrightnessLocalDataSource {
  Future<double> get currentBrightness;
  Future<void> setBrightness(double brightness);
  Future<void> resetBrightness();
}

@LazySingleton(as: BrightnessLocalDataSource)
class BrightnessLocalDataSourceImpl implements BrightnessLocalDataSource {
  final ScreenBrightness _screenBrightness;

  BrightnessLocalDataSourceImpl(this._screenBrightness);

  @override
  Future<double> get currentBrightness => _screenBrightness.system;

  @override
  Future<void> setBrightness(double brightness) =>
      _screenBrightness.setSystemScreenBrightness(brightness);

  @override
  Future<void> resetBrightness() =>
      _screenBrightness.resetApplicationScreenBrightness();
}
