# PLAN: Tag Database Redesign

**Ngày tạo:** 2026-01-28  
**Agent:** backend-specialist + database-design  
**Status:** 📋 Planning  

---

## 🎯 Mục tiêu

Thiết kế lại tag system từ cách lưu "join bằng `|||||`" sang **normalized relational schema** với:

- Many-to-many relationship (books ↔ tags)
- Tag metadata (color, icon, priority)
- System tags vs User tags
- Soft delete support
- Optimized cho advanced queries

---

## 📊 Current Schema (Problematic)

```dart
// db_constants.dart - Line 24
tags TEXT,  // "Fiction|||||Science|||||History" ❌
```

**Vấn đề:**

1. ❌ Không thể query hiệu quả (LIKE '%tag%' không dùng index)
2. ❌ Không có metadata cho tags
3. ❌ Khó đếm số sách theo tag
4. ❌ Không phân biệt system vs user tags
5. ❌ Không có soft delete
6. ❌ Violate first normal form (1NF)

---

## 🏗️ New Schema Design

### **1. Table: `tags`**

Centralized tag management với metadata.

```sql
CREATE TABLE tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE,           -- Tag name (unique constraint)
  
  -- Metadata
  color INTEGER,                        -- Color code (int của Color trong Flutter)
  icon TEXT,                            -- Icon name hoặc Unicode
  priority INTEGER DEFAULT 0,           -- Thứ tự ưu tiên (dùng cho sorting)
  
  -- Type & Classification
  is_system INTEGER DEFAULT 0,          -- 1 = system tag, 0 = user tag
  category TEXT,                        -- Category nhóm tag (optional)
  
  -- Lifecycle
  deleted INTEGER DEFAULT 0,            -- Soft delete (0 = active, 1 = deleted)
  created_at TEXT NOT NULL,             -- Timestamp tạo
  updated_at TEXT NOT NULL              -- Timestamp cập nhật cuối
);

-- Indexes
CREATE INDEX idx_tags_name ON tags (name);
CREATE INDEX idx_tags_deleted ON tags (deleted);
CREATE INDEX idx_tags_system ON tags (is_system);
```

**Design Decisions:**

- `UNIQUE (name)`: Tránh duplicate tags
- `is_system`: Phân biệt "Recently Read" (system) vs "Kinh tế" (user)
- `priority`: Sort tags theo thứ tự quan trọng
- `deleted`: Soft delete để preserve history

---

### **2. Table: `book_tags` (Junction Table)**

Many-to-many relationship giữa books và tags.

```sql
CREATE TABLE book_tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  book_id INTEGER NOT NULL,             -- FK → books.id
  tag_id INTEGER NOT NULL,              -- FK → tags.id
  
  -- Metadata cho relationship
  order_index INTEGER DEFAULT 0,        -- Thứ tự hiển thị tag trong book
  created_at TEXT NOT NULL,             -- Timestamp gắn tag
  
  FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE,
  
  UNIQUE (book_id, tag_id)              -- Tránh duplicate relationship
);

-- Indexes
CREATE INDEX idx_book_tags_book ON book_tags (book_id);
CREATE INDEX idx_book_tags_tag ON book_tags (tag_id);
CREATE INDEX idx_book_tags_created ON book_tags (created_at);
```

**Design Decisions:**

- `UNIQUE (book_id, tag_id)`: Một sách không thể có duplicate tag
- `order_index`: User có thể sắp xếp tags theo ý thích
- `created_at`: Track khi nào tag được gắn (cho trending analysis)
- **Composite indexes**: Tối ưu cho queries phổ biến

---

## 🔍 Query Patterns & Solutions

### **1. Discovery Queries**

#### **A. Tags thường đi kèm (Frequently Tagged Together)**

```sql
-- Tìm tags hay đi kèm với tag "Kinh tế" (tag_id = 1)
SELECT 
  t.id, t.name, COUNT(*) as co_occurrence
FROM book_tags bt1
JOIN book_tags bt2 ON bt1.book_id = bt2.book_id
JOIN tags t ON bt2.tag_id = t.id
WHERE bt1.tag_id = 1          -- "Kinh tế"
  AND bt2.tag_id != 1         -- Loại trừ chính nó
  AND t.deleted = 0
GROUP BY t.id, t.name
ORDER BY co_occurrence DESC
LIMIT 5;
```

#### **B. Sách tương đồng (Related Books)**

