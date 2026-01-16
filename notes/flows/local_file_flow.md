# LOCAL FILE IMPORT FLOW

Nội dung file này mô tả chi tiết luồng nghiệp vụ (Business Logic) cho tính năng Import sách từ bộ nhớ máy (Local File).
Tài liệu được reformat từ bản phác thảo và điều chỉnh để phù hợp với kiến trúc Database hiện tại của ứng dụng Leafy.

## 8.1. FILE PICKING & PERMISSIONS

**Mục tiêu:** Cho phép người dùng chọn file từ thiết bị, đảm bảo quyền truy cập và lọc ra các file hợp lệ trước khi xử lý.

### DATA STRUCTURES

Sử dụng Object tạm thời để lưu trữ kết quả trước khi vào DB.

```dart
class FileTemporaryObject {
  final String path;
  final String name;
  final int size;
  final String extension;
  
  FileTemporaryObject({
    required this.path, 
    required this.name, 
    required this.size,
    required this.extension
  });
}
```

### LOGIC FLOW

**START**: Người dùng nhấn nút "Import File" trên UI.

#### BƯỚC 1: KIỂM TRA QUYỀN TRUY CẬP (PERMISSIONS)

Việc xử lý quyền phụ thuộc vào nền tảng (Platform).

1. **Kiểm tra Platform**:
    * **Android < 13**: Kiểm tra quyền `READ_EXTERNAL_STORAGE`.
    * **Android >= 13**: Kiểm tra quyền `READ_MEDIA_IMAGES` / `READ_MEDIA_VIDEO` / `READ_MEDIA_AUDIO` (tùy vào target) hoặc dùng Photo Picker (nhưng với file sách thường dùng `ACTION_OPEN_DOCUMENT` nên quyền Storage có thể không cần thiết nếu dùng Storage Access Framework SAF). *Tuy nhiên, để đơn giản hóa flow quản lý file chung, ta vẫn xét luồng xin quyền cơ bản nếu cần.*
    * **iOS**: Quyền truy cập thông qua `UIDocumentPickerViewController` không yêu cầu xin quyền `Privacy` explicit cho từng file, nhưng nếu truy cập folder chung thì cần check.

2. **Logic Quyết định**:
    * **IF** (Quyền đã được cấp / Không cần thiết với SAF):
        * -> GOTO: **BƯỚC 2**.
    * **ELSE IF** (Quyền bị từ chối - Denied):
        * Hiển thị Popup giải thích (Rationale): *"Leafy cần quyền truy cập bộ nhớ để đọc file sách của bạn."*
        * Gửi yêu cầu xin quyền (`requestPermission`).
        * **IF** (User Đồng ý): -> GOTO: **BƯỚC 2**.
        * **IF** (User Từ chối): -> Hiển thị Toast/Snackbar "Bạn đã từ chối cấp quyền" -> **END**.
    * **ELSE** (Quyền bị từ chối vĩnh viễn - Permanently Denied):
        * Hiển thị Dialog điều hướng: *"Vui lòng cấp quyền trong Cài đặt để sử dụng tính năng này."*
            * Button "Mở Cài đặt" -> Open App Settings.
            * Button "Hủy" -> **END**.

#### BƯỚC 2: CẤU HÌNH FILE PICKER

Sử dụng thư viện chọn file (VD: `file_picker`).

1. **Cấu hình Filter (Allowed Extensions)**:
    * Chỉ cho phép các định dạng: `['epub', 'pdf', 'mp3', 'm4a', 'wav']`
2. **Cấu hình Mode**:
    * `allowMultiple = true` (Cho phép chọn nhiều file cùng lúc).
    * `type = FileType.custom` (Áp dụng filter trên).
3. **Action**:
    * Gọi hàm mở File Picker của hệ điều hành.

#### BƯỚC 3: XỬ LÝ KẾT QUẢ (RESULT HANDLING)

Nhận kết quả trả về từ `FilePickerResult`.

1. **Kiểm tra Null/Empty**:
    * **IF** (Result == null OR files.isEmpty):
        * Log: "User cancelled picker".
        * -> **END**.

2. **Validatetion & Mapping**:
    * Khởi tạo danh sách kết quả: `List<FileTemporaryObject> validFiles = []`.
    * **LOOP** (Duyệt qua từng `file` trong result):
        * Lấy `extension` từ path (hoặc properties).
        * **IF** (Extension nằm trong danh sách hỗ trợ):
            * Tạo `FileTemporaryObject(path, name, size, extension)`.
            * Add vào `validFiles`.
        * **ELSE**:
            * Bỏ qua file nàuy (hoặc log warning).
    * **END LOOP**.

