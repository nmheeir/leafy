import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class TextSubcategory extends StatelessWidget {
  const TextSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
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
        const _TextAlignSelector(),
        const Divider(indent: 16, endIndent: 16, height: 32),
        const _LineHeightSlider(),
        const Divider(indent: 16, endIndent: 16, height: 32),
        const _ParagraphSpacingSlider(),
        const Divider(indent: 16, endIndent: 16, height: 32),
        const _ParagraphIndentationSlider(),
      ],
    );
  }
}

class _TextAlignSelector extends StatefulWidget {
  const _TextAlignSelector();

  @override
  State<_TextAlignSelector> createState() => _TextAlignSelectorState();
}

class _TextAlignSelectorState extends State<_TextAlignSelector> {
  int _selectedIndex = 2; // 0: Left, 1: Center, 2: Justify

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text("Alignment", style: context.textTheme.labelLarge),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 0, icon: Icon(Icons.format_align_left)),
              ButtonSegment(value: 1, icon: Icon(Icons.format_align_center)),
              ButtonSegment(value: 2, icon: Icon(Icons.format_align_justify)),
            ],
            selected: {_selectedIndex},
            onSelectionChanged: (Set<int> newSelection) {
              setState(() {
                _selectedIndex = newSelection.first;
              });
            },
            showSelectedIcon: false,
          ),
        ),
      ],
    );
  }
}

class _LineHeightSlider extends StatefulWidget {
  const _LineHeightSlider();

  @override
  State<_LineHeightSlider> createState() => _LineHeightSliderState();
}

class _LineHeightSliderState extends State<_LineHeightSlider> {
  double _value = 1.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Line Height", style: context.textTheme.labelLarge),
              Text(
                _value.toStringAsFixed(1),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: _value,
          min: 1.0,
          max: 2.5,
          divisions: 15,
          onChanged: (value) => setState(() => _value = value),
        ),
      ],
    );
  }
}

class _ParagraphSpacingSlider extends StatefulWidget {
  const _ParagraphSpacingSlider();

  @override
  State<_ParagraphSpacingSlider> createState() =>
      _ParagraphSpacingSliderState();
}

class _ParagraphSpacingSliderState extends State<_ParagraphSpacingSlider> {
  double _value = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Paragraph Spacing", style: context.textTheme.labelLarge),
              Text(
                "${_value.round()} px",
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: _value,
          min: 0,
          max: 30,
          divisions: 6,
          onChanged: (value) => setState(() => _value = value),
        ),
      ],
    );
  }
}

class _ParagraphIndentationSlider extends StatefulWidget {
  const _ParagraphIndentationSlider();

  @override
  State<_ParagraphIndentationSlider> createState() =>
      _ParagraphIndentationSliderState();
}

class _ParagraphIndentationSliderState
    extends State<_ParagraphIndentationSlider> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Indentation", style: context.textTheme.labelLarge),
              Text(
                "${_value.round()} px",
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: _value,
          min: 0,
          max: 50,
          divisions: 10,
          onChanged: (value) => setState(() => _value = value),
        ),
      ],
    );
  }
}
