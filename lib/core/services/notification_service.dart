import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Notification channel IDs
class NotificationChannels {
  static const String reminderId = 'leafy_reading_reminder';
  static const String reminderName = 'Reading Reminder';
  static const String reminderDescription =
      'Daily reminder to continue reading';

  static const String downloadId = 'leafy_download';
  static const String downloadName = 'Downloads';
  static const String downloadDescription = 'Book download progress';

  static const String backupId = 'leafy_backup';
  static const String backupName = 'Backup & Restore';
  static const String backupDescription = 'Backup status notifications';
}

/// Notification IDs
class NotificationIds {
  static const int dailyReminder = 1000;
  static const int downloadBase = 2000;
  static const int backupStatus = 3000;
}

/// Payload actions
class NotificationPayload {
  static const String actionOpenHome = 'open_home';
  static const String actionOpenBook = 'open_book';

  final String action;
  final int? bookId;

  NotificationPayload({required this.action, this.bookId});

  String toJson() => jsonEncode({'action': action, 'bookId': bookId});

  factory NotificationPayload.fromJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return NotificationPayload(
      action: map['action'] as String,
      bookId: map['bookId'] as int?,
    );
  }
}

/// Callback for handling notification taps (must be top-level or static)
@pragma('vm:entry-point')
void onDidReceiveNotificationResponse(NotificationResponse response) {
  NotificationService.pendingPayload = response.payload;
  if (response.payload != null) {
    NotificationService.onNotificationTap.add(response.payload!);
  }
}

@singleton
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  final SharedPreferences _prefs;
  final Logger _logger;

  static String? pendingPayload;
  static final StreamController<String> onNotificationTap =
      StreamController<String>.broadcast();

  // SharedPreferences keys
  static const String _keyReminderEnabled = 'notification_reminder_enabled';
  static const String _keyReminderHour = 'notification_reminder_hour';
  static const String _keyReminderMinute = 'notification_reminder_minute';

  NotificationService(this._prefs, this._logger);

  bool get isReminderEnabled => _prefs.getBool(_keyReminderEnabled) ?? false;
  int get reminderHour => _prefs.getInt(_keyReminderHour) ?? 20;
  int get reminderMinute => _prefs.getInt(_keyReminderMinute) ?? 0;
  TimeOfDay get reminderTime =>
      TimeOfDay(hour: reminderHour, minute: reminderMinute);

  Future<void> init() async {
    tz.initializeTimeZones();

    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/launcher_icon',
    );

    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
    );

    await _plugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    // Create Android notification channels
    if (Platform.isAndroid) {
      final androidPlugin = _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      await androidPlugin?.createNotificationChannel(
        const AndroidNotificationChannel(
          NotificationChannels.reminderId,
          NotificationChannels.reminderName,
          description: NotificationChannels.reminderDescription,
          importance: Importance.high,
        ),
      );

      await androidPlugin?.createNotificationChannel(
        const AndroidNotificationChannel(
          NotificationChannels.downloadId,
          NotificationChannels.downloadName,
          description: NotificationChannels.downloadDescription,
          importance: Importance.low,
          showBadge: false,
        ),
      );

      await androidPlugin?.createNotificationChannel(
        const AndroidNotificationChannel(
          NotificationChannels.backupId,
          NotificationChannels.backupName,
          description: NotificationChannels.backupDescription,
          importance: Importance.defaultImportance,
        ),
      );
    }

    _logger.i('NotificationService initialized');
  }

  Future<bool> requestPermission() async {
    if (Platform.isAndroid) {
      final androidPlugin = _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      final granted =
          await androidPlugin?.requestNotificationsPermission() ?? false;
      return granted;
    }

    if (Platform.isIOS) {
      final iosPlugin = _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      final granted = await iosPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    return false;
  }

  // ─── Daily Reading Reminder ────────────────────────────────────────

  Future<void> scheduleDailyReminder({
    required int hour,
    required int minute,
  }) async {
    await cancelNotification(NotificationIds.dailyReminder);

    await _prefs.setBool(_keyReminderEnabled, true);
    await _prefs.setInt(_keyReminderHour, hour);
    await _prefs.setInt(_keyReminderMinute, minute);

    final payload = NotificationPayload(
      action: NotificationPayload.actionOpenHome,
    );

    final scheduledTime = _nextInstanceOfTime(hour, minute);

    _logger.i('Giờ hiện tại của TZ: ${tz.TZDateTime.now(tz.local)}');
    _logger.i('Thông báo sẽ nổ vào lúc: $scheduledTime');

    await _plugin.zonedSchedule(
      id: NotificationIds.dailyReminder,
      scheduledDate: scheduledTime,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.reminderId,
          NotificationChannels.reminderName,
          channelDescription: NotificationChannels.reminderDescription,
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/launcher_icon',
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      title: 'Time to read!',
      body: 'Your books are waiting for you. Let\'s continue reading!',
      payload: payload.toJson(),
    );

    _logger.i('Daily reminder scheduled at $hour:$minute');
  }

  Future<void> cancelDailyReminder() async {
    await cancelNotification(NotificationIds.dailyReminder);
    await _prefs.setBool(_keyReminderEnabled, false);
    _logger.i('Daily reminder cancelled');
  }

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  // ─── Download Progress ─────────────────────────────────────────────

  Future<void> showDownloadProgress({
    required int notificationId,
    required String title,
    required int progress,
    int maxProgress = 100,
  }) async {
    await _plugin.show(
      id: NotificationIds.downloadBase + notificationId,
      title: title,
      body: '$progress% downloaded',
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.downloadId,
          NotificationChannels.downloadName,
          channelDescription: NotificationChannels.downloadDescription,
          importance: Importance.low,
          priority: Priority.low,
          showProgress: true,
          maxProgress: maxProgress,
          progress: progress,
          ongoing: progress < 100,
          autoCancel: false,
          icon: '@mipmap/launcher_icon',
        ),
      ),
    );
  }

  Future<void> showDownloadComplete({
    required int notificationId,
    required String title,
    int? bookId,
  }) async {
    final payload = NotificationPayload(
      action: NotificationPayload.actionOpenBook,
      bookId: bookId,
    );

    await _plugin.show(
      id: NotificationIds.downloadBase + notificationId,
      title: 'Download complete',
      body: title,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.downloadId,
          NotificationChannels.downloadName,
          channelDescription: NotificationChannels.downloadDescription,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          icon: '@mipmap/launcher_icon',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      payload: payload.toJson(),
    );
  }

  // ─── Backup Status ─────────────────────────────────────────────────

  Future<void> showBackupSuccess({required String message}) async {
    await _plugin.show(
      id: NotificationIds.backupStatus,
      title: 'Backup Successful',
      body: message,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.backupId,
          NotificationChannels.backupName,
          channelDescription: NotificationChannels.backupDescription,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          icon: '@mipmap/launcher_icon',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
    );
  }

  Future<void> showBackupFailure({required String message}) async {
    await _plugin.show(
      id: NotificationIds.backupStatus + 1,
      title: 'Backup Failed',
      body: message,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.backupId,
          NotificationChannels.backupName,
          channelDescription: NotificationChannels.backupDescription,
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/launcher_icon',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
    );
  }

  // ─── Simple Notification ───────────────────────────────────────────

  Future<void> showSimpleNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    await _plugin.show(
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationChannels.backupId,
          NotificationChannels.backupName,
          channelDescription: NotificationChannels.backupDescription,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          icon: '@mipmap/launcher_icon',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      payload: payload,
    );
  }

  // ─── Cancel ────────────────────────────────────────────────────────

  Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id: id);
  }

  Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }
}
