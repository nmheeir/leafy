import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/horizontal_gesture_mode.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/common/slider_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';

class ReadingModeSubcategory extends StatelessWidget {
  const ReadingModeSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
      builder: (context, state) {
        final mode = state.horizontalGestureMode;
        final isEnabled = mode != HorizontalGestureMode.off;

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  LocaleKeys.epub_reader_reading_mode_title.tr(),
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // 1. Horizontal Gesture Selection (ChoiceChip)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  LocaleKeys.epub_reader_reading_mode_horizontal_gestures.tr(),
                  style: context.textTheme.labelLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  children: HorizontalGestureMode.values.map((gestureMode) {
                    return ChoiceChip(
                      label: Text(gestureMode.name.capitalize()),
                      selected: mode == gestureMode,
                      onSelected: (selected) {
                        if (selected) {
                          context.epubReaderSettingCubit
                              .updateHorizontalGestureMode(gestureMode);
                        }
                      },
                    );
                  }).toList(),
                ),
              ),

              // 2. Advanced Settings
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: isEnabled
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 16),
                          SliderListTile(
                            title: LocaleKeys
                                .epub_reader_reading_mode_scroll_fraction
                                .tr(),
                            value: state.scrollFraction,
                            min: 0.1,
                            max: 1.0,
                            divisions: 9,
                            onChanged: (val) => context.epubReaderSettingCubit
                                .updateScrollFraction(val),
                          ),
                          SliderListTile(
                            title: LocaleKeys
                                .epub_reader_reading_mode_sensitivity
                                .tr(),
                            value: state.sensitivity,
                            min: 0.5,
                            max: 2.0,
                            divisions: 15,
                            onChanged: (val) => context.epubReaderSettingCubit
                                .updateSensitivity(val),
                          ),
                          SwitchListTile(
                            title: Text(
                              LocaleKeys.epub_reader_reading_mode_pull_animation
                                  .tr(),
                            ),
                            value: state.pullAnimation,
                            onChanged: (_) => context.epubReaderSettingCubit
                                .togglePullAnimation(),
                            secondary: Icon(
                              Icons.animation,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          SwitchListTile(
                            title: Text(
                              LocaleKeys
                                  .epub_reader_reading_mode_visibility_animation
                                  .tr(),
                            ),
                            value: state.visibilityAnimation,
                            onChanged: (_) => context.epubReaderSettingCubit
                                .toggleVisibilityAnimation(),
                            secondary: Icon(
                              Icons.visibility,
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }
}
