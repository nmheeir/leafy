import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/services/intro_service.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/file_helper.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/backup/backup_restore_cubit.dart';
import 'package:leafy/logic/backup/backup_restore_state.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/welcome/widgets/index.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();

  void _moveToHomeScreen() {
    getIt<IntroService>().completeIntro();
    context.go(Routes.home);
  }

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
          body: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: [
                          WelcomePageText(
                            title: LocaleKeys.welcome_1.tr(),
                            description:
                                '${LocaleKeys.welcome_1_description_1.tr()}\n\n${LocaleKeys.welcome_1_description_2.tr()}',
                            image: Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.colorScheme.primaryContainer
                                    .withValues(alpha: 0.3),
                              ),
                              child: Image.asset(
                                'assets/icons/leafy_logo_transparent.png',
                                width: context.deviceSize.width * 0.3,
                                height: context.deviceSize.width * 0.3,
                              ),
                            ),
                          ),
                          WelcomePageText(
                            title: LocaleKeys.statistics_title.tr(),
                            description:
                                '${LocaleKeys.welcome_2_description_1.tr()}\n\n${LocaleKeys.welcome_2_description_2.tr()}',
                            image: Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.colorScheme.secondaryContainer
                                    .withValues(alpha: 0.3),
                              ),
                              child: Icon(
                                Icons.bar_chart_rounded,
                                size: 80,
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
                          WelcomePageText(
                            title: LocaleKeys.source_code.tr(),
                            description:
                                '${LocaleKeys.welcome_3_description_1.tr()}\n${LocaleKeys.welcome_3_description_2.tr()}\n\n${LocaleKeys.welcome_3_description_3.tr()}',
                            image: Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.colorScheme.tertiaryContainer
                                    .withValues(alpha: 0.3),
                              ),
                              child: Icon(
                                Icons.code_rounded,
                                size: 80,
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
                          WelcomePageChoices(
                            restoreBackup: () =>
                                _showRestoreOptionsDialog(context),
                            importCsv: () => _showImportCsvDialog(context),
                            getStarted: _moveToHomeScreen,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: WormEffect(
                          activeDotColor: context.colorScheme.primary,
                          dotColor: context.colorScheme.surfaceContainerHighest,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 16,
                        ),
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
                  state.message ?? LocaleKeys.backup_loading.tr(),
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

  void _showRestoreOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
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
              context.backupRestoreCubit.restoreLocalBackup();
            },
            icon: const Icon(FontAwesomeIcons.solidFloppyDisk, size: 16),
            label: Text(LocaleKeys.restore_local_file.tr()),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(dialogContext);
              _showCloudBackupsDialog(context);
            },
            icon: const Icon(FontAwesomeIcons.cloudArrowDown, size: 16),
            label: Text(LocaleKeys.restore_google_drive.tr()),
          ),
        ],
      ),
    );
  }

  void _showImportCsvDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(LocaleKeys.csv_import.tr()),
        content: Text(LocaleKeys.csv_import_description.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.backupRestoreCubit.importCsv();
            },
            child: Text(LocaleKeys.continuee.tr()),
          ),
        ],
      ),
    );
  }

  void _showCloudBackupsDialog(BuildContext context) {
    final cubit = context.backupRestoreCubit;
    cubit.loadCloudBackups();

    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: cubit,
        child: BlocBuilder<BackupRestoreCubit, BackupRestoreState>(
          builder: (context, state) {
            Widget content;

            if (state.status == BackupStatus.loading) {
              content = Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
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
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.cloud_off, size: 48, color: Colors.grey),
                      const SizedBox(height: 16),
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
                width: double.maxFinite,
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

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 48),
        title: Text(LocaleKeys.success.tr()),
        content: Text(message),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.backupRestoreCubit.reset();
              // If restore is successful, we might want to navigate to home or reload
              // For now, let's just reset.
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
        icon: const Icon(Icons.error, color: Colors.red, size: 48),
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
