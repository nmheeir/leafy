import 'package:flutter/material.dart';

class AppThemeOptionItem extends StatelessWidget {
  const AppThemeOptionItem({
    super.key,
    required this.seedColor,
    required this.themeMode,
    required this.isSelected,
    required this.onTap,
    required this.label,
    this.useMaterialYou = false,
  });

  final Color seedColor;
  final ThemeMode themeMode;
  final bool isSelected;
  final VoidCallback onTap;
  final String label;
  final bool useMaterialYou;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = themeMode == ThemeMode.dark
        ? Brightness.dark
        : Brightness.light;
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    );
    final backgroundColor = colorScheme.surface;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100,
            height: 170,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
                width: 4,
              ),
            ),
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                // Header Mockup
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      // Title Bar
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Check icon if selected
                      if (isSelected)
                        Icon(
                          Icons.check_circle,
                          color: colorScheme.primary,
                          size: 26,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                // Card Mockup
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    height: 80,
                    width: 70,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Bottom Bar Mockup
                Container(
                  width: double.infinity,
                  height: 25,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ), // match parent - 4 padding
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 40, // Reduced from 60 to fit 100 width
                        height: 16,
                        decoration: BoxDecoration(
                          color: colorScheme.onSurfaceVariant,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
