import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/epub_reader/entities/epub_chapter.dart';
import 'package:leafy/domain/epub_reader/entities/epub_image.dart';
import 'package:leafy/domain/epub_reader/entities/img_entry.dart';

class ChapterContentItem extends StatelessWidget {
  final EpubChapter chapter;
  final List<EpubImage> images;
  final int index;

  const ChapterContentItem({
    super.key,
    required this.chapter,
    required this.images,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Logic Chunk Text
    final List<String> paragraphs = chapter.body
        .split('\n\n')
        .where((s) => s.trim().isNotEmpty)
        .toList();

    final textStyle = TextStyle(
      fontSize: 18,
      height: 1.6,
      color: context.colorScheme.onSurface.withValues(alpha: 0.88),
      fontFamily: 'Georgia',
    );

    // Tiêu đề chương (được render ngay đầu mỗi chương)
    final titleWidget = Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: Text(
        chapter.title,
        style: textStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (chapter.title.isNotEmpty) titleWidget,

          ..._renderParagraphs(context, paragraphs, textStyle),
        ],
      ),
    );
  }

  List<Widget> _renderParagraphs(
    BuildContext context,
    List<String> paragraphs,
    TextStyle style,
  ) {
    final List<Widget> widgets = [];
    final StringBuffer textBuffer = StringBuffer();

    for (int i = 0; i < paragraphs.length; i++) {
      final para = paragraphs[i];
      final imgEntry = ImgEntry.fromXmlString(para);

      if (imgEntry == null) {
        textBuffer.write(para);
        textBuffer.write("\n\n");
      } else {
        if (textBuffer.isNotEmpty) {
          widgets.add(
            Text(
              textBuffer.toString().trimRight(),
              style: style,
              textAlign: TextAlign.justify,
            ),
          );
          textBuffer.clear();
        }

        final imageEntity = images.firstWhereOrNull(
          (img) =>
              img.absPath.endsWith(imgEntry.path) ||
              imgEntry.path.endsWith(img.absPath),
        );

        if (imageEntity != null) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(imageEntity.image!, fit: BoxFit.contain),
              ),
            ),
          );
        }
      }

      if (i == paragraphs.length - 1 && textBuffer.isNotEmpty) {
        widgets.add(
          Text(
            textBuffer.toString().trimRight(),
            style: style,
            textAlign: TextAlign.justify,
          ),
        );
      }
    }
    return widgets;
  }
}