3. **Điều hướng tiếp theo**:
    * **IF** (`validFiles` không rỗng):
        * -> Chuyển sang flow **8.2. FILE PROCESSING & STORAGE**.
    * **ELSE**:
        * Thông báo UI: "Không tìm thấy file hợp lệ nào."
        * -> **END**.

**OUTPUT**: `List<FileTemporaryObject>` (Danh sách các file thô hợp lệ về định dạng, sẵn sàng xử lý).

## 8.2. FILE PROCESSING & STORAGE

**Mục tiêu:** Xử lý file thô, kiểm tra trùng lặp dựa trên nội dung (Database Check) và lưu trữ vật lý an toàn.

### LOGIC FLOW

**START**: Nhận danh sách `validFiles` từ Bước 8.1.
Khởi tạo vòng lặp **LOOP** qua từng file:

#### BƯỚC 1: TÍNH TOÁN ĐỊNH DANH (IDENTIFICATION)

Để phát hiện trùng lặp chính xác, không dựa vào tên file.

1. **MD5 Hashing**:
    * Đọc bytes của file.
    * Tính mã Hash (MD5 hoặc SHA-256).
    * *Lưu ý:* Nếu file quá lớn (>100MB), chấp nhận xử lý chậm.

#### BƯỚC 2: KIỂM TRA TRÙNG LẶP (DUPLICATE CHECK)

Kiểm tra trong bảng `book_resources` (nơi quản lý file thực tế).

1. **Query DB**:
    * `SELECT id FROM book_resources WHERE file_hash = ?`
2. **Logic**:
    * **IF** (Có kết quả trả về):
        * File này đã tồn tại trong thư viện.
        * Thông báo: *"Sách này đã có trong thư viện."*
        * **SKIP**: Bỏ qua file này, tiếp tục vòng lặp.
    * **ELSE**:
        * File mới -> Tiếp tục xử lý.

#### BƯỚC 3: CHUẨN HÓA TÊN FILE (SANITIZATION)

Đảm bảo tên file an toàn khi lưu vào hệ thống file của App.

1. **Logic chuẩn hóa**:
    * Input: `Tên Sách #1 (Full).epub`
    * Remove ký tự đặc biệt, khoảng trắng thừa.
    * Timestamp suffix (optional): Để tránh trùng tên với file *khác nội dung* nhưng *trùng tên* đã import trước đó.
    * Output: `ten_sach_1_full_171000123.epub`

#### BƯỚC 4: LƯU TRỮ VẬT LÝ (PERSISTENCE)

Copy file từ Cache (thư mục tạm của Picker) vào thư mục riêng của App (Documents Directory).

1. **Xác định đường dẫn**:
    * Target Dir: `ApplicationDocumentsDirectory`.
    * Full Path: `$TargetDir/$SanitizedName`.
2. **Copy File**:
    * `File(tempPath).copy(newPath)`
3. **Error Handling**:
    * **IF** (Lỗi IO / Full Disk):
        * Báo lỗi "Không đủ bộ nhớ".
        * Break Loop.

#### BƯỚC 5: PHÂN LOẠI (CATEGORIZATION)

Chuẩn bị dữ liệu để Insert DB.

1. **Xác định `format`**:
    * Dựa vào extension: `.epub` -> `epub`, `.pdf` -> `pdf`.
2. **Tạo Object trung gian (ProcessedFile)**:
    * Gồm: `path` (mới), `hash`, `size`, `format`, `originalName`.

**END LOOP**.

---

## 8.3. DATABASE INTEGRATION

**Mục tiêu:** Thêm metadata vào Database, liên kết file vừa tải với một cuốn sách **đã tồn tại**.
*Lưu ý: Flow này giả định rằng người dùng đang thao tác trong ngữ cảnh của một cuốn sách (đã có `book_id`), hoặc đã chọn sách từ danh sách trước đó.*

### LOGIC FLOW

**START**: Nhận `ProcessedFile` từ Bước 8.2 VÀ `existingBookId`.

**LOOP** (Mỗi file processed):

#### BƯỚC 1: DB TRANSACTION BEGIN

#### BƯỚC 2: INSERT 'BOOK_RESOURCES' TABLE

Liên kết file vật lý với sách đã chọn.

* **Logic tạo dữ liệu**:
  * `book_id`: `existingBookId` (Input).
  * `uuid`: Generate UUID mới.
  * `format`: Lấy từ ProcessedFile.
  * `storage_type`: `'local'`.
  * `file_path`: Đường dẫn file mới (Relative Path).
  * `file_hash`: Lấy từ ProcessedFile.
  * `file_size`: Lấy từ ProcessedFile.
