import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/services/notification_service.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingNotificationScreen extends StatefulWidget {
  const SettingNotificationScreen({super.key});

  @override
  State<SettingNotificationScreen> createState() =>
      _SettingNotificationScreenState();
}

class _SettingNotificationScreenState extends State<SettingNotificationScreen> {
  late final NotificationService _notificationService;
  late bool _isReminderEnabled;
  late TimeOfDay _reminderTime;

  @override
  void initState() {
    super.initState();
    _notificationService = getIt<NotificationService>();
    _isReminderEnabled = _notificationService.isReminderEnabled;
    _reminderTime = _notificationService.reminderTime;
  }

  Future<void> _toggleReminder(bool enabled) async {
    if (enabled) {
      final granted = await _notificationService.requestPermission();
      if (!granted) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(LocaleKeys.notification_denied.tr()),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }
      await _notificationService.scheduleDailyReminder(
        hour: _reminderTime.hour,
        minute: _reminderTime.minute,
      );
    } else {
      await _notificationService.cancelDailyReminder();
    }

    setState(() {
      _isReminderEnabled = enabled;
    });
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );

    if (picked != null) {
      setState(() {
        _reminderTime = picked;
      });

      if (_isReminderEnabled) {
        await _notificationService.scheduleDailyReminder(
          hour: picked.hour,
          minute: picked.minute,
        );
      }
    }
  }

  Future<void> _sendTestNotification() async {
    final granted = await _notificationService.requestPermission();
    if (!granted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(LocaleKeys.notification_denied.tr()),
            backgroundColor: context.colorScheme.error,
          ),
        );
      }
      return;
    }

    await _notificationService.showSimpleNotification(
      title: 'Leafy Test',
      body: 'Notifications are working!',
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.notification_test_sent.tr()),
          backgroundColor: context.colorScheme.primary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedTime = _reminderTime.format(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.notification_title.tr(),
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SettingsList(
        contentPadding: const EdgeInsets.only(top: 10),
        lightTheme: SettingsThemeData(
          settingsListBackground: context.colorScheme.surfaceContainerLowest,
        ),
        darkTheme: SettingsThemeData(
          settingsListBackground: context.brightness == Brightness.dark
              ? Colors.black
              : context.colorScheme.surfaceContainerLowest,
        ),
        sections: [
          SettingsSection(
            title: Text(
              LocaleKeys.notification_daily_reminder.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
            tiles: [
              SettingsTile.switchTile(
                title: Text(
                  LocaleKeys.notification_enable_daily_reminder.tr(),
                  style: TextStyle(fontSize: 16),
                ),
                description: Text(
                  _isReminderEnabled
                      ? 'You will be reminded at $formattedTime daily'
                      : 'Get a daily reminder to read',
                ),
                leading: const Icon(Icons.notifications_active_outlined),
                initialValue: _isReminderEnabled,
                onToggle: _toggleReminder,
              ),
              SettingsTile(
                title: Text(
                  LocaleKeys.notification_daily_reminder_time.tr(),
                  style: TextStyle(fontSize: 16),
                ),
                description: Text(formattedTime),
                leading: const Icon(Icons.access_time),
                enabled: _isReminderEnabled,
                onPressed: (_) => _pickTime(),
              ),
            ],
          ),
          SettingsSection(
            title: Text(
              LocaleKeys.notification_test.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
            tiles: [
              SettingsTile(
                title: Text(
                  LocaleKeys.notification_send_test.tr(),
                  style: TextStyle(fontSize: 16),
                ),
                description: Text(LocaleKeys.notification_tap_to_verify.tr()),
                leading: const Icon(Icons.send_outlined),
                onPressed: (_) => _sendTestNotification(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
