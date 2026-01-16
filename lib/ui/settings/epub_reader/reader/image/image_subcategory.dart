import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class ImageSubcategory extends StatelessWidget {
  const ImageSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Images",
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const _ImageModeSelector(),
      ],
    );
  }
}

class _ImageModeSelector extends StatefulWidget {
  const _ImageModeSelector();

  @override
  State<_ImageModeSelector> createState() => _ImageModeSelectorState();
}

class _ImageModeSelectorState extends State<_ImageModeSelector> {
  int _selectedIndex = 0; // 0: Color, 1: Grayscale, 2: Hide

  final List<Map<String, dynamic>> _modes = [
    {'label': 'Color', 'icon': Icons.image},
    {'label': 'Grayscale', 'icon': Icons.filter_b_and_w},
    {'label': 'Hide', 'icon': Icons.hide_image_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(_modes.length, (index) {
          final mode = _modes[index];
          final isSelected = _selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colorScheme.primaryContainer
                      : context.colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.3,
                        ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? context.colorScheme.primary
                        : Colors.transparent,
                    width: isSelected ? 1.5 : 0,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      mode['icon'] as IconData,
                      color: isSelected
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurfaceVariant,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      mode['label'] as String,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: isSelected
                            ? context.colorScheme.primary
                            : context.colorScheme.onSurfaceVariant,
                        fontWeight: isSelected ? FontWeight.bold : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
