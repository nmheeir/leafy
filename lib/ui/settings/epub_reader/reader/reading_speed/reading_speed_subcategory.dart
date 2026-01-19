import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
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
                    "TTS Speed",
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
            const Divider(indent: 16, endIndent: 16, height: 32),

            // Highlight Words
            SwitchListTile(
              title: const Text("Highlight Words"),
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
                      title: "Highlight Thickness",
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
              title: const Text("Perception Expander"),
              subtitle: const Text("Expand your peripheral vision"),
              value: state.perceptionExpander,
              onChanged: (value) => context
                  .read<EpubReaderSettingCubit>()
                  .togglePerceptionExpander(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: state.perceptionExpander
                  ? Column(
                      children: [
                        SliderListTile(
                          title: "Line Side Margin",
                          value: state.lineSideMargin,
                          min: 0.0,
                          max: 24.0,
                          divisions: 24,
                          label: "${state.lineSideMargin.toInt()} pt",
                          onChanged: (val) => context
                              .read<EpubReaderSettingCubit>()
                              .updateLineSideMargin(val),
                        ),
                        SliderListTile(
                          title: "Line Side Thickness",
                          value: state.lineSideThickness,
                          min: 0.0,
                          max: 12.0,
                          divisions: 12,
                          label: "${state.lineSideThickness.toInt()} pt",
                          onChanged: (val) => context
                              .read<EpubReaderSettingCubit>()
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
                "Slow",
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                "Fast",
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