```sql
-- Tìm sách tương đồng với book_id = 10
-- Dựa trên số tag chung
SELECT 
  b.id, b.title, COUNT(*) as shared_tags
FROM books b
JOIN book_tags bt ON b.id = bt.book_id
WHERE bt.tag_id IN (
  SELECT tag_id FROM book_tags WHERE book_id = 10
)
AND b.id != 10
AND b.deleted = 0
GROUP BY b.id, b.title
ORDER BY shared_tags DESC, b.rating DESC
LIMIT 10;
```

#### **C. Tìm kiếm loại trừ (Negative Filtering)**

```sql
-- Sách có "Trinh thám" NHƯNG KHÔNG có "Kinh dị"
SELECT DISTINCT b.*
FROM books b
JOIN book_tags bt ON b.id = bt.book_id
WHERE bt.tag_id = (SELECT id FROM tags WHERE name = 'Trinh thám')
  AND b.id NOT IN (
    SELECT book_id FROM book_tags 
    WHERE tag_id = (SELECT id FROM tags WHERE name = 'Kinh dị')
  )
  AND b.deleted = 0;
```

---

### **2. Analytics Queries**

#### **A. Trending Tags (Tag "nóng" theo thời gian)**

```sql
-- Top 10 tags được đọc nhiều nhất trong tháng này
WITH current_month_sessions AS (
  SELECT 
    resource_id,
    SUM(duration_ms) as total_duration
  FROM reading_sessions
  WHERE start_time >= strftime('%s', 'now', 'start of month') * 1000
  GROUP BY resource_id
)
SELECT 
  t.id, t.name, t.color,
  COUNT(DISTINCT bt.book_id) as book_count,
  SUM(cms.total_duration) as total_reading_time
FROM tags t
JOIN book_tags bt ON t.id = bt.tag_id
JOIN book_resources br ON bt.book_id = br.book_id
JOIN current_month_sessions cms ON br.id = cms.resource_id
WHERE t.deleted = 0
GROUP BY t.id, t.name, t.color
ORDER BY total_reading_time DESC
LIMIT 10;
```

#### **B. Reading Mix (Phân bổ thể loại)**

```sql
-- Tính % reading mix cho biểu đồ Pie Chart
SELECT 
  t.name,
  t.color,
  COUNT(DISTINCT bt.book_id) as book_count,
  ROUND(COUNT(DISTINCT bt.book_id) * 100.0 / (
    SELECT COUNT(DISTINCT book_id) FROM book_tags
  ), 2) as percentage
FROM tags t
JOIN book_tags bt ON t.id = bt.tag_id
WHERE t.deleted = 0
GROUP BY t.id, t.name, t.color
ORDER BY book_count DESC;
```

---

### **3. Maintenance Queries**

#### **A. Orphaned Tags (Tags "mồ côi")**

```sql
-- Tìm tags không được gắn cho cuốn sách nào
SELECT t.*
FROM tags t
LEFT JOIN book_tags bt ON t.id = bt.tag_id
WHERE bt.id IS NULL
  AND t.is_system = 0     -- Chỉ user tags
  AND t.deleted = 0;
```

#### **B. Merge Tags**

```sql
-- Merge "Phát triển bản thân" → "Self-help"
-- Step 1: Update book_tags
UPDATE book_tags
SET tag_id = (SELECT id FROM tags WHERE name = 'Self-help')
WHERE tag_id = (SELECT id FROM tags WHERE name = 'Phát triển bản thân');

-- Step 2: Soft delete old tag
UPDATE tags
SET deleted = 1, updated_at = datetime('now')
WHERE name = 'Phát triển bản thân';
```

---

### **4. Complex Queries**

#### **A. Intersection (AND logic)**

```sql
-- Sách có tag "Ngoại ngữ" AND status "Finished" AND rating > 4
SELECT b.*
FROM books b
JOIN book_tags bt ON b.id = bt.book_id
JOIN tags t ON bt.tag_id = t.id
WHERE t.name = 'Ngoại ngữ'
  AND b.status = 2          -- Finished
  AND b.rating > 4
  AND b.deleted = 0;
```

#### **B. Tag Statistics by Author**

```sql
-- Tác giả X thường viết về chủ đề nào?
SELECT 
  t.name,
  COUNT(*) as book_count
FROM books b
JOIN book_tags bt ON b.id = bt.book_id
JOIN tags t ON bt.tag_id = t.id
WHERE b.author = 'Haruki Murakami'
  AND b.deleted = 0
  AND t.deleted = 0
GROUP BY t.id, t.name
ORDER BY book_count DESC;
```

---

## 📝 Implementation Tasks

### **Phase 1: Schema Update**

