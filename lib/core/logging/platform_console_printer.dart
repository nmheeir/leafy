import 'dart:io';
import 'package:logger/logger.dart';

class PlatformConsolePrinter extends LogPrinter {
  static const _reset = '\x1B[0m';
  static const _gray = '\x1B[90m';
  static const _blue = '\x1B[34m';
  static const _green = '\x1B[32m';
  static const _yellow = '\x1B[33m';
  static const _red = '\x1B[31m';
  static const _boldRed = '\x1B[1;31m';

  @override
  List<String> log(LogEvent event) {
    final levelChar = _levelChar(event.level);
    final color = _levelColor(event.level);

    final tag = 'MyApp';
    final pid = _pid;
    final caller = _extractCaller(event.stackTrace ?? StackTrace.current);
    final time = _formatTime(DateTime.now());

    final messageLines = event.message.toString().split('\n')
      ..removeWhere((e) => e.trim().isEmpty);

    if (messageLines.isEmpty) {
      return [];
    }

    final lines = <String>[];

    // ── dòng đầu (prefix đầy đủ)
    if (Platform.isAndroid) {
      lines.add(
        '$color$levelChar/$tag($pid): ${messageLines.first} $caller$_reset',
      );
    } else {
      lines.add(
        '$color[$levelChar] $tag: ${messageLines.first} $caller$_reset',
      );
    }

    // ── các dòng sau (indent, không prefix)
    for (final line in messageLines.skip(1)) {
      lines.add('    $line');
    }

    // ── time (luôn là 1 phần của log này)
    lines.add('    ${_gray}⏱ $time$_reset');

    return lines;
  }

  String _levelChar(Level level) {
    switch (level) {
      case Level.verbose:
        return 'V';
      case Level.debug:
        return 'D';
      case Level.info:
        return 'I';
      case Level.warning:
        return 'W';
      case Level.error:
        return 'E';
      case Level.fatal:
        return 'F';
      default:
        return 'I';
    }
  }

  String _levelColor(Level level) {
    switch (level) {
      case Level.verbose:
        return _gray;
      case Level.debug:
        return _blue;
      case Level.info:
        return _green;
      case Level.warning:
        return _yellow;
      case Level.error:
        return _red;
      case Level.fatal:
        return _boldRed;
      default:
        return _green;
    }
  }

  String _formatTime(DateTime dt) {
    return '${dt.year}-${_two(dt.month)}-${_two(dt.day)} '
        '${_two(dt.hour)}:${_two(dt.minute)}:${_two(dt.second)}.'
        '${dt.millisecond.toString().padLeft(3, '0')}';
  }

  String _two(int n) => n.toString().padLeft(2, '0');

  int get _pid {
    try {
      return pid;
    } catch (_) {
      return 0;
    }
  }

  String _extractCaller(StackTrace stackTrace) {
    final lines = stackTrace.toString().split('\n');

    for (final line in lines) {
      if (line.contains('.dart') &&
          !line.contains('logger') &&
          !line.contains('PlatformConsolePrinter')) {
        final match = RegExp(r'(\w+\.dart:\d+)').firstMatch(line);
        return match != null ? '(${match.group(1)})' : '';
      }
    }
    return '';
  }
}
