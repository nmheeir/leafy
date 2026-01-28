import 'package:intl/intl.dart';

abstract final class DatetimeHelper {
  static String formatMs(int ms) {
    if (ms < 60000) return '${(ms / 1000).round()}s';
    final minutes = ms ~/ 60000;
    final hours = minutes ~/ 60;
    if (hours > 0) {
      final remMin = minutes % 60;
      return '${hours}h ${remMin}m';
    }
    return '${minutes}m';
  }

  static String formatDuration(Duration d) {
    if (d.inMinutes < 1) return '${d.inSeconds}s';
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    if (hours > 0) return '${hours}h ${minutes}m';
    return '${minutes}m';
  }

  static String formatTimeRange(DateTime start, DateTime end) {
    final format = DateFormat('h:mm a');
    return '${format.format(start)} - ${format.format(end)}';
  }
}