- [ ] **Task 1.1:** Update `db_constants.dart`
  - Add `createTagsTable`
  - Add `createBookTagsTable`
  - Add indexes
  - Remove `tags TEXT` from `books` table
  - Bump `dbVersion` → `3`

- [ ] **Task 1.2:** Create migration script
  - Add to `migrateV2toV3` constant
  - Drop `tags` column from books
  - Create new tables

**Verification:**

```bash
# Inspect database schema
sqlite3 leafy.db ".schema tags"
sqlite3 leafy.db ".schema book_tags"
```

---

### **Phase 2: Data Models**

- [ ] **Task 2.1:** Create `Tag` entity

  ```dart
  // lib/core/database/entities/tag.dart
  @Entity(tableName: 'tags')
  class Tag {
    @PrimaryKey(autoGenerate: true)
    final int? id;
    final String name;
    final int? color;
    final String? icon;
    final int priority;
    final int isSystem;
    final String? category;
    final int deleted;
    final String createdAt;
    final String updatedAt;
  }
  ```

- [ ] **Task 2.2:** Create `BookTag` entity

  ```dart
  // lib/core/database/entities/book_tag.dart
  @Entity(
    tableName: 'book_tags',
    foreignKeys: [
      ForeignKey(
        entity: Book,
        parentColumns: ['id'],
        childColumns: ['book_id'],
        onDelete: ForeignKeyAction.cascade,
      ),
      ForeignKey(
        entity: Tag,
        parentColumns: ['id'],
        childColumns: ['tag_id'],
        onDelete: ForeignKeyAction.cascade,
      ),
    ]
  )
  class BookTag {
    @PrimaryKey(autoGenerate: true)
    final int? id;
    final int bookId;
    final int tagId;
    final int orderIndex;
    final String createdAt;
  }
  ```

- [ ] **Task 2.3:** Update `Book` entity
  - Remove `tags` field
  - Add relationship annotation if using Floor

**Verification:**

```bash
# Run build_runner (đã chạy sẵn)
dart run build_runner build
```

---

### **Phase 3: Database DAOs**

- [ ] **Task 3.1:** Create `TagDao`

  ```dart
  @dao
  abstract class TagDao {
    // Basic CRUD
    @Query('SELECT * FROM tags WHERE deleted = 0 ORDER BY priority DESC')
    Stream<List<Tag>> watchAllActiveTags();
    
    @Query('SELECT * FROM tags WHERE id = :id')
    Future<Tag?> findTagById(int id);
    
    @Query('SELECT * FROM tags WHERE name = :name AND deleted = 0')
    Future<Tag?> findTagByName(String name);
    
    @insert
    Future<int> insertTag(Tag tag);
    
    @update
    Future<void> updateTag(Tag tag);
    
    // Soft delete
    @Query('UPDATE tags SET deleted = 1, updated_at = :timestamp WHERE id = :id')
    Future<void> softDeleteTag(int id, String timestamp);
    
    // Find orphaned tags
    @Query('''
      SELECT t.* FROM tags t
      LEFT JOIN book_tags bt ON t.id = bt.tag_id
      WHERE bt.id IS NULL AND t.is_system = 0 AND t.deleted = 0
    ''')
    Future<List<Tag>> findOrphanedTags();
  }
  ```

- [ ] **Task 3.2:** Create `BookTagDao`

  ```dart
  @dao
  abstract class BookTagDao {
    // Get all tags for a book
    @Query('''
      SELECT t.* FROM tags t
      JOIN book_tags bt ON t.id = bt.tag_id
      WHERE bt.book_id = :bookId AND t.deleted = 0
      ORDER BY bt.order_index
    ''')
    Stream<List<Tag>> watchTagsForBook(int bookId);
    
    // Get all books with a tag
    @Query('''
      SELECT b.* FROM books b
      JOIN book_tags bt ON b.id = bt.book_id
      WHERE bt.tag_id = :tagId AND b.deleted = 0
      ORDER BY b.title
    ''')
    Stream<List<Book>> watchBooksWithTag(int tagId);
    
    // Count books per tag
    @Query('''
      SELECT tag_id, COUNT(*) as count
      FROM book_tags bt
      JOIN books b ON bt.book_id = b.id
      WHERE b.deleted = 0
      GROUP BY tag_id
    ''')
    Future<Map<int, int>> countBooksPerTag();
    
    // Add tag to book
    @insert
    Future<void> addTagToBook(BookTag bookTag);
    
    // Remove tag from book
    @Query('DELETE FROM book_tags WHERE book_id = :bookId AND tag_id = :tagId')
    Future<void> removeTagFromBook(int bookId, int tagId);
    
    // Find related books (shared tags)
    @Query('''
      SELECT b.id, b.title, COUNT(*) as shared_tags
      FROM books b
      JOIN book_tags bt ON b.id = bt.book_id
      WHERE bt.tag_id IN (
        SELECT tag_id FROM book_tags WHERE book_id = :bookId
      )
      AND b.id != :bookId
      AND b.deleted = 0
      GROUP BY b.id, b.title
      ORDER BY shared_tags DESC, b.rating DESC
      LIMIT :limit
    ''')
    Future<List<RelatedBook>> findRelatedBooks(int bookId, int limit);
  }
  ```

