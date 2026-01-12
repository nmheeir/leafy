import 'package:collection/collection.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';
import 'package:leafy/domain/epub_reader/entities/epub_display_item.dart';

// Helper Regex để parse thẻ ảnh (giống bài trước)
class _ImgEntry {
  final String path;
  _ImgEntry(this.path);
  static _ImgEntry? fromXml(String text) {
    final match = RegExp(r'<img\s+src="([^"]+)"').firstMatch(text);
    return match != null ? _ImgEntry(match.group(1)!) : null;
  }
}

class EpubHelper {
  static List<EpubDisplayItem> flattenBook(EpubBook book) {
    final List<EpubDisplayItem> items = [];

    for (int i = 0; i < book.chapters.length; i++) {
      final chapter = book.chapters[i];

      // 1. Thêm Header chương
      if (chapter.title.isNotEmpty) {
        items.add(ChapterHeaderItem(i, chapter.title));
      }

      // 2. Tách body thành các đoạn văn
      final paragraphs = chapter.body
          .split('\n\n')
          .where((s) => s.trim().isNotEmpty);

      for (var para in paragraphs) {
        final imgEntry = _ImgEntry.fromXml(para);

        if (imgEntry == null) {
          // Là văn bản
          items.add(ParagraphItem(i, para));
        } else {
          // Là hình ảnh -> Tìm bytes trong list images
          final imageEntity = book.images.firstWhereOrNull(
            (img) =>
                img.absPath.endsWith(imgEntry.path) ||
                imgEntry.path.endsWith(img.absPath),
          );

          if (imageEntity != null) {
            items.add(ImageItem(i, imageEntity.absPath, imageEntity.image!));
          }
        }
      }
    }
    return items;
  }
}
