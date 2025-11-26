import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:settings_ui/settings_ui.dart';

/// Một widget chỉ để hiển thị cho màn hình Sao lưu & Phục hồi.
/// Widget này không chứa logic, chỉ hiển thị giao diện tĩnh và sử dụng
/// easy_localization cho các chuỗi văn bản.
class SettingBackupRestoreScreen extends StatelessWidget {
  const SettingBackupRestoreScreen({super.key});

  /// Một hàm placeholder không thực hiện hành động nào.
  void _placeholderOnPressed(BuildContext context) {
    // Không làm gì cả.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.backup.tr(),
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: SettingsList(
        contentPadding: const EdgeInsets.only(top: 10),
        darkTheme: SettingsThemeData(
          settingsListBackground:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Theme.of(context).colorScheme.surfaceContainerLowest,
        ),
        lightTheme: SettingsThemeData(
          settingsListBackground:
              Theme.of(context).colorScheme.surfaceContainerLowest,
        ),
        sections: [
          _buildBackupSection(context),
          SettingsSection(
            title: Text(
              LocaleKeys.csv.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            tiles: <SettingsTile>[
              _buildExportAsCSV(),
              _buildImportCSV(),
              _buildImportGoodreadsCSV(),
              _buildImportBookwyrmCSV(),
            ],
          ),
        ],
      ),
    );
  }

  SettingsTile _buildRestoreBackup(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.restore_backup.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.arrowUpFromBracket),
      description: Text(
        LocaleKeys.restore_backup_alert_content.tr(),
      ),
      onPressed: _placeholderOnPressed,
    );
  }

  SettingsTile _buildCreateCloudBackup() {
    return SettingsTile(
      title: Text(
        LocaleKeys.create_cloud_backup.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.cloudArrowUp),
      description: Text(
        LocaleKeys.create_cloud_backup_description.tr(),
      ),
      onPressed: _placeholderOnPressed,
    );
  }

  SettingsTile _buildCreateLocalBackup() {
    return SettingsTile(
      title: Text(
        LocaleKeys.create_local_backup.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.solidFloppyDisk),
      description: Text(
        LocaleKeys.create_local_backup_description.tr(),
      ),
      onPressed: _placeholderOnPressed,
    );
  }

  SettingsTile _buildExportAsCSV() {
    return SettingsTile(
      title: Text(
        LocaleKeys.export_csv.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.fileCsv),
      description: Text(
        LocaleKeys.export_csv_description_1.tr(),
      ),
      onPressed: _placeholderOnPressed,
    );
  }

  SettingsTile _buildImportGoodreadsCSV() {
    return SettingsTile(
      title: Text(
        LocaleKeys.import_goodreads_csv.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.g),
      onPressed: _placeholderOnPressed,
    );
  }

  SettingsTile _buildImportBookwyrmCSV() {
    return SettingsTile(
      title: Text(
        LocaleKeys.import_bookwyrm_csv.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.b),
      onPressed: _placeholderOnPressed,
    );
  }

  SettingsTile _buildImportCSV() {
    return SettingsTile(
      title: Text(
        LocaleKeys.import_csv.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: Image.asset(
        'assets/icons/icon_cropped.png',
        width: 24,
        height: 24,
      ),
      onPressed: _placeholderOnPressed,
    );
  }

  SettingsSection _buildBackupSection(BuildContext context) {
    final listOfTiles = <SettingsTile>[
      _buildCreateLocalBackup(),
      _buildCreateCloudBackup(),
      _buildRestoreBackup(context),
    ];

    return SettingsSection(
      title: Text(
        LocaleKeys.leafy_backup.tr(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      tiles: listOfTiles,
    );
  }
}