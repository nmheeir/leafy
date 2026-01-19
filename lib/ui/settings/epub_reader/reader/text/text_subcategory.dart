import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/ui/common/slider_list_tile.dart';

class TextSubcategory extends StatelessWidget {
  const TextSubcategory({super.key});

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
                "Text Layout",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _TextAlignSelector(currentAlignment: state.textAlignment),
            const Divider(indent: 16, endIndent: 16, height: 32),
            _LineHeightSlider(lineHeight: state.lineHeight),
            const Divider(indent: 16, endIndent: 16, height: 32),
            _ParagraphSpacingSlider(spacing: state.paragraphSpacing),
            const Divider(indent: 16, endIndent: 16, height: 32),
            _IndentSlider(indent: state.indent),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

class _TextAlignSelector extends StatelessWidget {
  final TextAlign currentAlignment;
  const _TextAlignSelector({required this.currentAlignment});

  @override
  Widget build(BuildContext context) {
    final List<TextAlign> alignments = [
      TextAlign.start,
      TextAlign.justify,
      TextAlign.center,
      TextAlign.end,
    ];

    final List<IconData> icons = [
      Icons.format_align_left,
      Icons.format_align_justify,
      Icons.format_align_center,
      Icons.format_align_right,
    ];

    final List<bool> isSelected = alignments
        .map((align) => align == currentAlignment)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text("Alignment", style: context.textTheme.labelLarge),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  context.read<EpubReaderSettingCubit>().updateTextAlignment(
                    alignments[index],
                  );
                },
                borderRadius: BorderRadius.circular(8),
                constraints: BoxConstraints(
                  minWidth: (constraints.maxWidth - 24) / 4,
                  minHeight: 40,
                ),
                children: icons.map((icon) => Icon(icon)).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LineHeightSlider extends StatelessWidget {
  final double lineHeight;
  const _LineHeightSlider({required this.lineHeight});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: "Line Height",
      value: lineHeight,
      min: 1.0,
      max: 3.0,
      divisions: 20, // 0.1 increments
      label: lineHeight.toStringAsFixed(1),
      onChanged: (value) =>
          context.read<EpubReaderSettingCubit>().updateLineHeight(value),
    );
  }
}

class _ParagraphSpacingSlider extends StatelessWidget {
  final double spacing;
  const _ParagraphSpacingSlider({required this.spacing});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: "Paragraph Spacing",
      value: spacing,
      min: 0.0,
      max: 24.0,
      divisions: 24, // 1.0 increments
      label: "${spacing.toInt()} pt",
      onChanged: (value) =>
          context.read<EpubReaderSettingCubit>().updateParagraphSpacing(value),
    );
  }
}

class _IndentSlider extends StatelessWidget {
  final double indent;
  const _IndentSlider({required this.indent});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: "Indentation",
      value: indent,
      min: 0.0,
      max: 24.0,
      divisions: 24, // 1.0 increments
      label: "${indent.toInt()} pt",
      onChanged: (value) =>
          context.read<EpubReaderSettingCubit>().updateIndent(value),
    );
  }
}
