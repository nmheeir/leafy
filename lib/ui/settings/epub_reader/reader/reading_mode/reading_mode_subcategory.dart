import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/horizontal_gesture_mode.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';

class ReadingModeSubcategory extends StatelessWidget {
  const ReadingModeSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
      builder: (context, state) {
        final mode = state.horizontalGestureMode;
        final isEnabled = mode != HorizontalGestureMode.off;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Reading Mode",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 1. Horizontal Gesture Selection (ChoiceChip)
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
                        context
                            .read<EpubReaderSettingCubit>()
                            .updateHorizontalGestureMode(gestureMode);
                      }
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Advanced Settings
            if (isEnabled) ...[
              _buildSliderTile(
                context: context,
                title: "Scroll Fraction",
                value: state.scrollFraction,
                min: 0.1,
                max: 1.0,
                divisions: 9,
                onChanged: (val) => context
                    .read<EpubReaderSettingCubit>()
                    .updateScrollFraction(val),
              ),
              _buildSliderTile(
                context: context,
                title: "Sensitivity",
                value: state.sensitivity,
                min: 0.5,
                max: 2.0,
                divisions: 15,
                onChanged: (val) => context
                    .read<EpubReaderSettingCubit>()
                    .updateSensitivity(val),
              ),
              SwitchListTile(
                title: const Text("Pull Animation"),
                value: state.pullAnimation,
                onChanged: (_) => context
                    .read<EpubReaderSettingCubit>()
                    .togglePullAnimation(),
                secondary: Icon(
                  Icons.animation,
                  color: context.colorScheme.primary,
                ),
              ),
              SwitchListTile(
                title: const Text("Visibility Animation"),
                value: state.visibilityAnimation,
                onChanged: (_) => context
                    .read<EpubReaderSettingCubit>()
                    .toggleVisibilityAnimation(),
                secondary: Icon(
                  Icons.visibility,
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildSliderTile({
    required BuildContext context,
    required String title,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: context.textTheme.bodyMedium),
              Text(
                value.toStringAsFixed(1),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
