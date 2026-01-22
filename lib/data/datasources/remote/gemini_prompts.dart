import 'dart:convert';

abstract final class GeminiPrompts {
  static String translateChapter({
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  }) {
    final inputData = <Map<String, dynamic>>[];
    for (int i = 0; i < paragraphs.length; i++) {
      inputData.add({'i': i, 't': paragraphs[i]});
    }

    // Xây dựng phần hồ sơ tác phẩm
    final bookProfile = [
      "Tên tác phẩm: $bookTitle",
      if (author != null && author.isNotEmpty) "Tác giả: $author",
      if (bookSummary != null && bookSummary.isNotEmpty)
        "Tóm tắt: $bookSummary",
    ].join("\n");

    return '''
Bạn là một dịch giả văn học chuyên nghiệp, am hiểu sâu sắc về phong cách ngôn ngữ và văn hóa. 
Hãy dịch danh sách các đoạn văn sau sang ngôn ngữ: $targetLang.

--- HỒ SƠ TÁC PHẨM ---
$bookProfile
Bối cảnh nội dung này: $chapterContext

--- CHỈ THỊ DỊCH THUẬT ---
1. Phong cách: Hãy dịch theo đúng văn phong của tác giả ${author ?? 'nêu trên'}. Bản dịch cần mượt mà, giàu hình ảnh và giữ được linh hồn của tác phẩm gốc.
2. Quy tắc JSON (BẮT BUỘC):
   - Chỉ trả về một đối tượng JSON duy nhất.
   - Định dạng: {"chỉ số": "nội dung dịch"}.
   - KHÔNG bao gồm bất kỳ lời giải thích nào hoặc thẻ Markdown (như ```json).
   - Tuyệt đối không lặp lại từ ngữ ở cuối kết quả. 
   - Kết thúc JSON ngay sau đoạn văn cuối cùng bằng dấu ngoặc nhọn }. 
   - Không thêm bất kỳ văn bản nào sau khi đóng ngoặc JSON.
3. Độ chính xác: Giữ nguyên các danh từ riêng và biệt ngữ nếu bối cảnh yêu cầu. Đảm bảo bản dịch mượt mà, văn phong phù hợp với ngữ cảnh truyện/sách.

--- DỮ LIỆU ĐẦU VÀO (JSON) ---
${jsonEncode(inputData)}
''';
  }

  static String summarizeContent(String content) {
    return 'Hãy tóm tắt nội dung sau đây một cách ngắn gọn, súc tích (khoảng 3-5 câu), tập trung vào các tình tiết chính để làm bối cảnh cho việc dịch các chương sau:\n\n$content';
  }

  static String translateAndSummarizeChapter({
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  }) {
    final inputData = <Map<String, dynamic>>[];
    for (int i = 0; i < paragraphs.length; i++) {
      inputData.add({'id': i, 'text': paragraphs[i]});
    }

    final bookProfile = [
      "Tác phẩm: $bookTitle",
      if (author != null && author.isNotEmpty) "Tác giả: $author",
      if (bookSummary != null && bookSummary.isNotEmpty)
        "Tóm tắt cốt truyện chung: $bookSummary",
    ].join("\n");

    return '''
Bạn là một dịch giả văn học lỗi lạc, người sở hữu vốn từ vựng phong phú và khả năng cảm thụ văn chương tinh tế.
Nhiệm vụ của bạn là dịch danh sách các đoạn văn được cung cấp sang ngôn ngữ: "$targetLang" và tóm tắt lại nội dung đó.

--- HỒ SƠ TÁC PHẨM ---
$bookProfile
Bối cảnh chương này: $chapterContext

--- YÊU CẦU DỊCH THUẬT (QUAN TRỌNG) ---
1. **Chất lượng văn chương**: 
   - Tuyệt đối tránh lối dịch "word-by-word" khô khan. 
   - Hãy dịch thoáng đạt, bay bổng, sử dụng từ ngữ "đắt" và giàu hình ảnh để tái hiện trọn vẹn cảm xúc, không khí và giọng văn của tác giả.
   - Ưu tiên sự mượt mà và tự nhiên của ngôn ngữ đích, ngay cả khi phải thay đổi cấu trúc câu (nhưng vẫn giữ đúng ý nghĩa gốc).
2. **Độ chính xác**: Giữ nguyên tên riêng, địa danh.

--- YÊU CẦU ĐẦU RA (JSON BẮT BUỘC) ---
Bạn phải trả về DUY NHẤT một đối tượng JSON hợp lệ, không có bất kỳ văn bản dẫn dắt hay Markdown (```json) nào khác. Cấu trúc phải có "translation" trước "summary" như sau:

{
  "translation": {
    "0": "Nội dung dịch của đoạn có id 0",
    "1": "Nội dung dịch của đoạn có id 1",
    ... (tương ứng với tất cả các id đầu vào)
  },
  "summary": "Viết một đoạn tóm tắt ngắn gọn (3-5 câu) về các diễn biến chính trong đoạn vừa dịch. Tóm tắt này sẽ dùng làm bối cảnh cho lần dịch tiếp theo."
}

--- DỮ LIỆU ĐẦU VÀO ---
${jsonEncode(inputData)}
''';
  }

  static String streamTranslateChapter({
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
    required String chapterContext,
    required List<String> paragraphs,
  }) {
    final inputData = <Map<String, dynamic>>[];
    for (int i = 0; i < paragraphs.length; i++) {
      inputData.add({'id': i, 'text': paragraphs[i]});
    }

    final bookProfile = [
      "Tác phẩm: $bookTitle",
      if (author != null && author.isNotEmpty) "Tác giả: $author",
      if (bookSummary != null && bookSummary.isNotEmpty)
        "Tóm tắt cốt truyện chung: $bookSummary",
    ].join("\n");

    return '''
Bạn là một dịch giả văn học lỗi lạc, người sở hữu vốn từ vựng phong phú và khả năng cảm thụ văn chương tinh tế.
Nhiệm vụ của bạn là dịch danh sách các đoạn văn được cung cấp sang ngôn ngữ: "$targetLang".

--- HỒ SƠ TÁC PHẨM ---
$bookProfile
Bối cảnh chương này: $chapterContext

--- YÊU CẦU ---
1. Dịch văn chương, thoáng đạt, giàu cảm xúc.
2. Trả về định dạng JSON Lines (mỗi dòng là một object JSON hợp lệ).
3. KHÔNG wrap trong markdown block (```json). Chỉ thuần túy là các dòng JSON.

--- YÊU CẦU DỊCH THUẬT (QUAN TRỌNG) ---
1. **Chất lượng văn chương**: 
   - Tuyệt đối tránh lối dịch "word-by-word" khô khan. 
   - Hãy dịch thoáng đạt, bay bổng, sử dụng từ ngữ "đắt" và giàu hình ảnh để tái hiện trọn vẹn cảm xúc, không khí và giọng văn của tác giả.
   - Ưu tiên sự mượt mà và tự nhiên của ngôn ngữ đích, ngay cả khi phải thay đổi cấu trúc câu (nhưng vẫn giữ đúng ý nghĩa gốc).
2. **Độ chính xác**: Giữ nguyên tên riêng, địa danh.

Cấu trúc mỗi dòng (BẮT BUỘC xuống dòng sau mỗi object):
- Bản dịch: {"type": "translation", "id": "index", "text": "nội dung dịch"}
- Tóm tắt (ở cuối cùng): {"type": "summary", "content": "tóm tắt nội dung chương 3-5 câu"}

--- DỮ LIỆU ĐẦU VÀO ---
${jsonEncode(inputData)}
''';
  }
}
