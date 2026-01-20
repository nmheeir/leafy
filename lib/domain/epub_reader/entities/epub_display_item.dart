import 'dart:typed_data';

abstract class EpubDisplayItem {
  final int chapterIndex; // Để biết item này thuộc chương mấy
  EpubDisplayItem(this.chapterIndex);
}

// 1. Tiêu đề chương (VD: "Chương 1: Mở đầu")
class ChapterHeaderItem extends EpubDisplayItem {
  final String title;
  ChapterHeaderItem(super.chapterIndex, this.title);
}

// 2. Đoạn văn bản
class ParagraphItem extends EpubDisplayItem {
  final String content;
  final String? translatedContent;
  ParagraphItem(super.chapterIndex, this.content, this.translatedContent);
}

// 3. Hình ảnh
class ImageItem extends EpubDisplayItem {
  final String absPath;
  final Uint8List imageBytes;
  ImageItem(super.chapterIndex, this.absPath, this.imageBytes);
}