* **Execute INSERT**:
  * Lưu lại `newResourceId`.

#### BƯỚC 3: INSERT 'READER_PROGRESS' TABLE

Khởi tạo trạng thái đọc cho file mới này.

* **Logic tạo dữ liệu**:
  * `resource_id`: `newResourceId`.
  * `progress_pct`: `0.0`.
  * `locator`: `empty` hoặc JSON khởi tạo.
* **Execute INSERT**.

#### BƯỚC 4: DB TRANSACTION COMMIT

#### BƯỚC 5: TRIGGER METADATA EXTRACTION

Gửi `existingBookId`, `newResourceId` và `filePath` vào hàng đợi xử lý Background.
*Mục đích:* Cập nhật bổ sung thông tin cho sách (nếu sách đang thiếu) hoặc tính toán số trang cho resource.

**END LOOP**.

---

## 8.4. METADATA EXTRACTION (BACKGROUND)

**Mục tiêu:** Trích xuất thông tin kỹ thuật (Số trang, Duration) cho resource. *Chỉ cập nhật thông tin sách (Title/Author) nếu thực sự cần thiết hoặc sách đang thiếu info.*

### LOGIC FLOW

**START**: Nhận `bookId`, `resourceId`, `filePath`, `format`.

#### BƯỚC 1: PARSE METADATA

Tùy vào format:

* **EPUB**:
  * Parse `container.xml` -> `.opf`.
  * Lấy: Title, Author, Description, Cover.
* **PDF**:
  * Đếm số trang (`pages`).
  * `pdf_renderer` render bìa (nếu sách chưa có bìa).
* **AUDIO**:
  * Lấy `duration` (Thời lượng).

#### BƯỚC 2: ANALYZE & UPDATE

Kiểm tra xem sách hiện tại (`books` table) đã có đủ thông tin chưa.

1. **Lấy thông tin sách hiện tại**: `SELECT * FROM books WHERE id = bookId`.
2. **Logic Logic Update**:
    * **Title/Author**: *KHÔNG* tự động ghi đè (vì User đã tạo sách với tên họ muốn). Chỉ update nếu `books.title` là NULL hoặc "New Book".
    * **Cover**: Chỉ update nếu `books.has_cover == 0`.
    * **Pages/Duration**:
        * Đây là thông tin gắn liền với Resource, nhưng schema hiện tại `pages` nằm ở `books`.
        * *Chiến lược:* Nếu `books.pages` NULL -> Update. Nếu không, có thể giữ nguyên (hoặc update theo resource mới nhất).
        * *Lưu ý:* Nếu schema tương lai hỗ trợ `book_resources.metadata`, nên lưu số trang vào đó.

#### BƯỚC 3: UPDATE DATABASE

Thực hiện lệnh SQL Update dựa trên logic trên.

* **SQL Update (Ví dụ)**:

    ```sql
    UPDATE books
    SET 
        pages = COALESCE(pages, ?),       -- Chỉ update nếu null
        has_cover = CASE WHEN has_cover = 0 THEN 1 ELSE has_cover END,
        cover_url = COALESCE(cover_url, ?) -- Update bìa nếu chưa có
    WHERE id = [bookId]
    ```

#### BƯỚC 4: NOTIFY UI

Bắn sự kiện để UI reload.

---

## 8.5. UI FEEDBACK

**Mục tiêu:** Thông báo cho người dùng kết quả của quá trình.

1. **Loading**:
    * Hiển thị Progress Indicator khi đang Copy/Hash file.
2. **Partial/Full Success**:
    * Snackbar: "Đã thêm X sách vào thư viện."
    * Tự động refresh danh sách sách.
3. **Error**:
    * Dialog/Snackbar chi tiết nếu lỗi (VD: "Không hỗ trợ định dạng này").

---

## 8.6. CLEANUP & DELETE FLOW

**Mục tiêu:** Khi xóa sách, phải xóa sạch cả DB lẫn File (tránh rác bộ nhớ).

### LOGIC DELETE

1. **Query Info**: Lấy `file_path` từ `book_resources` của sách cần xóa.
2. **Delete DB**:
    * Delete `reader_progress` WHERE resource_id...
    * Delete `book_resources` WHERE book_id...
    * Delete `books` WHERE id...
    * *(Nếu thiết kế có Cascade Delete ở DB level thì chỉ cần xóa books)*.
3. **Delete Files**:
    * Kiểm tra `file_path`. Nếu tồn tại -> `File(path).delete()`.
    * Xóa luôn file thumbnail (nếu có logic đặt tên theo ID).
