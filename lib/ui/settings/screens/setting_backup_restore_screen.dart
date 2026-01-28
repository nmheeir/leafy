import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/file_helper.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/backup/backup_restore_cubit.dart';
import 'package:leafy/logic/backup/backup_restore_state.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingBackupRestoreScreen extends StatelessWidget {
  const SettingBackupRestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BackupRestoreCubit, BackupRestoreState>(
      listener: (context, state) {
        if (state.status == BackupStatus.success && state.message != null) {
          _showSuccessDialog(context, state.message!);
        }
        if (state.status == BackupStatus.failure &&
            state.errorMessage != null) {
          _showErrorDialog(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.backup_and_restore.tr(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          body: Stack(
            children: [
              SettingsList(
                contentPadding: const EdgeInsets.only(top: 10),
                darkTheme: SettingsThemeData(
                  settingsListBackground: context.brightness == Brightness.dark
                      ? Colors.black
                      : context.colorScheme.surfaceContainerLowest,
                ),
                lightTheme: SettingsThemeData(
                  settingsListBackground:
                      context.colorScheme.surfaceContainerLowest,
                ),
                sections: [
                  _buildBackupSection(context),
                  _buildCsvSection(context),
                ],
              ),
              if (state.status == BackupStatus.loading)
                _buildLoadingOverlay(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingOverlay(BuildContext context, BackupRestoreState state) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingAnimationWidget.staggeredDotsWave(
                  color: context.colorScheme.primary,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  state.message ?? 'Processing...',
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SettingsSection _buildBackupSection(BuildContext context) {
    return SettingsSection(
      title: Text(
        LocaleKeys.backup_title.tr(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: context.colorScheme.primary,
        ),
      ),
      tiles: <SettingsTile>[
        _buildCreateLocalBackup(context),
        _buildCreateCloudBackup(context),
        _buildRestoreBackup(context),
      ],
    );
  }

  SettingsSection _buildCsvSection(BuildContext context) {
    return SettingsSection(
      title: Text(
        LocaleKeys.csv_title.tr(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: context.colorScheme.primary,
        ),
      ),
      tiles: <SettingsTile>[
        _buildExportAsCSV(context),
        _buildImportCSV(context),
      ],
    );
  }

  SettingsTile _buildCreateLocalBackup(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.backup_local_create.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.solidFloppyDisk),
      description: Text(LocaleKeys.backup_local_create_description.tr()),
      onPressed: (ctx) => _showConfirmDialog(
        ctx,
        title: LocaleKeys.backup_local_create.tr(),
        content:
            'This will create a backup file containing all your books and reading progress.',
        onConfirm: () => context.backupRestoreCubit.createLocalBackup(),
      ),
    );
  }

  SettingsTile _buildCreateCloudBackup(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.backup_cloud_create.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.cloudArrowUp),
      description: Text(LocaleKeys.backup_cloud_create_description.tr()),
      onPressed: (ctx) => _showConfirmDialog(
        ctx,
        title: LocaleKeys.backup_cloud_create.tr(),
        content: LocaleKeys.backup_cloud_create_alert.tr(),
        onConfirm: () => context.backupRestoreCubit.createCloudBackup(),
      ),
    );
  }

  SettingsTile _buildRestoreBackup(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.restore_title.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.arrowUpFromBracket),
      description: Text(LocaleKeys.restore_alert.tr()),
      onPressed: (ctx) => _showRestoreOptionsDialog(ctx, context),
    );
  }

  SettingsTile _buildExportAsCSV(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.csv_export.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.fileCsv),
      description: Text(LocaleKeys.csv_export_description.tr()),
      onPressed: (ctx) => context.backupRestoreCubit.exportCsv(),
    );
  }

  SettingsTile _buildImportCSV(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.csv_title.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: Image.asset(
        'assets/icons/icon_cropped.png',
        width: 24,
        height: 24,
      ),
      onPressed: (ctx) => _showConfirmDialog(
        ctx,
        title: LocaleKeys.csv_import.tr(),
        content: LocaleKeys.csv_import_description.tr(),
        onConfirm: () => context.backupRestoreCubit.importCsv(),
      ),
    );
  }

  void _showRestoreOptionsDialog(BuildContext ctx, BuildContext cubitContext) {
    showDialog(
      context: ctx,
      builder: (dialogContext) => AlertDialog(
        title: Text(LocaleKeys.restore_title.tr()),
        content: Text(LocaleKeys.restore_alert.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(LocaleKeys.restore_cancel.tr()),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(dialogContext);
              cubitContext.backupRestoreCubit.restoreLocalBackup();
            },
            icon: const Icon(FontAwesomeIcons.solidFloppyDisk, size: 16),
            label: Text(LocaleKeys.restore_local_file.tr()),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(dialogContext);
              _showCloudBackupsDialog(ctx, cubitContext);
            },
            icon: const Icon(FontAwesomeIcons.cloudArrowDown, size: 16),
            label: Text(LocaleKeys.restore_google_drive.tr()),
          ),
        ],
      ),
    );
  }

  void _showCloudBackupsDialog(BuildContext ctx, BuildContext cubitContext) {
    final cubit = cubitContext.backupRestoreCubit;
    cubit.loadCloudBackups();

    showDialog(
      context: ctx,
      builder: (dialogContext) => BlocProvider.value(
        value: cubit,
        child: BlocBuilder<BackupRestoreCubit, BackupRestoreState>(
          builder: (context, state) {
            Widget content;

            if (state.status == BackupStatus.loading) {
              content = Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(LocaleKeys.backup_loading.tr()),
                    ],
                  ),
                ),
              );
            } else if (state.cloudBackups.isNotEmpty) {
              content = Column(
                mainAxisSize: MainAxisSize.min,
                children: state.cloudBackups.map((backup) {
                  return ListTile(
                    leading: const Icon(Icons.cloud_download_outlined),
                    title: Text(
                      backup.name,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().add_Hm().format(backup.createdAt),
                      style: TextStyle(
                        fontSize: 12,
                        color: context.colorScheme.outline,
                      ),
                    ),
                    trailing: Text(
                      FileHelper.formatSize(backup.sizeBytes),
                      style: TextStyle(
                        fontSize: 12,
                        color: context.colorScheme.outline,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(dialogContext);
                      cubit.restoreCloudBackup(backup.id);
                    },
                  );
                }).toList(),
              );
            } else {
              content = Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.cloud_off, size: 48, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(LocaleKeys.backup_cloud_no_found.tr()),
                    ],
                  ),
                ),
              );
            }

            return AlertDialog(
              title: Row(
                children: [
                  Icon(Icons.cloud, color: context.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(LocaleKeys.backup_cloud_create.tr()),
                ],
              ),
              content: SizedBox(
                width: 320,
                child: SingleChildScrollView(child: content),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: Text(LocaleKeys.cancel.tr()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm();
            },
            child: Text(LocaleKeys.continuee.tr()),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(Icons.check_circle, color: Colors.green, size: 48),
        title: Text(LocaleKeys.success.tr()),
        content: Text(message),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.backupRestoreCubit.reset();
            },
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(Icons.error, color: Colors.red, size: 48),
        title: Text(LocaleKeys.error_unexpected.tr()),
        content: Text(message),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.backupRestoreCubit.reset();
            },
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }
}
