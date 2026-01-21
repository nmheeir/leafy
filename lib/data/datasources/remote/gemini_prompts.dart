import 'dart:convert';

class GeminiPrompts {
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
}
