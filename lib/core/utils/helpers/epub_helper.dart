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

abstract final class EpubHelper {
  /// Chuẩn hóa logic tách đoạn văn để dùng chung cho cả UI và Translation Service.
  /// Điều này đảm bảo index gửi đi dịch và index hiển thị luôn khớp nhau.
  static List<String> splitToParagraphs(String body) {
    return body.split('\n\n').where((s) => s.trim().isNotEmpty).toList();
  }

  /// Chuyển đổi sách thành danh sách hiển thị phẳng.
  /// [translationMaps]: Map<ChapterIndex, Map<ParagraphIndex (String), TranslatedText>>
  static List<EpubDisplayItem> flattenBook(
    EpubBook book, {
    Map<int, Map<String, String>>? translationMaps,
  }) {
    final List<EpubDisplayItem> items = [];

    for (int i = 0; i < book.chapters.length; i++) {
      final chapter = book.chapters[i];

      // 1. Thêm Header chương
      if (chapter.title.isNotEmpty) {
        items.add(ChapterHeaderItem(i, chapter.title));
      }

      // 2. Tách body thành các đoạn văn sử dụng hàm chuẩn hóa
      final rawParagraphs = splitToParagraphs(chapter.body);

      // Lấy map dịch của chương hiện tại (nếu có)
      final chapterTranslation = translationMaps?[i];

      int paragraphIndex = 0;
      for (var para in rawParagraphs) {
        final imgEntry = _ImgEntry.fromXml(para);

        if (imgEntry == null) {
          // Là văn bản
          // Tìm bản dịch tương ứng với index hiện tại
          final translatedText = chapterTranslation?[paragraphIndex.toString()];

          items.add(ParagraphItem(i, para, translatedText));
          paragraphIndex++; // Chỉ tăng index đếm cho văn bản
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
