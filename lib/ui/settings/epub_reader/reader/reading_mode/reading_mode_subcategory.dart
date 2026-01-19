import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/horizontal_gesture_mode.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/ui/common/slider_list_tile.dart';

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
                            title: "Scroll Fraction",
                            value: state.scrollFraction,
                            min: 0.1,
                            max: 1.0,
                            divisions: 9,
                            onChanged: (val) => context
                                .read<EpubReaderSettingCubit>()
                                .updateScrollFraction(val),
                          ),
                          SliderListTile(
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
