Để hiểu rõ vai trò của từng API, trước hết bạn cần nắm rõ cấu trúc dữ liệu của Open Library (OL). OL phân cấp sách theo mô hình: **Tác giả (Author) > Tác phẩm (Work) > Ấn bản (Edition)**.

Dưới đây là giải thích chi tiết vai trò của từng loại API:

---

### 1. Search API (Ưu tiên, đa năng)

* **Vai trò:** Đây là "cửa ngõ" chính để tìm kiếm. Nó hoạt động giống như thanh tìm kiếm trên trang web.
* **Khi nào dùng:** Khi bạn chỉ có các từ khóa chung chung như tên sách, tên tác giả, hoặc chủ đề (ví dụ: tìm "Harry Potter" hoặc "Lập trình Python").
* **Đặc điểm:** Trả về một danh sách các kết quả khớp với từ khóa. Từ kết quả này, bạn sẽ lấy được các ID (Work ID hoặc Edition ID) để dùng cho các API chuyên sâu bên dưới.

### 2. Works API (Theo Work ID)

* **Vai trò:** Cung cấp dữ liệu ở cấp độ **Tác phẩm**.
* **Khái niệm:** Một "Work" là thực thể trừu tượng đại diện cho nội dung cốt lõi (ví dụ: cuốn sách *Chiến tranh và Hòa bình* nói chung).
* **Khi nào dùng:** Khi bạn muốn lấy thông tin chung như: tóm tắt nội dung, danh sách các tác giả, hoặc các chủ đề (subjects).
* **Dữ liệu:** Nó **không** chứa thông tin về nhà xuất bản hay số trang, vì mỗi lần in ấn (ấn bản) sẽ khác nhau.

### 3. Editions API (Theo Edition ID)

* **Vai trò:** Cung cấp dữ liệu cụ thể về một **lần xuất bản** nhất định.
* **Khi nào dùng:** Khi bạn cần thông tin vật lý thực tế của cuốn sách: nhà xuất bản, năm xuất bản, số trang, loại bìa (cứng hay mềm), ngôn ngữ cụ thể của bản dịch đó.
* **Dữ liệu:** Rất chi tiết nhưng chỉ giới hạn trong đúng ấn bản đó.

### 4. ISBN API (Theo mã ISBN)

* **Vai trò:** Là một "lối tắt" (shortcut) để đi thẳng đến **Editions API**.
* **Khi nào dùng:** Khi bạn đang cầm một cuốn sách trên tay và có mã vạch ISBN (10 hoặc 13 số).
* **Cách hoạt động:** Thay vì phải tìm ID của Open Library, bạn dùng trực tiếp mã ISBN để lấy dữ liệu. Hệ thống sẽ tự động chuyển hướng hoặc trả về dữ liệu của Ấn bản (Edition) tương ứng với mã đó.

### 5. Books API (Legacy - Cũ/Chung)

* **Vai trò:** Đây là một API đời cũ (Legacy), được thiết kế để tương thích với cấu trúc của Google Books API.
* **Khi nào dùng:** Thường dùng để nhúng các nút "Xem trước" (Preview) hoặc lấy thông tin nhanh để hiển thị trên web bằng Javascript.
* **Đặc điểm:** Nó cho phép bạn gửi một danh sách nhiều mã (ISBN, OCLC, LCCN) cùng lúc để kiểm tra xem Open Library có sách đó không và có cho phép đọc trực tuyến hay không.

### 6. Book Search API

* **Vai trò:** Một biến thể chuyên sâu của Search API nhưng tập trung tối đa vào việc trả về các trường dữ liệu cần thiết để định danh sách.
* **Khi nào dùng:** Khi bạn muốn xây dựng tính năng tìm kiếm tích hợp trong ứng dụng mà cần kết quả trả về gọn nhẹ, có sẵn các thông tin như mã ISBN hay ID để tiếp tục truy vấn các API khác.

---

### Bảng tóm tắt nhanh:

| API | Bạn có gì? | Bạn nhận được gì? |
| --- | --- | --- |
| **Search** | Từ khóa tự do | Danh sách các sách tiềm năng |
| **Works** | ID bắt đầu bằng `OL...W` | Tóm tắt, Tác giả, Chủ đề chung |
| **Editions** | ID bắt đầu bằng `OL...M` | Nhà XB, Số trang, Năm phát hành |
| **ISBN** | Mã vạch 10/13 số | Dữ liệu chi tiết của ấn bản đó |
| **Books (Legacy)** | Nhiều mã ISBN/LCCN | Link xem trước, ảnh bìa nhanh |

Bạn có muốn tôi thử viết một ví dụ mã (code) gọi thử một trong các API này để bạn xem kết quả thực tế không?