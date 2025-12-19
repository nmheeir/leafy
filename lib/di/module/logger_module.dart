import 'package:injectable/injectable.dart';
import 'package:leafy/core/logging/platform_console_printer.dart';
import 'package:logger/web.dart';

@module
abstract class LoggerModule {
  @lazySingleton
  Logger get logger =>
      Logger(printer: PlatformConsolePrinter(), level: Level.debug);
}