**Verification:**

```bash
# Build runner sẽ generate code
dart run build_runner build
```

---

### **Phase 4: Repository Layer**

- [ ] **Task 4.1:** Create `TagRepository`

  ```dart
  class TagRepository {
    final TagDao _tagDao;
    final BookTagDao _bookTagDao;
    
    // Get or create tag
    Future<Tag> getOrCreateTag(String name, {
      int? color,
      String? icon,
      int priority = 0,
      bool isSystem = false,
    });
    
    // Merge tags
    Future<void> mergeTags(int sourceTagId, int targetTagId);
    
    // Cleanup orphaned tags
    Future<int> cleanupOrphanedTags();
    
    // Get tag statistics
    Future<Map<Tag, int>> getTagStatistics();
    
    // Trending tags
    Future<List<TagTrend>> getTrendingTags({
      required DateTime startDate,
      int limit = 10,
    });
  }
  ```

- [ ] **Task 4.2:** Update `BookRepository`
  - Add methods for tag management
  - `addTagToBook(bookId, tagName)`
  - `removeTagFromBook(bookId, tagId)`
  - `getTagsForBook(bookId)`

**Verification:**

```dart
// Unit test
test('getOrCreateTag creates new tag if not exists', () async {
  final tag = await tagRepo.getOrCreateTag('Fiction');
  expect(tag.name, 'Fiction');
});
```

---

### **Phase 5: UI Integration**

- [ ] **Task 5.1:** Create Tag Input Widget
  - Autocomplete từ existing tags
  - Tạo tag mới nếu chưa tồn tại
  - Tag chips với color

- [ ] **Task 5.2:** Update Book Form
  - Replace TextField → TagInputWidget
  - Display selected tags as chips
  - Remove button cho từng tag

- [ ] **Task 5.3:** Tag Management Screen
  - List all tags
  - Edit tag (name, color, icon)
  - Merge tags
  - Delete (soft) unused tags

- [ ] **Task 5.4:** Tag Analytics Screen
  - Pie chart cho reading mix
  - Trending tags
  - Books per tag bar chart

**Verification:**

```bash
flutter run
# Test manually:
# 1. Add tag to book
# 2. Create custom tag
# 3. View tag statistics
```

---

### **Phase 6: Seed Data Update**

- [ ] **Task 6.1:** Update seed data script
  - Remove `tags` string field
  - Insert predefined tags vào `tags` table
  - Create book-tag relationships

Example:

```dart
// Predefined tags
final systemTags = [
  Tag(name: 'Fiction', color: Colors.blue.value, isSystem: 1),
  Tag(name: 'Non-Fiction', color: Colors.green.value, isSystem: 1),
  Tag(name: 'Science', color: Colors.purple.value, isSystem: 1),
];

// Book-tag relationships
final bookTags = [
  BookTag(bookId: 1, tagId: 1, orderIndex: 0), // Book 1 → Fiction
  BookTag(bookId: 1, tagId: 3, orderIndex: 1), // Book 1 → Science
];
```

**Verification:**

```bash
# Run seed script
dart run lib/core/database/seed_data.dart
# Check result
sqlite3 leafy.db "SELECT COUNT(*) FROM tags;"
```

---

### **Phase 7: Advanced Features** (Optional)

- [ ] **Task 7.1:** Tag Suggestions
  - ML-based tag suggestions dựa trên book title/description
  - "Frequently tagged together" suggestions

- [ ] **Task 7.2:** Tag Hierarchies
  - Parent-child relationships (VD: "Fiction" → "Sci-Fi", "Fantasy")
  - Nested tag browsing

- [ ] **Task 7.3:** Tag Import/Export
  - Export tags to JSON
  - Import tags from other users

---

## 🎨 UI/UX Considerations

### **Tag Input Widget**

