# Nhiệm vụ Triển khai Dịch thuật EPUB

## Giai đoạn 1: Cơ sở dữ liệu & Tầng Dữ liệu (Database & Data Layer)

- [x] **Di chuyển Cơ sở dữ liệu (Database Migration)**:
  - [x] Thêm schema bảng `epub_translations` và `epub_summary` trong `DbConstants` (lib/core/database/db_constants.dart).
  - [x] Tạo kịch bản migration trong `DbMigrations` (lib/core/database/db_migrations.dart).
- [ ] **Models & Entities**:
  - [ ] Tạo `TranslationModel` và `SummaryModel` (lib/data/models/translation/).
  - [ ] Cập nhật `EpubDisplayItem` để thêm trường `translatedText` (lib/domain/epub_reader/entities/epub_display_item.dart).
- [ ] **Local Data Source**:
  - [ ] Tạo interface `TranslationLocalDataSource`.
  - [ ] Impl `TranslationLocalDataSourceImpl`: CRUD cho cả `epub_translations` và `epub_summary`.

## Giai đoạn 2: Nguồn Dữ liệu Từ xa & Kho lưu trữ (Remote & Repository)

- [ ] **Remote Data Source**:
  - [ ] Tạo interface `TranslationRemoteDataSource`.
  - [ ] Impl `OpenAiTranslationDataSource` (Gemini API).
  - [ ] Implement logic:
    - [ ] `translateChapters(List<String>)`: Trả về JSON List.
    - [ ] `summarizeChapter(String)`: Trả về text tóm tắt.
- [ ] **Repository**:
  - [ ] Tạo interface `TranslationRepository` (Domain).
  - [ ] Impl `TranslationRepositoryImpl` (Data):
    - [ ] Logic kiểm tra & lấy summary các chương trước để làm Context.
    - [ ] Logic gọi API và lưu cache đồng thời cho Translation và Summary.

## Giai đoạn 3: Logic Business (Domain & State)

- [ ] **Use Cases**:
  - [ ] Tạo `TranslateChapterUseCase`: Điều phối luồng (Check DB -> Call Repo -> Update DB).
- [ ] **Helper**:
  - [ ] Tách hàm `splitToParagraphs` ra `EpubHelper` (Core).
  - [ ] Cập nhật `flattenBook` để nhận thêm `Map<int, String> translations` và ghép theo index.
- [ ] **Cubit/Bloc**:
  - [ ] Cập nhật `EpubReaderState` để quản lý trạng thái dịch (loading/success/error).
  - [ ] Impl `translateChapter(int chapterIndex)`: Gọi UseCase và cập nhật UI.

## Giai đoạn 4: UI & Hiển thị

- [ ] **Widgets**:
  - [ ] Cập nhật `ParagraphWidget`:
    - [ ] Hiển thị song ngữ nếu `item.translatedText` có dữ liệu.
    - [ ] Style khác biệt cho bản dịch (màu nhạt, nghiêng...).
  - [ ] Thêm nút "Dịch chương này" trên giao diện Reader.
  - [ ] Thêm Loading Indicator khi đang dịch.
