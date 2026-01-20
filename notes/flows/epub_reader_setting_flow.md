
# 🌊 EPUB Reader Settings Implementation Flow

Tài liệu này mô tả chi tiết luồng nghiệp vụ (Business Logic Flow) và các bước thực hiện để xây dựng tính năng Cài đặt cho trình đọc EPUB.

- [🌊 EPUB Reader Settings Implementation Flow](#-epub-reader-settings-implementation-flow)
  - [🏗️ \[Part 1\] UI Architecture (Cấu trúc giao diện)](#️-part-1-ui-architecture-cấu-trúc-giao-diện)
    - [1.1. Luồng kích hoạt (Activation Flow)](#11-luồng-kích-hoạt-activation-flow)
    - [1.2. Luồng điều hướng Tab (Tab Navigation Logic)](#12-luồng-điều-hướng-tab-tab-navigation-logic)
    - [1.3. Luồng đóng giao diện (Closing Flow)](#13-luồng-đóng-giao-diện-closing-flow)
  - [🔠 \[Part 2\] Typography (Cài đặt Font chữ)](#-part-2-typography-cài-đặt-font-chữ)
    - [2.1. Nguyên tắc chung (General Logic)](#21-nguyên-tắc-chung-general-logic)
    - [2.2. Font Family (Kiểu chữ)](#22-font-family-kiểu-chữ)
    - [2.3. Size \& Spacing](#23-size--spacing)
    - [2.4. Style \& Weight](#24-style--weight)
  - [📐 \[Part 3\] Text Layout (Bố cục văn bản)](#-part-3-text-layout-bố-cục-văn-bản)
    - [3.1. Text Alignment](#31-text-alignment)
    - [3.2. Line Height (Giãn dòng)](#32-line-height-giãn-dòng)
    - [3.3. Paragraph Format](#33-paragraph-format)
  - [🎨 \[Part 4\] Appearance (Giao diện \& Màu sắc)](#-part-4-appearance-giao-diện--màu-sắc)
    - [4.1. Color Presets](#41-color-presets)
    - [4.2. Fast Change](#42-fast-change)
    - [4.3. Compact Layout](#43-compact-layout)
  - [🛠️ \[Part 5\] Tools (Tiện ích)](#️-part-5-tools-tiện-ích)
    - [5.1. Double Click Translation](#51-double-click-translation)
    - [5.2. Gesture \& Execution](#52-gesture--execution)
  - [🧩 \[Part 6\] Additional Features (Tham chiếu)](#-part-6-additional-features-tham-chiếu)
    - [6.1. Reading Mode](#61-reading-mode)
    - [6.2. System](#62-system)
    - [6.3. Images](#63-images)
  - [📝 \[Part 7\] Active Reading](#-part-7-active-reading)
    - [7.1. Highlight \& Annotation](#71-highlight--annotation)
    - [7.2. Bookmarks \& Search](#72-bookmarks--search)
  - [🧭 \[Part 8\] Navigation \& UX](#-part-8-navigation--ux)
    - [8.1. Volume Key Navigation](#81-volume-key-navigation)
    - [8.2. Gesture Controls](#82-gesture-controls)
    - [8.3. Reading Progress \& TOC](#83-reading-progress--toc)
  - [🔊 \[Part 9\] Audio \& Accessibility](#-part-9-audio--accessibility)
    - [9.1. Text-to-Speech (TTS)](#91-text-to-speech-tts)
    - [9.2. Auto-Scroll](#92-auto-scroll)
  - [📚 \[Part 10\] Library \& Data](#-part-10-library--data)
    - [10.1. Import Font](#101-import-font)

---

## 🏗️ [Part 1] UI Architecture (Cấu trúc giao diện)

### 1.1. Luồng kích hoạt (Activation Flow)

- **Trigger:** Người dùng nhấn vào icon **Cài đặt** (⚙️) trên Top Bar hoặc chạm vùng trung tâm màn hình.
- **Action:** Hiển thị **Modal Bottom Sheet**.
- **UI Specs:**
  - Height: 40-50% màn hình.
  - Backdrop: Làm mờ (dimmed) hoặc trong suốt để Live Preview.
  - Animation: Slide up từ dưới lên.

### 1.2. Luồng điều hướng Tab (Tab Navigation Logic)

- **Components:** Tab Bar với 3 tabs:
  1. **General:** Cài đặt chung.
  2. **Reader:** Hiển thị chữ & ảnh (Typography).
  3. **Color:** Màu sắc & Giao diện.
- **Behavior:**
  - Mặc định chọn **Tab 1 (General)**.
  - Chuyển tab cập nhật nội dung bên dưới, giữ nguyên chiều cao Sheet.
  - **State Preservation:** Giữ trạng thái cuộn của tab cũ khi quay lại.

### 1.3. Luồng đóng giao diện (Closing Flow)

- **Trigger:** Vuốt xuống hoặc chạm ra ngoài (Tap outside).
- **Action:** Đóng Sheet, lưu trạng thái (nếu cần).

---

## 🔠 [Part 2] Typography (Cài đặt Font chữ)

### 2.1. Nguyên tắc chung (General Logic)

- **Live Preview:** Thay đổi áp dụng ngay lập tức lên `EpubReaderScreen` bên dưới.
- **Auto-save:** Lưu vào Local Storage (SharedPreferences/Hive) ngay khi thay đổi.

### 2.2. Font Family (Kiểu chữ)

- **Input:** Chọn từ danh sách (Serif, Sans-serif, Custom...).
- **Process:**
  - Load font asset.
  - Update `TextStyle` toàn cục.
  - **Re-pagination:** Kích hoạt tính toán lại số trang (nếu cần).

### 2.3. Size & Spacing

- **Font Size:**
  - Các mức: 12sp - 40sp.
  - **Anchor Logic:** Giữ vị trí đọc hiện tại (không bị nhảy đoạn) bằng cách neo vào đoạn văn đầu tiên đang hiển thị.
- **Letter Spacing:** Slider điều chỉnh độ giãn ký tự.

### 2.4. Style & Weight

- **Font Weight:** Slider/Select (Light, Normal, Bold).
- **Font Style:** Toggle Italic (In nghiêng).

---

## 📐 [Part 3] Text Layout (Bố cục văn bản)

### 3.1. Text Alignment

- **Options:** Left, Center, Justify.
- **Details:** Justify cần xử lý `Hyphenation` để tránh lỗi "sông trắng" (white rivers).

### 3.2. Line Height (Giãn dòng)

- **Input:** Slider (1.0x - 2.0x).
- **Impact:** Ảnh hưởng lớn đến tổng số trang -> Cần **Re-pagination** & **Anchor Logic**.

### 3.3. Paragraph Format

- **Paragraph Height:** Khoảng cách giữa các đoạn.
- **Indentation:** Thụt đầu dòng đoạn văn.

---

## 🎨 [Part 4] Appearance (Giao diện & Màu sắc)

### 4.1. Color Presets

- **Data:** Mỗi preset gồm `{ BackgroundColor, TextColor, UIOverlayColor }`.
- **Logic:**
  - Áp dụng màu ngay lập tức.
  - **Invert Logic:** Nếu chuyển sang Dark Mode, kiểm tra và đảo màu ảnh biểu đồ (nếu cần).

### 4.2. Fast Change

- **Feature:** Nút tắt đổi nhanh (Cycle: Light -> Sepia -> Dark).

### 4.3. Compact Layout

- **Logic:** Khi ở **Tab 3 (Color)**, ẩn các tiêu đề/divider thừa để tối ưu không gian cho bảng màu.

---

## 🛠️ [Part 5] Tools (Tiện ích)

### 5.1. Double Click Translation

- **Logic:**
  - **ON:** Lắng nghe sự kiện Double Tap -> Lấy text -> Gọi dịch vụ Dịch.
  - **OFF:** Hủy lắng nghe, Double Tap có thể zoom hoặc không làm gì.

### 5.2. Gesture & Execution

- **Conflict:** Xử lý xung đột với Single Tap (hiện menu). Dùng `Timer` để phân biệt.
- **Result:** Hiển thị Popup dịch nhanh.

---

## 🧩 [Part 6] Additional Features (Tham chiếu)

### 6.1. Reading Mode

- **Options:** Pagination (Lật trang) vs Vertical Scroll (Cuộn dọc).
- **Logic:** Thay đổi hoàn toàn cách render (PageView vs ScrollView).

### 6.2. System

- **Brightness:** Override độ sáng màn hình (Overlay opacity).
- **Rotation:** Lock portrait/landscape.

### 6.3. Images

- Tùy chọn: Màu / Đen trắng / Ẩn ảnh.

---

## 📝 [Part 7] Active Reading

### 7.1. Highlight & Annotation

- **Action:** Long press -> Select text -> Floating Menu (Highlight, Note).
- **Storage:** Lưu `CFI` (Canonical Fragment Identifier) + Color + Note vào DB.
- **Render:** Vẽ background color đè lên text tại vị trí CFI tương ứng.

### 7.2. Bookmarks & Search

- **Bookmark:** Lưu CFI trang hiện tại.
- **Search:** Tìm text trong toàn bộ sách (Background Thread) -> Trả về danh sách vị trí.

---

## 🧭 [Part 8] Navigation & UX

### 8.1. Volume Key Navigation

- **Logic:** Intercept sự kiện phím Volume -> Gọi `NextPage` / `PrevPage`.

### 8.2. Gesture Controls

- **Touch Zones:** Chia màn hình 3 vùng (Left/Right: Nav, Center: Menu).
- **Brightness Gesture:** Vuốt dọc cạnh màn hình để chỉnh độ sáng.

### 8.3. Reading Progress & TOC

- **Progress:** Cập nhật % và số trang. Dự đoán thời gian đọc còn lại.
- **TOC (Mục lục):** Auto-highlight chương đang đọc.

---

## 🔊 [Part 9] Audio & Accessibility

### 9.1. Text-to-Speech (TTS)

- **Engine:** Google TTS / System TTS.
- **Sync:** Highlight câu đang đọc. Auto-turn page khi đọc hết trang.

### 9.2. Auto-Scroll

- **Mode:** Chỉ dùng cho Vertical Scroll.
- **Logic:** Scroll `x` pixels mỗi `y` ms. Dừng khi chạm màn hình.

---

## 📚 [Part 10] Library & Data

### 10.1. Import Font

- **Action:** File Picker (ttf, otf).
- **Process:** Validate -> Copy to App Storage -> Save to DB -> Update list.
