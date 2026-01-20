import 'dart:convert';

class GeminiPrompts {
  static String translateChapter({
    required String targetLang,
    required String context,
    required List<String> paragraphs,
  }) {
    final inputData = <Map<String, dynamic>>[];
    for (int i = 0; i < paragraphs.length; i++) {
      inputData.add({'i': i, 't': paragraphs[i]});
    }

    return '''
Bạn là một dịch giả chuyên nghiệp. Hãy dịch danh sách các đoạn văn sau sang ngôn ngữ: $targetLang.

Bối cảnh nội dung (Context):
$context

Yêu cầu:
1. Giữ nguyên định dạng JSON.
2. Trả về một đối tượng JSON duy nhất với các key là chỉ số (index) từ input và value là nội dung đã dịch.
3. Đảm bảo bản dịch mượt mà, văn phong phù hợp với ngữ cảnh truyện/sách.
4. Trả về kết quả dưới dạng: {"0": "dịch đoạn 1", "1": "dịch đoạn 2", ...}

Danh sách các đoạn văn cần dịch (Dạng JSON):
${jsonEncode(inputData)}
''';
  }

  static String summarizeContent(String content) {
    return 'Hãy tóm tắt nội dung sau đây một cách ngắn gọn, súc tích (khoảng 3-5 câu), tập trung vào các tình tiết chính để làm bối cảnh cho việc dịch các chương sau:\n\n$content';
  }
}
