import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class ProgressSubcategory extends StatelessWidget {
  const ProgressSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Reading Progress",
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const _ProgressOption(
          label: "Current Page / Total Pages",
          initialValue: true,
        ),
        const Divider(indent: 16, endIndent: 16, height: 1),
        const _ProgressOption(label: "Percentage (%)", initialValue: true),
        const Divider(indent: 16, endIndent: 16, height: 1),
        const _ProgressOption(label: "Chapter Name", initialValue: false),
        const Divider(indent: 16, endIndent: 16, height: 1),
        const _ProgressOption(
          label: "Estimated Content Left",
          initialValue: true,
        ),
      ],
    );
  }
}

class _ProgressOption extends StatefulWidget {
  final String label;
  final bool initialValue;

  const _ProgressOption({required this.label, required this.initialValue});

  @override
  State<_ProgressOption> createState() => _ProgressOptionState();
}

class _ProgressOptionState extends State<_ProgressOption> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.label, style: context.textTheme.bodyMedium),
      value: _isSelected,
      onChanged: (value) => setState(() => _isSelected = value ?? false),
      activeColor: context.colorScheme.primary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      visualDensity: VisualDensity.compact,
    );
  }
}
