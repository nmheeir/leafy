import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/backup/backup_restore_cubit.dart';
import 'package:leafy/logic/backup/backup_restore_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:settings_ui/settings_ui.dart';

/// Màn hình Sao lưu & Phục hồi với đầy đủ chức năng
class SettingBackupRestoreScreen extends StatelessWidget {
  const SettingBackupRestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BackupRestoreCubit>(),
      child: const _SettingBackupRestoreView(),
    );
  }
}

class _SettingBackupRestoreView extends StatelessWidget {
  const _SettingBackupRestoreView();

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
              LocaleKeys.backup.tr(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          body: Stack(
            children: [
              SettingsList(
                contentPadding: const EdgeInsets.only(top: 10),
                darkTheme: SettingsThemeData(
                  settingsListBackground:
                      Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Theme.of(context).colorScheme.surfaceContainerLowest,
                ),
                lightTheme: SettingsThemeData(
                  settingsListBackground: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerLowest,
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
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  state.message ?? 'Processing...',
                  style: Theme.of(context).textTheme.bodyLarge,
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
        LocaleKeys.leafy_backup.tr(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
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
        LocaleKeys.csv.tr(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
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
        LocaleKeys.create_local_backup.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.solidFloppyDisk),
      description: Text(LocaleKeys.create_local_backup_description.tr()),
      onPressed: (ctx) => _showConfirmDialog(
        ctx,
        title: LocaleKeys.create_local_backup.tr(),
        content:
            'This will create a backup file containing all your books and reading progress.',
        onConfirm: () => context.read<BackupRestoreCubit>().createLocalBackup(),
      ),
    );
  }

  SettingsTile _buildCreateCloudBackup(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.create_cloud_backup.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.cloudArrowUp),
      description: Text(LocaleKeys.create_cloud_backup_description.tr()),
      onPressed: (ctx) => _showConfirmDialog(
        ctx,
        title: LocaleKeys.create_cloud_backup.tr(),
        content:
            'This will upload a backup to your Google Drive.\n\nYou will need to sign in with your Google account.',
        onConfirm: () => context.read<BackupRestoreCubit>().createCloudBackup(),
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
      description: Text(LocaleKeys.restore_backup_alert_content.tr()),
      onPressed: (ctx) => _showRestoreOptionsDialog(ctx, context),
    );
  }

  SettingsTile _buildExportAsCSV(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.export_csv.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.fileCsv),
      description: Text(LocaleKeys.export_csv_description_1.tr()),
      onPressed: (ctx) => context.read<BackupRestoreCubit>().exportCsv(),
    );
  }

  SettingsTile _buildImportCSV(BuildContext context) {
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
      onPressed: (ctx) => _showConfirmDialog(
        ctx,
        title: LocaleKeys.import_csv.tr(),
        content:
            'Import books from a Leafy CSV file.\n\nThis will add new books to your library.',
        onConfirm: () => context.read<BackupRestoreCubit>().importCsv(),
      ),
    );
  }

  void _showRestoreOptionsDialog(BuildContext ctx, BuildContext cubitContext) {
    showDialog(
      context: ctx,
      builder: (dialogContext) => AlertDialog(
        title: Text(LocaleKeys.restore_backup.tr()),
        content: const Text(
          'Where would you like to restore from?\n\n⚠️ This will replace all your current data!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(dialogContext);
              cubitContext.read<BackupRestoreCubit>().restoreLocalBackup();
            },
            icon: const Icon(FontAwesomeIcons.solidFloppyDisk, size: 16),
            label: const Text('Local File'),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(dialogContext);
              _showCloudBackupsDialog(ctx, cubitContext);
            },
            icon: const Icon(FontAwesomeIcons.cloudArrowDown, size: 16),
            label: const Text('Google Drive'),
          ),
        ],
      ),
    );
  }

  void _showCloudBackupsDialog(BuildContext ctx, BuildContext cubitContext) {
    final cubit = cubitContext.read<BackupRestoreCubit>();
    cubit.loadCloudBackups();

    showDialog(
      context: ctx,
      builder: (dialogContext) => BlocProvider.value(
        value: cubit,
        child: BlocBuilder<BackupRestoreCubit, BackupRestoreState>(
          builder: (context, state) {
            return AlertDialog(
              title: const Text('Cloud Backups'),
              content: SizedBox(
                width: double.maxFinite,
                child: state.status == BackupStatus.loading
                    ? const Center(child: CircularProgressIndicator())
                    : state.cloudBackups.isEmpty
                    ? const Text('No cloud backups found')
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.cloudBackups.length,
                        itemBuilder: (ctx, index) {
                          final backup = state.cloudBackups[index];
                          return ListTile(
                            title: Text(backup.name),
                            subtitle: Text(
                              DateFormat.yMMMd().add_Hm().format(
                                backup.createdAt,
                              ),
                            ),
                            trailing: Text(_formatBytes(backup.sizeBytes)),
                            onTap: () {
                              Navigator.pop(dialogContext);
                              cubit.restoreCloudBackup(backup.id);
                            },
                          );
                        },
                      ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
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
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm();
            },
            child: const Text('Continue'),
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
        title: const Text('Success'),
        content: Text(message),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<BackupRestoreCubit>().reset();
            },
            child: const Text('OK'),
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
        title: const Text('Error'),
        content: Text(message),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<BackupRestoreCubit>().reset();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
