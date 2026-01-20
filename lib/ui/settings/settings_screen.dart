import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

const String releasesUrl = 'https://github.com/phucnt63/leafy/releases';
const String repoUrl = 'https://github.com/phucnt63/leafy';
const String licence = 'MIT License';
const String licenceUrl = 'https://github.com/phucnt63/leafy/blob/main/LICENSE';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
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
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    tiles: <SettingsTile>[
                      _buildTrashSetting(context),
                      _buildDefaultBooksFormat(context),
                      _buildTabOrderSetting(context),
                      _buildDefaultTags(context),
                      _buildDownloadMissingCovers(context),
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
                      LocaleKeys.epub_reader_title.tr(),
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

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          title: LocaleKeys.language.tr(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  LocaleKeys.select_language.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        // children: _buildLanguageButtons(context, state),
                      ),
                    ),
                  ),
                ),
              ),
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

  SettingsTile _buildDefaultTags(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(
        LocaleKeys.set_default_tags.tr(),
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(FontAwesomeIcons.tags),
      onPressed: (context) {
        context.push(Routes.settingDefautlBookTag);
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
        LocaleKeys.epub_reader_title.tr(),
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.book),
      onPressed: (context) => context.push(Routes.settingEpubReader),
    );
  }

  SettingsTile _buildLanguageSetting(BuildContext context) {
    return SettingsTile(
      title: Text(LocaleKeys.language.tr(), style: TextStyle(fontSize: 16)),
      leading: const Icon(Icons.public),
      onPressed: (context) {
        _showLanguageDialog(context);
      },
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
}
