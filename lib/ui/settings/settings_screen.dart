import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/widgets/common_dialogs.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/default_book_format_cubit.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/settings/widgets/setting_dialog_button.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:leafy/core/database/seeds/db_seeder.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/core/constants/locale/locale.dart';
import 'package:leafy/ui/tags/tag_management_screen.dart';

const String releasesUrl = 'https://github.com/nmheeir/leafy/releases';
const String repoUrl = 'https://github.com/nmheeir/leafy';
const String licence = 'MIT License';
const String licenceUrl = 'https://github.com/nmheeir/leafy/blob/main/LICENSE';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    // Force rebuild when locale changes
    context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.settings.tr(),
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: FutureBuilder<String>(
          future: _getAppVersion(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final version = snapshot.data;

              return SettingsList(
                contentPadding: const EdgeInsets.only(top: 10),

                lightTheme: SettingsThemeData(
                  settingsListBackground:
                      context.colorScheme.surfaceContainerLowest,
                ),
                sections: [
                  // SettingsSection(tiles: _buildGeneralSettingsTiles(context)),
                  SettingsSection(
                    title: Text(
                      LocaleKeys.books_settings.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    tiles: <SettingsTile>[
                      _buildTrashSetting(context),
                      // _buildDefaultBooksFormat(context),
                      _buildTabOrderSetting(context),
                      // _buildDefaultTags(context),
                      _buildTagManagement(context),
                      // _buildDownloadMissingCovers(context),
                    ],
                  ),
                  SettingsSection(
                    title: Text(
                      LocaleKeys.app.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    tiles: <SettingsTile>[
                      _buildBackupRestoreSetting(context),
                      _buildAppearanceSetting(context),
                      _buildLanguageSetting(context),
                    ],
                  ),
                  SettingsSection(
                    title: Text(
                      LocaleKeys.ai_api_key_setting_title.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    tiles: [_buildGeminiApiSetting(context)],
                  ),
                  SettingsSection(
                    title: Text(
                      LocaleKeys.epub_reader_settings_title.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    tiles: [_buildEpubReaderSetting(context)],
                  ),
                  SettingsSection(
                    title: Text(
                      LocaleKeys.about.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    tiles: <SettingsTile>[
                      _buildBasicSetting(
                        title: LocaleKeys.version.tr(),
                        description: version,
                        iconData: Icons.rocket_launch,
                        context: context,
                      ),
                      _buildURLSetting(
                        title: LocaleKeys.changelog.tr(),
                        description: LocaleKeys.changelog_description.tr(),
                        url: releasesUrl,
                        iconData: Icons.auto_awesome_rounded,
                        context: context,
                      ),
                      _buildURLSetting(
                        title: LocaleKeys.source_code.tr(),
                        description: LocaleKeys.source_code_description.tr(),
                        url: repoUrl,
                        iconData: Icons.code,
                        context: context,
                      ),
                      _buildURLSetting(
                        title: LocaleKeys.licence.tr(),
                        description: licence,
                        url: licenceUrl,
                        iconData: Icons.copyright_rounded,
                        context: context,
                      ),
                    ],
                  ),
                  // NOTE: need to change to to KDebugMode
                  if (true)
                    SettingsSection(
                      title: Text(
                        'Developer',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      tiles: [
                        SettingsTile(
                          title: const Text('Seed Fake Data'),
                          description: const Text('Clear DB & Insert 20 books'),
                          leading: const Icon(Icons.bug_report),
                          onPressed: (context) => _confirmAndSeed(context),
                        ),
                      ],
                    ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Future<void> _openUrl(
    BuildContext context,
    String url, [
    bool mounted = true,
  ]) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$error')));
    }
  }

  SettingsTile _buildTrashSetting(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(
        LocaleKeys.deleted_books.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.delete),
      onPressed: (context) => context.push(Routes.trash),
    );
  }

  SettingsTile _buildDefaultBooksFormat(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.default_books_format.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.book_rounded),
      description: Text(
        // Placeholder, this should come from a state management solution
        LocaleKeys.book_format_paperback.tr(),
        style: const TextStyle(),
      ),
      onPressed: (context) {
        _showDefaultBooksFormatDialog(context);
      },
    );
  }

  //TODO: improve dialog UI
  void _showDefaultBooksFormatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonDialog(
          title: LocaleKeys.default_books_format,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  LocaleKeys.default_books_format.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SettingDialogButton(
                text: LocaleKeys.book_format_paperback.tr(),
                onPressed: () =>
                    _setDefaultBooksFormat(context, BookFormat.paperback),
              ),
              const SizedBox(height: 5),
              SettingDialogButton(
                text: LocaleKeys.book_format_hardcover.tr(),
                onPressed: () =>
                    _setDefaultBooksFormat(context, BookFormat.hardcover),
              ),
              const SizedBox(height: 5),
              SettingDialogButton(
                text: LocaleKeys.book_format_ebook.tr(),
                onPressed: () =>
                    _setDefaultBooksFormat(context, BookFormat.ebook),
              ),
              const SizedBox(height: 5),
              SettingDialogButton(
                text: LocaleKeys.book_format_audiobook.tr(),
                onPressed: () =>
                    _setDefaultBooksFormat(context, BookFormat.audiobook),
              ),
            ],
          ),
        );
      },
    );
  }

  void _setDefaultBooksFormat(BuildContext context, BookFormat bookFormat) {
    context.read<DefaultBookFormatCubit>().setBookFormat(bookFormat);
    Navigator.of(context).pop();
  }

  SettingsTile _buildLanguageSetting(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.language.tr(),
        style: const TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.public),
      description: Text(_getLanguageName(context.locale)),
      onPressed: (context) {
        _showLanguageDialog(context);
      },
    );
  }

  String _getLanguageName(Locale locale) {
    if (locale.languageCode == 'vi') return 'Tiếng Việt';
    return 'English';
  }

  void _showLanguageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: context.colorScheme.surface,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                LocaleKeys.select_language.tr(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: supportedLocales.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1, indent: 16, endIndent: 16),
                  itemBuilder: (context, index) {
                    final language = supportedLocales[index];
                    final isSelected = context.locale == language.locale;

                    return ListTile(
                      leading: SvgPicture.asset(
                        language.flagPath,
                        width: 30,
                        height: 20,
                      ),
                      title: Text(
                        language.fullName,
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: isSelected
                          ? Icon(
                              Icons.check,
                              color: context.colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        context.setLocale(language.locale);
                        context.pop();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  //TODO: change tab order setting -> book list order
  SettingsTile _buildTabOrderSetting(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(LocaleKeys.tabs_order.tr(), style: TextStyle(fontSize: 16)),
      leading: const FaIcon(FontAwesomeIcons.tableColumns),
      onPressed: (context) => context.push(Routes.settingBookListOrder),
    );
  }

  SettingsTile _buildTagManagement(BuildContext context) {
    return SettingsTile.navigation(
      title: const Text('Manage Tags', style: TextStyle(fontSize: 16)),
      leading: const Icon(Icons.label_rounded),
      description: const Text('View and organize all tags'),
      onPressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TagManagementScreen()),
        );
      },
    );
  }

  SettingsTile _buildDownloadMissingCovers(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(
        LocaleKeys.download_missing_covers.tr(),
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.image),
      onPressed: (context) => context.push(Routes.settingDownLoadMissingCover),
    );
  }

  SettingsTile _buildBackupRestoreSetting(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(
        LocaleKeys.backup_and_restore.tr(),
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.settings_backup_restore_rounded),
      onPressed: (context) => context.push(Routes.settingBackupRestore),
    );
  }

  SettingsTile _buildGeminiApiSetting(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(
        LocaleKeys.ai_api_key_setting_config.tr(),
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.psychology_outlined),
      onPressed: (context) => context.push(Routes.settingAiApi),
    );
  }

  SettingsTile _buildAppearanceSetting(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(LocaleKeys.apperance.tr(), style: TextStyle(fontSize: 16)),
      leading: const Icon(Icons.palette),
      onPressed: (context) => context.push(Routes.settingAppearance),
    );
  }

  SettingsTile _buildEpubReaderSetting(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(
        LocaleKeys.epub_reader_settings_title.tr(),
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.book),
      onPressed: (context) => context.push(Routes.settingEpubReader),
    );
  }

  SettingsTile _buildBasicSetting({
    required String title,
    String? description,
    required IconData iconData,
    required BuildContext context,
  }) {
    return SettingsTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      description: description != null ? Text(description) : null,
      leading: Icon(iconData),
    );
  }

  SettingsTile _buildURLSetting({
    required String title,
    String? description,
    String? url,
    IconData? iconData,
    required BuildContext context,
  }) {
    return SettingsTile.navigation(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      leading: (iconData == null) ? null : Icon(iconData),
      description: (description != null)
          ? Text(description, style: const TextStyle())
          : null,
      onPressed: (_) {
        if (url == null) return;

        _openUrl(context, url);
      },
    );
  }

  Future<void> _confirmAndSeed(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Seed Fake Data'),
          content: const Text(
            'WARNING: This will DELETE ALL existing data and replace it with fake data.\n\nAre you sure?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'SEED NOW',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      try {
        // Show loading indicator
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const Center(child: CircularProgressIndicator()),
        );

        final dbService = getIt<DatabaseService>();
        final db = await dbService.database;
        await DbSeeder(db).seed(count: 20);

        await getIt<BookRepository>().refresh();

        if (context.mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Database seeded successfully! Please restart app or pull to refresh.',
              ),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error seeding: $e')));
        }
      }
    }
  }
}