```
┌─────────────────────────────────────┐
│ Tags: [Fiction] [Science] [+]      │
│                                     │
│ Type to add... ▼                    │
│ ┌──────────────────────────────┐   │
│ │ 🔍 Sug: History, Philosophy   │   │
│ │ ✨ Frequently with: Math      │   │
│ └──────────────────────────────┘   │
└─────────────────────────────────────┘
```

### **Tag Chip Design**

```dart
Container(
  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: tag.color.withOpacity(0.2),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: tag.color),
  ),
  child: Row(
    children: [
      if (tag.icon != null) Icon(tag.icon, size: 16),
      SizedBox(width: 4),
      Text(tag.name),
      SizedBox(width: 4),
      InkWell(
        onTap: () => onRemove(tag),
        child: Icon(Icons.close, size: 14),
      ),
    ],
  ),
)
```

---

## 🔒 Security & Data Integrity

### **1. Constraints**

- ✅ `UNIQUE (name)` on tags → Prevent duplicates
- ✅ `UNIQUE (book_id, tag_id)` on book_tags → Prevent duplicate relationships
- ✅ `FOREIGN KEY` với `ON DELETE CASCADE` → Auto cleanup

### **2. Soft Delete Strategy**

```dart
// Luôn dùng soft delete cho tags
await tagDao.softDeleteTag(tagId, DateTime.now().toIso8601String());

// Queries phải filter deleted = 0
@Query('SELECT * FROM tags WHERE deleted = 0')
```

### **3. Transaction Safety**

```dart
// Merge tags phải atomic
await database.transaction(() async {
  // 1. Move relationships
  await bookTagDao.moveTagRelationships(sourceId, targetId);
  // 2. Delete source
  await tagDao.softDeleteTag(sourceId);
});
```

---

## 📊 Performance Considerations

### **1. Indexes**

```sql
-- Already defined in schema
CREATE INDEX idx_tags_name ON tags (name);
CREATE INDEX idx_book_tags_book ON book_tags (book_id);
CREATE INDEX idx_book_tags_tag ON book_tags (tag_id);
CREATE INDEX idx_book_tags_created ON book_tags (created_at);
```

### **2. Query Optimization**

- Use `EXPLAIN QUERY PLAN` để check index usage
- Limit results với `LIMIT` clause
- Use `Stream<List<Tag>>` cho reactive updates

### **3. N+1 Query Problem**

```dart
// ❌ BAD: N+1 queries
for (var book in books) {
  final tags = await tagDao.getTagsForBook(book.id);
}

// ✅ GOOD: Single JOIN query
final booksWithTags = await bookDao.getBooksWithTags();
```

---

## ✅ Testing Strategy

### **Unit Tests**

```dart
// Tag CRUD
test('createTag creates tag successfully')
test('findTagByName returns correct tag')
test('softDeleteTag marks tag as deleted')

// BookTag relationships
test('addTagToBook creates relationship')
test('removeTagFromBook deletes relationship')
test('getTagsForBook returns all tags')

// Complex queries
test('findRelatedBooks returns books with shared tags')
test('getTrendingTags returns most read tags')
```

### **Integration Tests**

```dart
// Full workflow
testWidgets('user can add custom tag to book', (tester) async {
  await tester.tap(find.byType(AddTagButton));
  await tester.enterText(find.byType(TagTextField), 'Custom Tag');
  await tester.tap(find.text('Add'));
  expect(find.text('Custom Tag'), findsOneWidget);
});
```

---

## 🚀 Deployment Checklist

- [ ] Database version bumped to 3
- [ ] Migration script tested
- [ ] All DAOs generated successfully
- [ ] Unit tests passing
- [ ] UI integration complete
- [ ] Seed data updated
- [ ] Performance profiling done
- [ ] Documentation updated

---

## 📚 References

- [Database Normalization](https://en.wikipedia.org/wiki/Database_normalization)
- [Many-to-Many Relationships](https://www.geeksforgeeks.org/junction-table-in-sql/)
- [SQLite Indexes](https://www.sqlite.org/queryplanner.html)
- [Floor ORM Documentation](https://pinchbv.github.io/floor/)

---

## 🎉 Success Criteria

✅ Tag system sử dụng normalized schema  
✅ Queries chạy nhanh với indexes  
✅ UI hỗ trợ tag autocomplete & suggestions  
✅ Analytics dashboard hoạt động  
✅ Migration từ schema cũ thành công  
✅ No data loss

---

**Next Steps:** Review plan → Run `/create` để implement
