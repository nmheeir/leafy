class DbConstants {
  static const dbName = 'leafy.db';
  static const dbVersion = 1;

  // =====================================================
  // 1. Bảng BOOKS – metadata thuần của sách
  // =====================================================
  static const createBooksTable = '''
    CREATE TABLE books (
      id INTEGER PRIMARY KEY AUTOINCREMENT, -- ID nội bộ (FK reference)
      title TEXT,                           -- Tên sách
      subtitle TEXT,                        -- Phụ đề
      author TEXT,                          -- Tác giả
      description TEXT,                     -- Mô tả / giới thiệu sách
      book_format TEXT,                     -- Thể loại sách (paperback, hardcover, audiobook, ebook)
      status INTEGER,                       -- Trạng thái đọc (inprogress / reading / finished / forlater)
      rating INTEGER,                       -- Đánh giá người dùng (1 - 5)
      favorite INTEGER,                     -- Đánh dấu yêu thích (0/1)
      deleted INTEGER,                      -- Soft delete (0/1)
      start_date TEXT,                      -- Ngày bắt đầu đọc
      finish_date TEXT,                     -- Ngày hoàn thành
      pages INTEGER,                        -- Tổng số trang (tham khảo)
      publication_year INTEGER,             -- Năm xuất bản
      tags TEXT,                            -- Tag người dùng
      my_review TEXT,                       -- Review cá nhân
      notes TEXT,                           -- Ghi chú chung về sách
      has_cover INTEGER DEFAULT 0,          -- Có ảnh cover hay không
      blur_hash TEXT,                       -- BlurHash cho placeholder cover
      date_added TEXT,                      -- Thời điểm thêm vào thư viện
      date_modified TEXT                    -- Thời điểm cập nhật metadata
    )
  ''';

  // =====================================================
  // 3. BOOK RESOURCES – Quản lý file (Local & Remote)
  // =====================================================
  static const createBookResoucesTable = '''
    CREATE TABLE book_resources (
      id INTEGER PRIMARY KEY AUTOINCREMENT, -- ID nội bộ (FK reference)
      uuid TEXT UNIQUE NOT NULL,            -- ID domain (nhận từ Gutendex hoặc tự gen)
      book_id INTEGER NOT NULL,             -- FK → books.id
      format TEXT NOT NULL,                 -- epub | pdf | audio
      
      storage_type TEXT DEFAULT 'local',    -- 'local' | 'remote'
      url TEXT,                             -- Link tải gốc (VD: link gutendex). Dùng để re-download.
      file_path TEXT,                       -- Đường dẫn local (NULL nếu chưa tải)
      
      file_hash TEXT,                       
      file_size INTEGER,                    
      language TEXT,                        
      created_at INTEGER,                  
      FOREIGN KEY (book_id) REFERENCES booksTable (id) ON DELETE CASCADE
    );
  ''';

  // =====================================================
  // 4. READING SESSIONS – log lịch sử đọc (analytics)
  // =====================================================
  static const createReadingSessionsTable = '''
    CREATE TABLE reading_sessions (
      id TEXT PRIMARY KEY,                  -- UUID của session đọc
      resource_id INTEGER NOT NULL,             -- FK → booksResource.id (có thể migrate sang resource_id)
      start_time INTEGER NOT NULL,           -- Thời điểm bắt đầu đọc (ms)
      end_time INTEGER NOT NULL,             -- Thời điểm kết thúc đọc (ms)
      duration_ms INTEGER NOT NULL,          -- Thời gian đọc thực tế

      chapter_index INTEGER,                -- Chương đang đọc (tham khảo)

      -- Vị trí đọc
      start_locator TEXT,                   -- Vị trí đọc lúc bắt đầu
      end_locator TEXT,                     -- Vị trí đọc lúc kết thúc

      FOREIGN KEY (resource_id) REFERENCES book_resources (id) ON DELETE CASCADE
    )
  ''';

  // Index tối ưu query thống kê theo thời gian
  static const createSessionTimeIndex =
      'CREATE INDEX idx_sessions_time ON reading_sessions (start_time)';

  // =====================================================
  // 5. READER PROGRESS – trạng thái đọc hiện tại (resume)
  // =====================================================
  static const createReaderProgressTable = '''
    CREATE TABLE reader_progress (
      resource_id INTEGER PRIMARY KEY,      -- FK → book_resources.id (1 file = 1 progress)
      locator TEXT,                         -- Vị trí đọc (CFI / page / anchor)
      progress_pct REAL DEFAULT 0.0,        -- % hoàn thành (0.0 - 1.0)
      last_read_at INTEGER,                 -- Timestamp lần đọc cuối
      FOREIGN KEY (resource_id) REFERENCES book_resources (id)
    );
  ''';

  // =====================================================
  // Migration placeholder
  // =====================================================
  static const migrateV1toV2 = [];
}
