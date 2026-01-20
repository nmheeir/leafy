import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';

class MiscSubcategory extends StatelessWidget {
  const MiscSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                LocaleKeys.epub_reader_misc_title.tr(),
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SwitchListTile(
              title: Text(
                LocaleKeys.epub_reader_misc_volume_key_navigation.tr(),
              ),
              subtitle: Text(
                LocaleKeys.epub_reader_misc_volume_key_navigation_description
                    .tr(),
              ),
              value: state.volumeKeyNavigation,
              secondary: Icon(
                Icons.volume_up_outlined,
                color: context.colorScheme.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onChanged: (value) =>
                  context.epubReaderSettingCubit.toggleVolumeKeyNavigation(),
            ),
            SwitchListTile(
              title: Text(LocaleKeys.epub_reader_misc_keep_screen_on.tr()),
              subtitle: Text(
                LocaleKeys.epub_reader_misc_keep_screen_on_description.tr(),
              ),
              value: state.keepScreenOn,
              secondary: Icon(
                Icons.screen_lock_portrait_outlined,
                color: context.colorScheme.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onChanged: (value) =>
                  context.epubReaderSettingCubit.toggleKeepScreenOn(),
            ),
            SwitchListTile(
              title: Text(
                LocaleKeys.epub_reader_misc_double_tap_translate.tr(),
              ),
              subtitle: Text(
                LocaleKeys.epub_reader_misc_double_tap_translate_description
                    .tr(),
              ),
              value: state.doubleTapTranslate,
              secondary: Icon(
                Icons.translate_outlined,
                color: context.colorScheme.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onChanged: (value) =>
                  context.epubReaderSettingCubit.toggleDoubleTapTranslate(),
            ),
          ],
        );
      },
    );
  }
}
