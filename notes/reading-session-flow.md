# Yêu cầu: Xây dựng hệ thống Reading Session Tracking cho Leafy

Hãy đóng vai một chuyên gia Flutter thực hiện xây dựng chức năng ghi nhận và quản lý phiên đọc (Reading Session) cho ứng dụng. Mục tiêu là theo dõi thời gian và tiến độ đọc thực tế của người dùng một cách chính xác.

## 1. Tham chiếu dự án (Context)

Trước khi bắt đầu, hãy đọc và hiểu các thành phần hiện có:

- **Schema:** [lib/core/database/db_constants.dart](cci:7://file:///Users/phucnt63/Documents/flutter/leafy/lib/core/database/db_constants.dart:0:0-0:0) (Bảng `reading_sessions` và `reader_progress` đã được định nghĩa).
- **Data Model:** [lib/data/models/reading_session/reading_session_model.dart](cci:7://file:///Users/phucnt63/Documents/flutter/leafy/lib/data/models/reading_session/reading_session_model.dart:0:0-0:0).
- **Domain:** [lib/domain/reading_session/](cci:7://file:///Users/phucnt63/Documents/flutter/leafy/lib/domain/reading_session:0:0-0:0) (Repository và Entities hiện còn trống).
- **Integration Point:** [lib/ui/test/cubit/test_cubit.dart](cci:7://file:///Users/phucnt63/Documents/flutter/leafy/lib/ui/test/cubit/test_cubit.dart:0:0-0:0) và [lib/ui/test/test_screen.dart](cci:7://file:///Users/phucnt63/Documents/flutter/leafy/lib/ui/test/test_screen.dart:0:0-0:0).

## 2. Kế hoạch triển khai (Thực hiện tuần tự từng luồng)

### Luồng 1: Ghi nhận Phiên đọc (Core Flow)

Đây là luồng chính để ghi lại dữ liệu mỗi khi người dùng tương tác với sách.

- **Bắt đầu (Start):**
  - Khởi tạo UUID duy nhất.
  - Lưu `resource_id`, `start_time` (timestamp), và `start_locator` (vị trí hiện tại).
- **Theo dõi (Tracking):** Duy trì một timer tạm thời để tính toán `Active Time`.
- **Kết thúc (End):**
  - Ghi nhận `end_time` và `end_locator`.
  - Tính toán `duration_ms` (thời gian hoạt động thực tế).
  - Cập nhật `progress_pct` trong bảng `reader_progress`.

### Luồng 2: Xử lý Active Time (Thời gian thực đọc)

Đảm bảo `duration_ms` phản ánh chính xác thời gian người dùng thực sự đọc:

- **Định nghĩa "Active":** Một giây được tính là active nếu có tương tác (cuộn, lật trang) HOẶC màn hình đang mở và chưa quá timeout.
- **Cơ chế Tạm dừng (Pause/Resume):**
  - Sử dụng `WidgetsBindingObserver` để tự động tạm dừng timer khi ứng dụng xuống Background (vào app khác, có cuộc gọi).
  - Tiếp tục đếm khi người dùng quay lại (Resume).
- **Xử lý Idle (Treo máy):** Nếu sau 2-3 phút không có tương tác, hệ thống coi như ngừng đọc và tạm dừng đếm `duration_ms`.

### Luồng 3: Xử lý Gián đoạn & Timeout (Cleanup Flow)

- **Auto-Close Session:** Cập nhật bản ghi session vào SQLite mỗi 30 giây (với `end_time` tạm thời) để tránh mất dữ liệu khi app bị kill đột ngột.
- **Giới hạn Session:** Nếu một phiên kéo dài bất thường (>6 tiếng), tự động đóng phiên tại thời điểm tương tác cuối cùng.

### Luồng 4: Thống kê và Phân tích (Analytics)

- **Heatmap:** Truy vấn dựa trên `start_time` để vẽ biểu đồ mật độ đọc theo khung giờ.
- **Tốc độ đọc:** Tính bằng [(khoảng cách locator) / duration_ms](cci:2://file:///Users/phucnt63/Documents/flutter/leafy/lib/ui/test/cubit/test_cubit.dart:14:0-119:1) (Trang/phút hoặc Ký tự/phút).
- **Thống kê theo thời gian:** Cộng dồn `duration_ms` theo ngày/tuần.

### Luồng 5: Quản lý Dữ liệu (Maintenance)

- Đảm bảo `ON DELETE CASCADE` hoạt động khi xóa sách.
- Tối ưu hóa truy vấn bằng `idx_sessions_time` trên cột `start_time`.

## 3. Quy tắc thực hiện

- Sử dụng **Clean Architecture**.
- Code phải có log đầy đủ để debug luồng tracking.
- **Thực hiện lần lượt từng luồng một.** Sau mỗi luồng, hãy kiểm tra tính đúng đắn trước khi sang luồng tiếp theo.

Hãy bắt đầu với **Luồng 1 (Core Flow)** bằng cách hoàn thiện Repository và tích hợp logic Start/End vào Cubit.
