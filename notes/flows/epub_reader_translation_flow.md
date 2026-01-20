# Luồng Tính năng Dịch thuật EPUB

## 1. Tổng quan

Tính năng này cho phép người dùng dịch nội dung sách EPUB theo từng chương với các cơ chế tối ưu:

- **Dịch theo yêu cầu (On-demand)**: Chỉ dịch chương đang đọc.
- **Tóm tắt tích lũy (Sliding Window Summary)**: Kết hợp tóm tắt tổng quan và chi tiết để đảm bảo ngữ cảnh tốt nhất.
- **Khớp dữ liệu theo Key (Indexed Tagging)**: Đảm bảo độ chính xác 1-1 cho từng đoạn văn.
- **Định danh theo File Hash**: Lưu trữ bản dịch dựa trên nội dung thực của file (MD5).

## 2. Các Thành phần Kiến trúc

### Tầng Domain

- **Entity**: `EpubChapter` (chứa nội dung gốc).
- **Display Item**: `ParagraphItem` (chứa `text` gốc và `translatedText`).
- **Use Case**: `TranslateChapterUseCase`.

### Tầng Data

- **Local DB**:
  - `epub_translations`: Lưu bản dịch từng đoạn văn (dựa trên `file_hash`).
  - `epub_summary`: Lưu tóm tắt nội dung chương (dựa trên `file_hash`).
- **Remote API**: Gọi AI (Gemini) để Dịch và Tóm tắt với cơ chế Tagging.

## 3. Cấu trúc Cơ sở dữ liệu

### Bảng `epub_translations`

Lưu trữ nội dung đã dịch. Sử dụng `file_hash` thay vì `resource_id`.

```sql
CREATE TABLE epub_translations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  file_hash TEXT NOT NULL,                 -- MD5 của file EPUB (Thay cho resource_id)
  chapter_index INTEGER NOT NULL,
  target_lang TEXT NOT NULL DEFAULT 'vi',
  translated_content TEXT,                 -- JSON Map: {"0": "Text 1", "1": "Text 2"}
  last_updated INTEGER,
  UNIQUE(file_hash, chapter_index, target_lang)
);
```

### Bảng `epub_summary`

Lưu trữ tóm tắt ngữ cảnh.

```sql
CREATE TABLE epub_summary (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  file_hash TEXT NOT NULL,                 -- MD5 của file EPUB
  chapter_index INTEGER NOT NULL,
  summary_content TEXT,                    -- Text tóm tắt
  last_updated INTEGER,
  UNIQUE(file_hash, chapter_index)
);
```

## 4. Quy trình Xử lý Dữ liệu (Data Pipeline)

### Bước 1: Chuẩn hóa Input (`EpubHelper`)

```dart
static List<String> splitToParagraphs(String body) {
  return body.split('\n\n').where((s) => s.trim().isNotEmpty).toList();
}
```

### Bước 2: Luồng Hiển thị (Display Flow)

1. **Cubit**: Lấy `EpubBook` và tính `file_hash`.

2. **Helper**:
   - `splitToParagraphs(chapter.body)` -> List Gốc.
   - Lấy Map dịch từ DB `{"0": "...", "1": "..."}`.
   - Map chính xác từng đoạn dựa trên index:

     ```dart
     item.translatedText = translationMap[index.toString()];
     ```

## 5. Luồng Dịch thuật (Translation Logic)

### Giai đoạn 1: Chuẩn bị Ngữ cảnh (Checking & Prep)

Trạng thái UI: `preparing_context`

1. **Sliding Window Strategy**:
   - Lấy Global Context: Tóm tắt gộp từ chương 1 -> N-5 (Nếu có).
   - Lấy Local Context: Tóm tắt chi tiết 4 chương gần nhất (N-4 -> N-1).

2. **Fill the Gap**: Nếu thiếu tóm tắt ở các chương quan trọng (N-4 đến N-1), gọi AI tóm tắt bù và lưu vào `epub_summary` ngay lập tức (Checkpointing).

### Giai đoạn 2: Gọi Dịch thuật (Translation Call)

Trạng thái UI: `translating_content`

1. Chuẩn bị Input: Gửi List gốc kèm Index `[{"i": 0, "text": "..."}, ...]`.

2. Chuẩn bị Context: Nối Global + Local Summary.

3. **Prompt Yêu cầu**: Trả về đúng định dạng JSON Key-Value `{"0": "...", "1": "..."}`.

### Giai đoạn 3: Lưu và Hoàn thiện

Trạng thái UI: `finalizing`

1. Parse JSON -> Map<String, String>.

2. Lưu vào `epub_translations` với `file_hash`.

3. (Background) Tóm tắt chương N và lưu vào `epub_summary`.

4. Cubit cập nhật UI.
