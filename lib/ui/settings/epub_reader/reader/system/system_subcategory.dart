import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/screen_orientation.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';

class SystemSubcategory extends StatelessWidget {
  const SystemSubcategory({super.key});

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
                LocaleKeys.epub_reader_settings_system_title.tr(),
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SwitchListTile(
              title: Text(
                LocaleKeys.epub_reader_settings_system_custom_brightness.tr(),
              ),
              value: state.customBrightnessEnabled,
              onChanged: (value) {
                context.epubReaderSettingCubit.toggleCustomBrightness();
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: state.customBrightnessEnabled
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Icon(
                            Icons.brightness_low,
                            size: 20,
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                          Expanded(
                            child: Slider(
                              value: state.customBrightness.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              onChanged: (value) => context
                                  .epubReaderSettingCubit
                                  .updateCustomBrightness(value.toInt()),
                            ),
                          ),
                          Icon(
                            Icons.brightness_high,
                            size: 20,
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.epub_reader_settings_system_screen_orientation
                        .tr(),
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ScreenOrientation.values.map((orientation) {
                      return ChoiceChip(
                        label: Text(orientation.label),
                        selected: state.screenOrientation == orientation,
                        onSelected: (selected) {
                          if (selected) {
                            context.epubReaderSettingCubit
                                .updateScreenOrientation(orientation);
                          }
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
