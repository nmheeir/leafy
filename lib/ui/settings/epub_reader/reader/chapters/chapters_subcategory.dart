import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class ChaptersSubcategory extends StatelessWidget {
  const ChaptersSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Chapters",
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const _ChapterToggle(title: "Show Chapter Header", initialValue: true),
        const Divider(indent: 16, endIndent: 16, height: 1),
        const _ChapterToggle(title: "Show Chapter Footer", initialValue: false),
        const Divider(indent: 16, endIndent: 16, height: 1),
        const _ChapterToggle(
          title: "Show Chapter Dividers",
          initialValue: true,
        ),
      ],
    );
  }
}

class _ChapterToggle extends StatefulWidget {
  final String title;
  final bool initialValue;

  const _ChapterToggle({required this.title, required this.initialValue});

  @override
  State<_ChapterToggle> createState() => _ChapterToggleState();
}

class _ChapterToggleState extends State<_ChapterToggle> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      value: _value,
      onChanged: (value) => setState(() => _value = value),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
