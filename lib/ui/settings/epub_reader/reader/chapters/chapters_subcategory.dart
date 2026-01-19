import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';

class ChaptersSubcategory extends StatelessWidget {
  const ChaptersSubcategory({super.key});

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
                "Chapters",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _ChapterAlignmentSelector(currentAlignment: state.chapterAlignment),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

class _ChapterAlignmentSelector extends StatelessWidget {
  final TextAlign currentAlignment;
  const _ChapterAlignmentSelector({required this.currentAlignment});

  @override
  Widget build(BuildContext context) {
    final List<TextAlign> alignments = [
      TextAlign.start,
      TextAlign.justify,
      TextAlign.center,
      TextAlign.end,
    ];

    final List<IconData> icons = [
      Icons.align_horizontal_left,
      Icons.format_align_justify,
      Icons.align_horizontal_center,
      Icons.align_horizontal_right,
    ];

    final List<bool> isSelected = alignments
        .map((align) => align == currentAlignment)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Chapter Title Alignment",
            style: context.textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  context.read<EpubReaderSettingCubit>().updateChapterAlignment(
                    alignments[index],
                  );
                },
                borderRadius: BorderRadius.circular(8),
                constraints: BoxConstraints(
                  minWidth: (constraints.maxWidth - 24) / 4,
                  minHeight: 40,
                ),
                children: icons.map((icon) => Icon(icon)).toList(),
              );
            },
          ),
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
