import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/common/slider_list_tile.dart';

class ReadingSpeedSubcategory extends StatelessWidget {
  const ReadingSpeedSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.epub_reader_settings_reading_speed_title.tr(),
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.speed, size: 20),
                ],
              ),
            ),
            const _SpeedSlider(),
            const SizedBox(height: 32),

            // Highlight Words
            SwitchListTile(
              title: Text(
                LocaleKeys.epub_reader_settings_reading_speed_highlight_words
                    .tr(),
              ),
              subtitle: const Text("Highlight words as they are spoken"),
              value: state.highlightWords,
              onChanged: (value) =>
                  context.read<EpubReaderSettingCubit>().toggleHighlightWords(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: state.highlightWords
                  ? SliderListTile(
                      title: LocaleKeys
                          .epub_reader_settings_reading_speed_highlight_thickness
                          .tr(),
                      value: state.highlightThickness,
                      min: 1.0,
                      max: 3.0,
                      divisions: 2,
                      label: "${state.highlightThickness.toInt()} pt",
                      onChanged: (val) => context
                          .read<EpubReaderSettingCubit>()
                          .updateHighlightThickness(val),
                    )
                  : const SizedBox.shrink(),
            ),

            const SizedBox(height: 8),

            // Perception Expander
            SwitchListTile(
              title: Text(
                LocaleKeys
                    .epub_reader_settings_reading_speed_perception_expander
                    .tr(),
              ),
              subtitle: Text(
                LocaleKeys
                    .epub_reader_settings_reading_speed_perception_expander_description
                    .tr(),
              ),
              value: state.perceptionExpander,
              onChanged: (value) =>
                  context.epubReaderSettingCubit.togglePerceptionExpander(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: state.perceptionExpander
                  ? Column(
                      children: [
                        SliderListTile(
                          title: LocaleKeys
                              .epub_reader_settings_reading_speed_line_side_margin
                              .tr(),
                          value: state.lineSideMargin,
                          min: 0.0,
                          max: 24.0,
                          divisions: 24,
                          label: "${state.lineSideMargin.toInt()} pt",
                          onChanged: (val) => context.epubReaderSettingCubit
                              .updateLineSideMargin(val),
                        ),
                        SliderListTile(
                          title: LocaleKeys
                              .epub_reader_settings_reading_speed_line_side_thickness
                              .tr(),
                          value: state.lineSideThickness,
                          min: 0.0,
                          max: 12.0,
                          divisions: 12,
                          label: "${state.lineSideThickness.toInt()} pt",
                          onChanged: (val) => context.epubReaderSettingCubit
                              .updateLineSideThickness(val),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}

class _SpeedSlider extends StatefulWidget {
  const _SpeedSlider();

  @override
  State<_SpeedSlider> createState() => _SpeedSliderState();
}

class _SpeedSliderState extends State<_SpeedSlider> {
  double _speed = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_speed}x",
              style: context.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
        Slider(
          value: _speed,
          min: 0.5,
          max: 3.0,
          divisions: 10,
          label: "${_speed}x",
          onChanged: (value) => setState(() => _speed = value),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.epub_reader_settings_reading_speed_slow.tr(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                LocaleKeys.epub_reader_settings_reading_speed_fast.tr(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
