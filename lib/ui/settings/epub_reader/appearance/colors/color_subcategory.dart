import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';

class ColorSubcategory extends StatelessWidget {
  const ColorSubcategory({super.key});

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
                "Themes",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _ThemeSelector(
              currentPreset: state.themePreset,
              onThemeSelected: (name, bgColor, textColor) {
                context.epubReaderSettingCubit.updateThemePreset(
                  name,
                  backgroundColor: bgColor.toARGB32(),
                  textColor: textColor.toARGB32(),
                );
              },
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Custom Colors",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _CustomColorPicker(
              label: "Background Color",
              color: Color(state.backgroundColor),
              onColorChanged: (color) {
                context.epubReaderSettingCubit.updateBackgroundColor(
                  color.toARGB32(),
                );
              },
            ),
            _CustomColorPicker(
              label: "Text Color",
              color: Color(state.textColor),
              onColorChanged: (color) {
                context.epubReaderSettingCubit.updateTextColor(
                  color.toARGB32(),
                );
              },
            ),
            _CustomColorPicker(
              label: "Selection Color",
              color: Color(state.selectionColor),
              onColorChanged: (color) {
                context.epubReaderSettingCubit.updateSelectionColor(
                  color.toARGB32(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  final String currentPreset;
  final Function(String name, Color bgColor, Color textColor) onThemeSelected;

  const _ThemeSelector({
    required this.currentPreset,
    required this.onThemeSelected,
  });

  static const List<Map<String, dynamic>> _themes = [
    {'name': 'Light', 'color': Colors.white, 'textColor': Colors.black87},
    {
      'name': 'Sepia',
      'color': Color(0xFFF4ECD8),
      'textColor': Color(0xFF5F4B32),
    },
    {
      'name': 'Dark',
      'color': Color(0xFF1E1E1E),
      'textColor': Color(0xFFE0E0E0),
    },
    {'name': 'Black', 'color': Colors.black, 'textColor': Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: _themes.length,
        itemBuilder: (context, index) {
          final theme = _themes[index];
          final name = theme['name'] as String;
          final color = theme['color'] as Color;
          final textColor = theme['textColor'] as Color;
          final isSelected = currentPreset == name;

          return GestureDetector(
            onTap: () => onThemeSelected(name, color, textColor),
            child: Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? context.colorScheme.primary
                      : (context.colorScheme.outlineVariant),
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: context.colorScheme.primary.withValues(
                            alpha: 0.2,
                          ),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aa",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CustomColorPicker extends StatelessWidget {
  final String label;
  final Color color;
  final ValueChanged<Color> onColorChanged;

  const _CustomColorPicker({
    required this.label,
    required this.color,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: context.textTheme.bodyMedium),
      trailing: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: context.colorScheme.outlineVariant),
        ),
      ),
      onTap: () async {
        final Color newColor = await showColorPickerDialog(
          context,
          color,
          title: Text(label, style: context.textTheme.titleLarge),
          width: 40,
          height: 40,
          spacing: 0,
          runSpacing: 0,
          borderRadius: 0,
          wheelDiameter: 165,
          enableOpacity: false,
          showColorCode: true,
          colorCodeHasColor: true,
          pickersEnabled: <ColorPickerType, bool>{ColorPickerType.wheel: true},
          actionButtons: const ColorPickerActionButtons(
            dialogActionButtons: true,
          ),
          constraints: const BoxConstraints(minHeight: 480, minWidth: 320),
        );
        onColorChanged(newColor);
      },
    );
  }
}
