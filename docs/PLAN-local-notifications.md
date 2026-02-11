# PLAN-local-notifications.md - Kế hoạch Triển khai Local Notification

## 1. Mục tiêu

* Tích hợp hệ thống Local Notification để tăng tương tác người dùng.
* Thông báo: Nhắc đọc sách, Tiến trình tải, Trạng thái Backup.
* Điều hướng thông minh: Mở thẳng sách đang đọc dở khi bấm vào thông báo nhắc nhở.

## 2. Phân tích Yêu cầu & Giải pháp

* **Loại Notification**: Local Notification (không dùng server push).
* **Thư viện đề xuất**: `flutter_local_notifications`.
* **Các kịch bản sử dụng (Use Cases)**:
    1. **Daily Reading Reminder**: Hẹn giờ cố định hàng ngày (ví dụ 20:00) nhắc đọc sách.
    2. **Download Progress**: Hiển thị thanh tiến trình khi tải sách/bìa sách.
    3. **Backup Status**: Thông báo khi backup thành công hoặc lỗi (quan trọng vì backup chạy ngầm).
* **Điều hướng (Deep Linking/Routing)**:
  * Click vào "Nhắc đọc sách" -> Mở `HomeScreen`.
  * Click vào "Download xong" -> Mở `BookScreen` của sách đó.

## 3. Kiến trúc Đề xuất

### A. Core Service: `NotificationService`

Tạo một service wrapper để quản lý toàn bộ logic notification.

* **Pattern**: Singleton hoặc Injectable Service.
* **Vị trí**: `lib/core/services/notification_service.dart`.
* **Chức năng**:
  * `init()`: Khởi tạo plugin, xin quyền (Android 13+ cần quyền runtime permission).
  * `scheduleDailyReminder(TimeOfDay time)`: Đặt lịch lặp lại hàng ngày.
  * `showDownloadProgress(int id, int progress, String title)`: Hiển thị thanh progress.
  * `showSimpleNotification(String title, String body, {String? payload})`: Thông báo đơn giản.
  * `cancelNotification(int id)`: Hủy thông báo (khi download xong hoặc user tắt nhắc nhở).

### B. Tích hợp Logic (BLoC Integration)

* **Settings**: Cần màn hình cài đặt `SettingNotificationScreen` để user bật/tắt nhắc nhở và chọn giờ.
  * Lưu config vào `SharedPreferences`.
* **Reading Logic**: Khi user bấm vào notification, payload sẽ chứa `bookId`.
  * Xử lý tại `GoRouter` để redirect tới `BookScreen` hoặc mở modal đọc sách.

## 4. Kế hoạch Thực hiện (Implementation Plan)

### Phase 1: Setup & Cơ bản

* [ ] Thêm dependency `flutter_local_notifications` vào `pubspec.yaml`.
* [ ] Cấu hình Android Manifest (permissions, receiver).
* [ ] Cấu hình iOS Info.plist (permissions).
* [ ] Tạo `NotificationService` cơ bản (init, show simple notification).

### Phase 2: Chức năng Nhắc nhở (Reminder)

* [ ] Tạo màn hình `SettingNotificationScreen`.

* [ ] Implement logic `scheduleDailyReminder`.
* [ ] Xử lý sự kiện khi user tap vào notification (Payload handling).
* [ ] Logic tìm "Sách đang đọc dở" (lấy từ database `ReadingHistory` hoặc `LastRead`).

### Phase 3: Chức năng Download & Backup

* [ ] Tích hợp vào `BookResourceCubit` để hiện progress bar khi tải sách.

* [ ] Tích hợp vào `BackupRestoreCubit` để thông báo kết quả backup.

### Phase 4: Testing & Polish

* [ ] Test trên Android (các phiên bản Android 10, 11, 12, 13+).

* [ ] Test trên iOS (Simulator/Device).
* [ ] Đảm bảo notification không spam và có channel phù hợp (Importance levels).

## 5. Danh sách File cần tạo/sửa

1. `pubspec.yaml` (Thêm lib)
2. `lib/core/services/notification_service.dart` (New)
3. `lib/di/injection.dart` (Register service)
4. `lib/ui/settings/screens/setting_notification_screen.dart` (New)
5. `lib/router/router.dart` (Thêm route settings)
6. `lib/router/routes.dart` (Thêm constant)
7. `android/app/src/main/AndroidManifest.xml` (Config)
8. `ios/Runner/Info.plist` (Config)

## 6. Verification Checklist

* [ ] Bấm "Test Notification" hiện thông báo ngay lập tức.

* [ ] Đặt giờ nhắc 20:00 -> Đúng 20:00 máy rung/kêu.
* [ ] Bấm vào thông báo nhắc nhở -> Mở đúng App và nhảy vào sách gần nhất.
* [ ] Tải file -> Thấy thanh loading trên notification center.
