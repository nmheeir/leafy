import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/ui/settings/epub_reader/reader/chapters/chapters_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/image/image_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/layout/layout_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/misc/misc_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/progress/progress_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/reading_mode/reading_mode_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/reading_speed/reading_speed_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/system/system_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/text/text_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/translator/translator_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/typography/typography_subcategory.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingEpubReaderScreen extends StatelessWidget {
  const SettingEpubReaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      const SystemSubcategory(),
      const ReadingModeSubcategory(),
      const TypographySubcategory(),
      const TextSubcategory(),
      const ImageSubcategory(),
      const ChaptersSubcategory(),
      const LayoutSubcategory(),
      const ProgressSubcategory(),
      const ReadingSpeedSubcategory(),
      const TranslatorSubcategory(),
      const MiscSubcategory(),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.epub_reader_settings_title.tr())),
      body: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground:
              Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : context.colorScheme.surfaceContainerLowest,
        ),
        lightTheme: SettingsThemeData(
          settingsListBackground: context.colorScheme.surfaceContainerLowest,
        ),
        sections: [
          for (int i = 0; i < sections.length; i++) ...[
            CustomSettingsSection(child: sections[i]),
            if (i < sections.length - 1)
              const CustomSettingsSection(
                child: Divider(height: 32, thickness: 1),
              ),
          ],
        ],
      ),
    );
  }
}
