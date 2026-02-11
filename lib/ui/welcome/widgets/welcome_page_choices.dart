import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class WelcomePageChoices extends StatelessWidget {
  const WelcomePageChoices({
    super.key,
    required this.restoreBackup,
    required this.importCsv, // Consolidated CSV import
    required this.getStarted,
  });

  final VoidCallback restoreBackup;
  final VoidCallback importCsv;
  final VoidCallback getStarted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Text(
            LocaleKeys.help_to_get_started.tr(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // Restore Backup Button
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonalIcon(
              onPressed: restoreBackup,
              icon: const Icon(Icons.settings_backup_restore_rounded),
              label: Text(LocaleKeys.restore_title.tr()),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Import CSV Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: importCsv,
              icon: const Icon(Icons.file_upload_outlined),
              label: Text(LocaleKeys.csv_import.tr()),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const Spacer(flex: 1),
          // Get Started Button
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: getStarted,
              child: Text(LocaleKeys.start_button.tr()),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 48), // Bottom padding
        ],
      ),
    );
  }
}
