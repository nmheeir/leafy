import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class PaddingSubcategory extends StatelessWidget {
  const PaddingSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Layout",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Requires re-layout",
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.tertiary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const _MarginSlider(),
      ],
    );
  }
}

class _MarginSlider extends StatefulWidget {
  const _MarginSlider();

  @override
  State<_MarginSlider> createState() => _MarginSliderState();
}

class _MarginSliderState extends State<_MarginSlider> {
  double _value = 20.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Side Margins",
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Slider(
          value: _value,
          min: 0,
          max: 60,
          divisions: 12,
          label: "${_value.round()} px",
          onChanged: (value) => setState(() => _value = value),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Compact", style: context.textTheme.labelSmall),
              Text("Balanced", style: context.textTheme.labelSmall),
              Text("Wide", style: context.textTheme.labelSmall),
            ],
          ),
        ),
      ],
    );
  }
}
