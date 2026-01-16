import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class ReadingModeSubcategory extends StatelessWidget {
  const ReadingModeSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
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
        const _ModeSelector(),
      ],
    );
  }
}

class _ModeSelector extends StatefulWidget {
  const _ModeSelector();

  @override
  State<_ModeSelector> createState() => _ModeSelectorState();
}

class _ModeSelectorState extends State<_ModeSelector> {
  int _selectedIndex = 0; // 0: Pagination, 1: Scroll

  final List<Map<String, dynamic>> _modes = [
    {'title': 'Pagination', 'icon': Icons.auto_stories},
    {'title': 'Scroll', 'icon': Icons.view_stream},
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
                padding: const EdgeInsets.symmetric(vertical: 16),
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
                      size: 28,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      mode['title'] as String,
                      style: context.textTheme.labelLarge?.copyWith(
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
