# Luồng xử lý sau khi đọc xong sách

Dựa trên schema database hiện tại (`db_constants.dart`), dưới đây là luồng xử lý chuẩn khi người dùng đọc đến trang cuối cùng của sách.

## 1. Giai đoạn: Đang đọc (Trong Reader)

Mục tiêu: Cập nhật dữ liệu đọc xong mà không làm gián đoạn trải nghiệm người dùng.

- **Lắng nghe sự kiện lật trang/cuộn**: Khi người dùng đi đến vị trí cuối cùng của sách.
- **Đánh dấu hoàn thành (Mark as Finished)**:
  - Nếu `current_locator` xác định là đã hết sách:
    - Cập nhật bảng `reader_progress`: Set `progress_pct = 1.0`.
    - Cập nhật bảng `books`:
      - Set `status = [Finished Value]` (Ví dụ: `2` nếu `Finished` enum là 2).
      - Set `finish_date = [Current Timestamp/Text]`.
  - **Lưu ý**: KHÔNG hiện Dialog/Popup chúc mừng ngay lúc này để tránh làm đứt mạch cảm xúc.

- **Cơ chế Auto-save**:
  - Mỗi 30 giây (hoặc khi pause): Lưu `duration_ms` vào SQLite để đảm bảo thống kê thời gian đọc chính xác.

## 2. Giai đoạn: Thoát khỏi sách (Trình đóng phiên)

Khi người dùng nhấn nút Back hoặc đóng Reader:

1. **Lưu dữ liệu phiên đọc**:
   - Ghi nhận `end_time` (timestamp kết thúc).
   - Lưu `duration_ms` (tổng thời gian phiên này).
   - Lưu `end_locator` vào bảng `reading_sessions`.

2. **Đóng màn hình & Truyền tín hiệu**:
   - Thực hiện `Navigator.pop(context, result)`.
   - `result` là một Map hoặc Object chứa cờ báo hiệu:

     ```dart
     Navigator.pop(context, {
       "is_just_finished": true // Cờ này bật LẦN ĐẦU TIÊN khi progress chạm 100% trong phiên này
     });
     ```

## 3. Giai đoạn: Quay lại màn hình Chi tiết sách (Xử lý chúc mừng)

Màn hình chi tiết sách (`BookScreen`) sẽ nhận kết quả trả về từ `Navigator.push`.

- **Kiểm tra tín hiệu**:
  - Kiểm tra xem kết quả trả về có `is_just_finished == true` hay không.

- **Kích hoạt UI**:
  - **NẾU** `is_just_finished == true`:
    - Hiển thị **Celebration Dialog**:
      - "Chúc mừng bạn đã hoàn thành cuốn [Tên Sách]!"
      - Hiển thị thống kê phiên đọc hoặc tổng quan sách nếu muốn.
  - **KHÔNG** cần kiểm tra hay update cột `has_celebrated` trong DB (vì cột này không tồn tại trong schema). Việc hiển thị chỉ dựa hoàn toàn vào tín hiệu "vừa mới đọc xong" từ màn hình Reader gửi về.
