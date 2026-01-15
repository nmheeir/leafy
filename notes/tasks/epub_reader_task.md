# EPUB Reader – TODO

## 1. Data & Database

- [ ] Chỉnh sửa dữ liệu của test screen cho khớp với schema trong database
- [ ] Mapping dữ liệu EPUB (book, chapter, content) sang entity trong database
- [x] Lưu trạng thái đọc (chapter hiện tại, scroll position / page)
- [x] Load lại trạng thái đọc khi mở sách
- [ ] Xử lý migration nếu thay đổi schema liên quan đến EPUB

## 2. EPUB Parsing & Content Handling

- [x] Parse metadata của EPUB (title, author, cover)
- [x] Parse danh sách chapter (TOC)
- [ ] Chuẩn hóa HTML/CSS từ EPUB để render ổn định
- [ ] Xử lý các trường hợp chapter rỗng hoặc lỗi format
- [x] Cache nội dung chapter sau khi parse

## 3. Reader UI / Screen

- [x] Chỉnh sửa layout test screen cho đúng với flow đọc sách thực tế
- [ ] Chỉnh sửa tiêu đề của mỗi chapter (font, size, weight)
- [ ] Đồng bộ style chapter title với content
- [ ] Xử lý scroll mượt khi chuyển chapter
- [ ] Hiển thị loading khi load chapter lớn

## 4. Reader Settings

- [ ] Thêm màn hình setting cho EPUB Reader Screen
- [ ] Thay đổi font chữ (serif / sans-serif / custom)
- [ ] Thay đổi cỡ chữ
- [ ] Thay đổi line height / paragraph spacing
- [ ] Dark mode / Sepia mode / Light mode
- [ ] Lưu setting người dùng vào database hoặc DataStore
- [ ] Áp dụng setting ngay lập tức khi thay đổi

## 5. Navigation & Interaction

- [x] Chuyển chapter trước / sau
- [x] Chọn chapter từ danh sách TOC
- [x] Hiển thị progress đọc (theo chapter hoặc %)
- [x] Tự động lưu progress khi người dùng rời screen
- [x] Khôi phục progress khi quay lại screen

## 6. Performance & Stability

- [ ] Tối ưu render nội dung chapter dài
- [ ] Giới hạn recompose không cần thiết
- [ ] Xử lý memory khi đọc EPUB dung lượng lớn
- [ ] Test với EPUB nhiều chapter / nhiều định dạng khác nhau

## 7. Future Extensions (Optional)

- [ ] Bookmark đoạn đang đọc
- [ ] Highlight text
- [ ] Ghi chú (note) cho đoạn được chọn
- [ ] Tìm kiếm nội dung trong sách

## 8. Local File Management & Import

### 8.1. File Picking & Permissions

- [ ] Cấu hình permission truy cập bộ nhớ cho Android (Scoped Storage) và iOS (Files app)
- [ ] Tích hợp thư viện chọn file (vd: file_picker) để chọn file từ máy
- [ ] Lọc định dạng file cho phép (.epub, .pdf, .mp3, .m4a, .wav)
- [ ] Xử lý chọn một hoặc nhiều file cùng lúc

### 8.2. File Processing & Storage

- [ ] Copy file từ thư mục tạm (cache) sang thư mục lưu trữ nội bộ của ứng dụng (app documents directory)
- [ ] Kiểm tra trùng lặp (check MD5 hash hoặc tên file) trước khi import để tránh tốn dung lượng
- [ ] Đặt tên file theo chuẩn để tránh lỗi ký tự đặc biệt trên các hệ điều hành khác nhau
- [ ] Phân loại file theo extension để gọi đúng parser tương ứng (EPUB Parser / PDF Renderer / Audio Service)

### 8.3. Database Integration

- [ ] Tạo bản ghi mới trong database khi file được import thành công
- [ ] Lưu đường dẫn path (local path) của file vào database
- [ ] Mapping loại file (file_type: 0-EPUB, 1-PDF, 2-Audio) để điều hướng UI khi mở

### 8.4. Metadata Extraction (Initial)

- [ ] Tự động trích xuất cover image từ file PDF/Audio (nếu có) để làm thumbnail
- [ ] Lấy thông tin cơ bản (title, size, duration đối với audio) ngay khi import
- [ ] Hiển thị thông báo (Toast/Snackbar) khi import thành công hoặc thất bại

### 8.5. UI Import Flow

- [ ] Thêm nút "Add Book/Audio" tại màn hình chính hoặc thư viện
- [ ] Hiển thị progress bar khi đang copy/xử lý các file dung lượng lớn
- [ ] Màn hình danh sách file local đã import (Library view)

### 8.6. Cleanup & Maintenance

- [ ] Xử lý xóa file vật lý trong bộ nhớ khi người dùng xóa sách khỏi ứng dụng
- [ ] Kiểm tra tính toàn vẹn của file (check if file exists) mỗi khi mở sách
- [ ] Tính toán tổng dung lượng các file local đang chiếm dụng
