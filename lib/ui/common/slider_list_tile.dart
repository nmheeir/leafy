import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

// TODO: Sửa lại widget này cho giống với switch list tile của android
class SliderListTile extends StatelessWidget {
  final String title;
  final String? label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const SliderListTile({
    super.key,
    required this.title,
    this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: context.textTheme.bodyMedium),
              Text(
                label ?? value.toStringAsFixed(1),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
