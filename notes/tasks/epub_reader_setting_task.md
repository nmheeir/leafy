# 📋 EPUB Reader Settings Implementation Checklist

- [📋 EPUB Reader Settings Implementation Checklist](#-epub-reader-settings-implementation-checklist)
  - [1. Cấu trúc giao diện (UI Architecture)](#1-cấu-trúc-giao-diện-ui-architecture)
  - [2. Cài đặt Font chữ (Typography)](#2-cài-đặt-font-chữ-typography)
  - [3. Cài đặt Bố cục văn bản (Text Layout)](#3-cài-đặt-bố-cục-văn-bản-text-layout)
  - [4. Cài đặt Giao diện \& Màu sắc (Appearance)](#4-cài-đặt-giao-diện--màu-sắc-appearance)
  - [5. Tiện ích (Tools)](#5-tiện-ích-tools)
  - [6. Các tính năng tham chiếu (Cần bổ sung)](#6-các-tính-năng-tham-chiếu-cần-bổ-sung)
  - [7. Tương tác với Nội dung (Active Reading)](#7-tương-tác-với-nội-dung-active-reading)
  - [8. Trải nghiệm Đọc \& Điều hướng (Navigation \& UX)](#8-trải-nghiệm-đọc--điều-hướng-navigation--ux)
  - [9. Hỗ trợ Audio \& Accessibility (Trợ năng)](#9-hỗ-trợ-audio--accessibility-trợ-năng)
  - [10. Quản lý Thư viện \& Dữ liệu (Library \& Data)](#10-quản-lý-thư-viện--dữ-liệu-library--data)

## 1. Cấu trúc giao diện (UI Architecture)

- [x] **Modal Bottom Sheet:** Implement khung cài đặt dạng trượt từ dưới lên.
- [x] **Tab Navigation:** Tạo 3 tab chính để phân loại cài đặt:
  - Tab 1: General (Cài đặt chung).
  - Tab 2: Reader (Cài đặt hiển thị chữ/ảnh).
  - Tab 3: Color (Cài đặt màu sắc).

## 2. Cài đặt Font chữ (Typography)

- [ ] **Font Family:** Chức năng đổi kiểu font (Serif, Sans-serif, Custom font).
- [ ] **Font Thickness:** Slider hoặc tùy chọn điều chỉnh độ đậm nhạt (Weight).
- [ ] **Font Style:** Toggle bật/tắt in nghiêng (Italic).
- [ ] **Font Size:** Slider điều chỉnh kích thước chữ.
- [ ] **Letter Spacing:** Điều chỉnh khoảng cách giữa các ký tự.

## 3. Cài đặt Bố cục văn bản (Text Layout)

- [ ] **Text Alignment:** Tùy chọn căn chỉnh: Trái, Giữa, Căn đều (Justify).
- [ ] **Line Height:** Điều chỉnh khoảng cách giữa các dòng.
- [ ] **Paragraph Height:** Điều chỉnh khoảng cách giữa các đoạn văn.
- [ ] **Paragraph Indentation:** Điều chỉnh độ thụt đầu dòng của dòng đầu tiên mỗi đoạn.

## 4. Cài đặt Giao diện & Màu sắc (Appearance)

- [ ] **Color Presets:** Danh sách các theme màu có sẵn (Sáng, Tối, Sepia, v.v.).
- [ ] **Fast Color Preset Change:** Tùy chọn/nút tắt để đổi nhanh theme mà không cần vào sâu trong cài đặt.
- [ ] **Compact Layout:** Ẩn tiêu đề và đường kẻ phân cách trong tab này để tối ưu diện tích.

## 5. Tiện ích (Tools)

- [ ] **Double Click Translation:** Toggle bật/tắt tính năng dịch nhanh khi nhấn đúp vào đoạn văn.

## 6. Các tính năng tham chiếu (Cần bổ sung)

- [ ] **Reading Mode:** Chế độ cuộn dọc/lật trang ngang (`ReadingModeSubcategory`).
- [ ] **Padding:** Chỉnh lề trang sách (`PaddingSubcategory`).
- [ ] **System:** Cài đặt màn hình sáng, xoay màn hình (`SystemSubcategory`).
- [ ] **Reading Speed:** Tốc độ đọc/TTS (`ReadingSpeedSubcategory`).
- [ ] **Images:** Tùy chỉnh hiển thị ảnh (`ImagesSubcategory`).
- [ ] **Chapters:** Quản lý hiển thị chương (`ChaptersSubcategory`).
- [ ] **Misc:** Các cài đặt phụ khác (`MiscSubcategory`).

## 7. Tương tác với Nội dung (Active Reading)

*Những tính năng này giúp người dùng không chỉ "đọc" mà còn "làm việc" với cuốn sách.*

- [ ] **Highlight & Annotation (Tô sáng & Ghi chú):**
  - Cho phép người dùng chọn văn bản và tô màu (nhiều màu khác nhau).
  - Thêm ghi chú cá nhân (text note) vào đoạn văn bản đã chọn.
  - *Gợi ý:* Lưu trữ vị trí (CFI trong EPUB) và nội dung vào database (Room/SQLite).
- [ ] **Bookmarks (Đánh dấu trang):**
  - Lưu lại những trang yêu thích để truy cập nhanh ngoài việc tự động lưu tiến độ đọc.
- [ ] **Search in Book (Tìm kiếm nội dung):**
  - Tìm kiếm từ khóa hoặc cụm từ trong toàn bộ cuốn sách.
  - Hiển thị kết quả dưới dạng danh sách các đoạn văn chứa từ khóa.
- [ ] **Dictionary Lookup (Tra từ điển Offline/Online):**
  - Bên cạnh tính năng "Dịch" (Translator), thêm tra từ điển (định nghĩa từ).
  - Hỗ trợ popup hiển thị nhanh nghĩa của từ khi nhấn giữ.

## 8. Trải nghiệm Đọc & Điều hướng (Navigation & UX)

*Tối ưu hóa sự thoải mái khi đọc trong thời gian dài.*

- [ ] **Volume Key Navigation (Lật trang bằng phím âm lượng):**
  - Cho phép dùng phím Tăng/Giảm âm lượng vật lý để chuyển trang.
- [ ] **Gesture Controls (Điều khiển bằng cử chỉ):**
  - Vuốt cạnh trái/phải màn hình lên xuống để điều chỉnh độ sáng (Brightness control).
  - Nhấn vùng giữa để hiện menu, nhấn hai bên để lật trang.
- [x] **Reading Progress (Thanh tiến trình chi tiết):**
  - Hiển thị: Số trang hiện tại / Tổng số trang, Phần trăm đã đọc (%), Thời gian dự kiến để đọc hết chương.
- [x] **Table of Contents (Mục lục động):**
  - Drawer bên trái hiển thị cấu trúc chương của sách, cho phép nhảy nhanh đến chương.

## 9. Hỗ trợ Audio & Accessibility (Trợ năng)

- [ ] **Text-to-Speech (TTS - Đọc to văn bản):**
  - Sử dụng TTS engine để đọc sách cho người dùng.
  - Tự động lật trang khi đọc hết, đánh dấu câu đang đọc.
- [ ] **Auto-Scroll (Tự động cuộn):**
  - Sách tự động trôi xuống với tốc độ tùy chỉnh (dành cho chế độ đọc cuộn dọc/Webtoon mode).

## 10. Quản lý Thư viện & Dữ liệu (Library & Data)

- [ ] **Import Font:**
  - Cho phép người dùng tải file font (.ttf, .otf) từ máy vào để đọc sách theo font yêu thích.
