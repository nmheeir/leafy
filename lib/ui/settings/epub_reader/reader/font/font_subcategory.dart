import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/font_thickness.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/ui/common/slider_list_tile.dart';

class FontSubcategory extends StatelessWidget {
  const FontSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(title: "Typography"),
            _FontChoiceOption(selectedFont: state.fontFamily),
            const Divider(indent: 16, endIndent: 16, height: 32),
            _FontSizeOption(fontSize: state.fontSize),
            const Divider(indent: 16, endIndent: 16, height: 32),
            _FontThicknessOption(selectedThickness: state.fontThickness),
            const Divider(indent: 16, endIndent: 16, height: 32),
            _FontStyleOption(fontStyle: state.fontStyle),
            const Divider(indent: 16, endIndent: 16, height: 32),
            _LetterSpacingOption(spacing: state.letterSpacing),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _FontChoiceOption extends StatelessWidget {
  final String selectedFont;
  const _FontChoiceOption({required this.selectedFont});

  @override
  Widget build(BuildContext context) {
    final List<String> fonts = [
      "Serif",
      "Sans-serif",
      "Monospace",
      "Nunito",
      "Literata",
      "Montserrat",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text("Font Family", style: context.textTheme.labelLarge),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...fonts.map((font) {
                final isSelected = selectedFont == font;
                return ChoiceChip(
                  label: Text(font),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      context.read<EpubReaderSettingCubit>().updateFontFamily(
                        font,
                      );
                    }
                  },
                  selectedColor: context.colorScheme.secondaryContainer,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? context.colorScheme.primary
                        : context.colorScheme.onSurface,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                );
              }),
              ActionChip(
                avatar: const Icon(Icons.upload_file, size: 18),
                label: const Text("Upload Font"),
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['ttf', 'otf'],
                      );

                  if (result != null && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Selected: ${result.files.single.name}"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FontSizeOption extends StatelessWidget {
  final double fontSize;
  const _FontSizeOption({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: "Font Size",
      value: fontSize,
      min: 10.0,
      max: 35.0,
      divisions: 25,
      label: "${fontSize.toInt()} pt",
      onChanged: (value) =>
          context.read<EpubReaderSettingCubit>().updateFontSize(value),
    );
  }
}

class _FontThicknessOption extends StatelessWidget {
  final FontThickness selectedThickness;
  const _FontThicknessOption({required this.selectedThickness});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text("Font Thickness", style: context.textTheme.labelLarge),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            // runSpacing: 8,
            children: [
              ...FontThickness.values.map((thickness) {
                final isSelected = selectedThickness == thickness;
                return ChoiceChip(
                  label: Text(thickness.name.capitalize()),
                  selected: isSelected,
                  selectedColor: context.colorScheme.secondaryContainer,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? context.colorScheme.primary
                        : context.colorScheme.onSurface,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      context
                          .read<EpubReaderSettingCubit>()
                          .updateFontThickness(thickness);
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

class _FontStyleOption extends StatelessWidget {
  final FontStyle fontStyle;
  const _FontStyleOption({required this.fontStyle});

  @override
  Widget build(BuildContext context) {
    final isItalic = fontStyle == FontStyle.italic;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Font Style", style: context.textTheme.bodyMedium),
          ToggleButtons(
            isSelected: [!isItalic, isItalic],
            onPressed: (index) {
              final newStyle = index == 0 ? FontStyle.normal : FontStyle.italic;
              context.read<EpubReaderSettingCubit>().updateFontStyle(newStyle);
            },
            borderRadius: BorderRadius.circular(8),
            constraints: const BoxConstraints(minWidth: 80, minHeight: 40),
            children: const [
              Text("Normal"),
              Text("Italic", style: TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
        ],
      ),
    );
  }
}

class _LetterSpacingOption extends StatelessWidget {
  final double spacing;
  const _LetterSpacingOption({required this.spacing});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: "Letter Spacing",
      value: spacing,
      min: -8.0,
      max: 16.0,
      divisions: 48, // 0.5 increments
      label: spacing.toStringAsFixed(1),
      onChanged: (value) =>
          context.read<EpubReaderSettingCubit>().updateLetterSpacing(value),
    );
  }
}
