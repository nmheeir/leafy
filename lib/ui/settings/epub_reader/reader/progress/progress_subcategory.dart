import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/progress_count_type.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';

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
                LocaleKeys.epub_reader_settings_progress_title.tr(),
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _ProgressCountSelector(currentType: state.progressCountType),
            const SizedBox(height: 16),
            SwitchListTile(
              title: Text(
                LocaleKeys.epub_reader_settings_progress_show_bar.tr(),
              ),
              value: state.showProgressBar,
              onChanged: (_) {
                context.epubReaderSettingCubit.toggleShowProgressBar();
              },
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: state.showProgressBar
                  ? Column(
                      children: [
                        const SizedBox(height: 16),
                        _ProgressBarColorPicker(
                          color: Color(state.progressBarColor),
                        ),
                        const SizedBox(height: 16),
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

    final List<String> labels = [
      LocaleKeys.epub_reader_settings_progress_count_percentage.tr(),
      LocaleKeys.epub_reader_settings_progress_count_quantity.tr(),
    ];
    final List<bool> isSelected = types
        .map((type) => type == currentType)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            LocaleKeys.epub_reader_settings_progress_count.tr(),
            style: context.textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  context.epubReaderSettingCubit.updateProgressCountType(
                    types[index],
                  );
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
      title: Text(LocaleKeys.epub_reader_settings_progress_bar_color.tr()),
      trailing: GestureDetector(
        onTap: () async {
          final Color newColor = await showColorPickerDialog(
            context,
            color,
            title: Text(
              LocaleKeys.epub_reader_settings_progress_bar_color.tr(),
              style: context.textTheme.titleLarge,
            ),
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
            context.epubReaderSettingCubit.updateProgressBarColor(
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
