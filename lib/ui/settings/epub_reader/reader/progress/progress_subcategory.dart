import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/progress_count_type.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/ui/common/slider_list_tile.dart';

class ProgressSubcategory extends StatelessWidget {
  const ProgressSubcategory({super.key});

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
                "Reading Progress",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _ProgressCountSelector(currentType: state.progressCountType),
            const Divider(indent: 16, endIndent: 16, height: 32),
            SwitchListTile(
              title: const Text("Show Bottom Progress Bar"),
              value: state.showProgressBar,
              onChanged: (_) {
                context.read<EpubReaderSettingCubit>().toggleShowProgressBar();
              },
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: state.showProgressBar
                  ? Column(
                      children: [
                        const Divider(indent: 16, endIndent: 16, height: 16),
                        _ProgressBarColorPicker(
                          color: Color(state.progressBarColor),
                        ),
                        const Divider(indent: 16, endIndent: 16, height: 16),
                        _ProgressBarHeightSlider(
                          height: state.progressBarHeight,
                        ),
                        const SizedBox(height: 16),
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

class _ProgressCountSelector extends StatelessWidget {
  final ProgressCountType currentType;
  const _ProgressCountSelector({required this.currentType});

  @override
  Widget build(BuildContext context) {
    final List<ProgressCountType> types = [
      ProgressCountType.percentage,
      ProgressCountType.quantity,
    ];

    final List<String> labels = ["Percentage (%)", "Page / Total"];
    final List<bool> isSelected = types
        .map((type) => type == currentType)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text("Progress Count", style: context.textTheme.labelLarge),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  context
                      .read<EpubReaderSettingCubit>()
                      .updateProgressCountType(types[index]);
                },
                borderRadius: BorderRadius.circular(8),
                constraints: BoxConstraints(
                  minWidth: (constraints.maxWidth - 4) / 2,
                  minHeight: 40,
                ),
                children: labels
                    .map(
                      (label) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(label),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProgressBarColorPicker extends StatelessWidget {
  final Color color;
  const _ProgressBarColorPicker({required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Progress Bar Color"),
      trailing: GestureDetector(
        onTap: () async {
          final Color newColor = await showColorPickerDialog(
            context,
            color,
            title: Text('Select Color', style: context.textTheme.titleLarge),
            width: 40,
            height: 40,
            spacing: 0,
            runSpacing: 0,
            borderRadius: 0,
            wheelDiameter: 165,
            enableOpacity: false,
            showColorCode: true,
            colorCodeHasColor: true,
            pickersEnabled: <ColorPickerType, bool>{
              ColorPickerType.wheel: true,
            },
            actionButtons: const ColorPickerActionButtons(
              dialogActionButtons: true,
            ),
            constraints: const BoxConstraints(minHeight: 480, minWidth: 320),
          );
          if (context.mounted) {
            context.read<EpubReaderSettingCubit>().updateProgressBarColor(
              newColor.toARGB32(),
            );
          }
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressBarHeightSlider extends StatelessWidget {
  final double height;
  const _ProgressBarHeightSlider({required this.height});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: "Progress Bar Height",
      value: height,
      min: 1.0,
      max: 24.0,
      divisions: 23, // 1.0 increments roughly
      label: "${height.toInt()} pt",
      onChanged: (value) =>
          context.read<EpubReaderSettingCubit>().updateProgressBarHeight(value),
    );
  }
}
