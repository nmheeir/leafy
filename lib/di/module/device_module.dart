import 'package:injectable/injectable.dart';
import 'package:screen_brightness/screen_brightness.dart';

@module
abstract class DeviceModule {
  @lazySingleton
  ScreenBrightness get screenBrightness => ScreenBrightness();
}
