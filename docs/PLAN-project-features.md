# Danh sách Tính năng Dự án Leafy (Technical Overview)

Tài liệu này liệt kê chi tiết các tính năng của dự án **Leafy** dành cho đội ngũ phát triển, bao gồm cấu trúc module, các class chính và trạng thái chức năng.

## 1. Tổng quan Kiến trúc

* **Framework**: Flutter
* **State Management**: BLoC / Cubit (Sử dụng `flutter_bloc`, `hydrated_bloc` cho persistence)
* **Navigation**: GoRouter (Declarative routing)
* **Database**: Sqflite (Lưu trữ metadata sách) + Shared Preferences (Cài đặt nhẹ)
* **Dependency Injection**: GetIt + Injectable
* **Internationalization**: Easy Localization

---

## 2. Chi tiết Tính năng theo Module

### A. Onboarding & Khởi tạo (Module: `ui/welcome`)

Màn hình đầu tiên người dùng nhìn thấy khi cài đặt mới.

* **Màn hình chính**: `WelcomeScreen` (Route: `/welcome`)
* **Chức năng**:
  * Giới thiệu tính năng (Slider/Carousel).
  * Kiểm tra `IntroService` để xác định lần đầu khởi chạy.
  * *(Planned)*: Tích hợp nút Restore Backup hoặc Import CSV ngay tại đây để tiện cho người dùng chuyển thiết bị.

### B. Thư viện & Quản lý Sách (Module: `ui/home`, `ui/book`)

Trung tâm của ứng dụng, nơi hiển thị và quản lý tủ sách cá nhân.

* **Màn hình chính**: `HomeScreen` (Route: `/`)
* **Chi tiết sách**: `BookScreen` (Route: `/book/:id`)
* **Chức năng chi tiết**:
  * **Hiển thị sách**: List view hoặc Grid view, sắp xếp (`SettingBookListOrderScreen`).
  * **Metadata Sách**: Hiển thị bìa (CoverView), Tác giả, Năm xuất bản, Số trang, Định dạng (ePub/PDF).
  * **User Data**:
    * **My Review**: Người dùng tự viết đánh giá.
    * **Notes**: Ghi chú cá nhân cho sách.
    * **Tags**: Gắn thẻ phân loại sách (`ui/tags`).
  * **Quản lý File (Book Resources)**:
    * Tự động quét định dạng file.
    * Import file từ thiết bị.
    * Download file từ URL (nếu sách được add từ nguồn online).
    * Chọn phiên bản đọc (nếu có nhiều file).
  * **Thùng rác (Trash)**: `TrashScreen` - Khôi phục hoặc xóa vĩnh viễn sách đã xóa.
  * **Lịch sử**: `ReadingHistoryScreen` - Thống kê thời gian đọc.

### C. Trình đọc (Reader Engine) (Module: `ui/reader`, `epub_reader`, `pdf_reader`)

Core feature của ứng dụng.

* **Launcher**: `BookReaderLauncherButton` (Xử lý logic chọn file và mở trình đọc phù hợp).
* **Các trình đọc hỗ trợ**:
    1. **ePub Reader** (`EpubReaderScreen`):
        * Rendering engine chuyên biệt cho ePub.
        * **Cài đặt**: Font chữ, kích thước, line height, background color (`SettingEpubReaderScreen`).
        * Lưu vị trí đọc (Progress).
    2. **PDF Reader** (`PdfReaderScreen`):
        * Hỗ trợ zoom, scroll, điều hướng trang.
        * Lưu vị trí trang cuối cùng.
    3. **Hỗ trợ khác**:
        * **TTS (Text-to-Speech)**: Đọc sách bằng giọng nói (dựa trên `flutter_tts`).
        * **Placeholder**: Xử lý các định dạng chưa hỗ trợ đầy đủ.

### D. Tìm kiếm & Nguồn Sách (Module: `ui/search_*`)

Hệ thống tìm kiếm đa tầng.

1. **Local Search** (`SearchScreen`): Tìm sách trong thư viện cá nhân.
2. **Open Library** (`SearchOLScreen`):
    * Kết nối API Open Library.
    * Tìm kiếm sách online, xem metadata.
    * Tải sách (nếu Public Domain).
3. **Project Gutenberg / Gutendex** (`SearchGtdScreen`):
    * Tìm kiếm kho sách miễn phí Gutenberg.
    * Tải trực tiếp ePub/PDF miễn phí.

### E. Cài đặt & Hệ thống (Module: `ui/settings`)

Trung tâm cấu hình ứng dụng (`SettingsScreen`).

#### 1. Sao lưu & Đồng bộ (`SettingBackupRestoreScreen`)

* **Local Backup**: Tạo file `.zip` chứa database và settings.
* **Cloud Backup**:
  * Tích hợp **Google Drive API**.
  * Upload/Download bản backup từ Drive riêng của người dùng.
* **Dữ liệu CSV**:
  * **Export**: Xuất danh sách sách ra CSV.
  * **Import**: Nhập dữ liệu sách từ file CSV.

#### 2. Cá nhân hóa (`SettingAppearanceScreen`, `SettingAccentColorScreen`)

* Chế độ tối/sáng (Dark/Light/System).
* Màu chủ đạo (Accent Color) - Dynamic Color (Material You).
* Tùy chỉnh bìa sách: Tự động tải bìa thiếu (`SettingDownloadMissionCoverScreen`).

#### 3. AI & Tiện ích mở rộng

* **Gemini AI** (`AISettingsScreen`): Cấu hình API Key để sử dụng các tính năng AI (tóm tắt, gợi ý - *cần kiểm tra implementation cụ thể trong logic*).

---

## 3. Các thư viện quan trọng (Dependencies)

* `flutter_bloc`: Quản lý logic nghiệp vụ.
* `go_router`: Quản lý luồng màn hình.
* `sqflite`: Local DB.
* `googleapis`, `google_sign_in`: Cloud Backup.
* `csv`: Xử lý import/export.
* `flutter_epub_viewer` (hoặc custom implementation), `pdfrx`: Render sách.
* `googleai_dart`: Tích hợp Gemini.
