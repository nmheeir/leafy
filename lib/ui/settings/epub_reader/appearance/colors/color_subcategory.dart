import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class ColorSubcategory extends StatelessWidget {
  const ColorSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
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
        const _ThemeSelector(),
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
        const _CustomColorPicker(
          label: "Background Color",
          color: Colors.white,
        ),
        const _CustomColorPicker(label: "Text Color", color: Colors.black87),
        const _CustomColorPicker(
          label: "Selection Color",
          color: Colors.amberAccent,
        ),
      ],
    );
  }
}

class _ThemeSelector extends StatefulWidget {
  const _ThemeSelector();

  @override
  State<_ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<_ThemeSelector> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _themes = [
    {'name': 'Light', 'color': Colors.white, 'textColor': Colors.black87},
    {
      'name': 'Sepia',
      'color': const Color(0xFFF4ECD8),
      'textColor': const Color(0xFF5F4B32),
    },
    {
      'name': 'Dark',
      'color': const Color(0xFF1E1E1E),
      'textColor': const Color(0xFFE0E0E0),
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
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: theme['color'] as Color,
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
                      color: theme['textColor'] as Color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    theme['name'] as String,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: theme['textColor'] as Color,
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

  const _CustomColorPicker({required this.label, required this.color});

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
      onTap: () {
        // Show color picker dialog
      },
    );
  }
}
