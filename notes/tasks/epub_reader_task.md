# EPUB Reader – TODO

## 1. Data & Database
- [ ] Chỉnh sửa dữ liệu của test screen cho khớp với schema trong database
- [ ] Mapping dữ liệu EPUB (book, chapter, content) sang entity trong database
- [ ] Lưu trạng thái đọc (chapter hiện tại, scroll position / page)
- [ ] Load lại trạng thái đọc khi mở sách
- [ ] Xử lý migration nếu thay đổi schema liên quan đến EPUB

## 2. EPUB Parsing & Content Handling
- [ ] Parse metadata của EPUB (title, author, cover)
- [ ] Parse danh sách chapter (TOC)
- [ ] Chuẩn hóa HTML/CSS từ EPUB để render ổn định
- [ ] Xử lý các trường hợp chapter rỗng hoặc lỗi format
- [ ] Cache nội dung chapter sau khi parse

## 3. Reader UI / Screen
- [ ] Chỉnh sửa layout test screen cho đúng với flow đọc sách thực tế
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
- [ ] Chuyển chapter trước / sau
- [ ] Chọn chapter từ danh sách TOC
- [ ] Hiển thị progress đọc (theo chapter hoặc %)
- [ ] Tự động lưu progress khi người dùng rời screen
- [ ] Khôi phục progress khi quay lại screen

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
