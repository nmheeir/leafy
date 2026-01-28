# Plan: Reading History Feature

## Overview

Triển khai tính năng cho phép người dùng xem lịch sử đọc thông qua bảng `reading_sessions`. Tính năng sẽ hiển thị cả tổng thời gian đọc và lịch sử chi tiết từng phiên đọc, với khả năng gộp hoặc tách theo từng resource (file).

---

## 📊 Database Schema Analysis

```
books (1) ─────┬───── (N) book_resources
               │              │
               │              └───── (N) reading_sessions
               │              │
               │              └───── (1) reader_progress
```

### Key Fields

- `reading_sessions.resource_id` → FK to `book_resources.id`
- `reading_sessions.duration_ms` → Thời gian đọc thực tế
- `reading_sessions.start_time` / `end_time` → Timestamps (ms)
- `reading_sessions.chapter_index` → Chương đang đọc
- `book_resources.book_id` → FK to `books.id`
- `book_resources.format` → epub | pdf | audio

---

## 🎯 Feature Requirements

### 1. Book Detail Screen - Summary Widget

- Hiển thị **tổng thời gian đọc** gộp từ tất cả resources của sách
- Hiển thị **số phiên đọc** (session count)
- Hiển thị **lần đọc gần nhất** (last read date)
- Button/Link để vào màn hình Reading History chi tiết

### 2. Reading History Screen - Full Detail

- Hiển thị **danh sách từng phiên đọc** với:
  - Ngày/giờ bắt đầu
  - Thời lượng đọc
  - Resource/file được đọc (nếu có nhiều resource)
  - Chương đang đọc (nếu có)
- **Filter/Group options:**
  - Group by Date (mặc định)
  - Group by Resource (khi có nhiều file)
  - Filter by Resource type (EPUB/PDF/Audio)
- **Summary header:**
  - Total reading time cho book này
  - Average session duration
  - Longest session

### 3. Data Aggregation Logic

- **Mặc định**: Gộp thời gian từ tất cả resources của cùng 1 book
- **Chi tiết**: Có thể xem breakdown theo từng resource
- Query path: `book_id` → `book_resources` → `reading_sessions`

---

## 🎨 UI/UX Design

### A. Book Detail Screen - Reading Stats Card

```
┌─────────────────────────────────────────────┐
│  📖 Reading Activity                    ▶  │
├─────────────────────────────────────────────┤
│  ⏱️  Total Time        │  📅 Last Read     │
│     2h 45m             │     Jan 25, 2026  │
├─────────────────────────────────────────────┤
│  📊  12 sessions       │  📈 Avg: 14m      │
│                        │                    │
└─────────────────────────────────────────────┘
```

**Behavior:**

- Tap entire card → Navigate to Reading History Screen
- Arrow icon (▶) indicates navigable
- Card only shows if `sessions.isNotEmpty`

### B. Reading History Screen

```
┌─────────────────────────────────────────────┐
│  ←  Reading History                         │
├─────────────────────────────────────────────┤
│  ┌─────────────────────────────────────┐   │
│  │  Total: 2h 45m  │ 12 sessions       │   │
│  │  Avg: 14m/session                   │   │
│  └─────────────────────────────────────┘   │
├─────────────────────────────────────────────┤
│  [All Resources ▼]  [Group by Date ▼]      │
├─────────────────────────────────────────────┤
│                                             │
│  📅 January 25, 2026                        │
│  ├─ 📱 8:30 PM - 9:15 PM (45m)             │
│  │     EPUB • Chapter 12                    │
│  │                                          │
│  └─ 📱 2:00 PM - 2:20 PM (20m)             │
│        EPUB • Chapter 11                    │
│                                             │
│  📅 January 24, 2026                        │
│  ├─ 📱 10:00 PM - 10:30 PM (30m)           │
│  │     PDF • Page 45                        │
│  │                                          │
│  └─ ...                                     │
│                                             │
└─────────────────────────────────────────────┘
```

**Features:**

- **Sticky summary header** với tổng thời gian
- **Resource filter dropdown** (All / EPUB / PDF / Audio)
- **Group by dropdown** (Date / Resource)
- **Session list** grouped by date với timeline UI
- **Empty state** khi chưa có session nào

---

## 📁 File Structure

```
lib/
├── domain/
│   └── reading_session/
│       ├── entities/
│       │   └── reading_session.dart          # ✅ Already exists
│       ├── repositories/
│       │   └── reading_session_repository.dart # ✅ Already exists (need extend)
│       └── usecases/
│           └── reading_history_calculator.dart # 🆕 NEW
│
├── data/
│   └── repositories/
│       └── reading_session_repository_impl.dart # ✅ Already exists (need extend)
│
├── logic/
│   └── cubit/
│       └── reading_history/
│           ├── reading_history_cubit.dart    # 🆕 NEW
│           └── reading_history_state.dart    # 🆕 NEW
│
└── ui/
    └── reading_history/
        ├── reading_history_screen.dart       # 🆕 NEW
        ├── widgets/
        │   ├── reading_stats_card.dart       # 🆕 NEW (for Book Detail)
        │   ├── session_list_item.dart        # 🆕 NEW
        │   ├── reading_summary_header.dart   # 🆕 NEW
        │   └── resource_filter_dropdown.dart # 🆕 NEW
        └── reading_history_screen.dart       # 🆕 NEW
```

---

## 🔧 Implementation Phases

### Phase 1: Domain Layer (Estimated: 30 min)

**Agent: backend-specialist**

- [x] **Task 1.1**: Extend `ReadingSessionRepository` interface
  - Add `getSessionsByBookId(int bookId)` - lấy sessions qua book_resources
  - Add `getTotalDurationByBookId(int bookId)` - tính tổng thời gian
  - Add `getSessionCountByBookId(int bookId)` - đếm số sessions
  - Add `getLastSessionByBookId(int bookId)` - lấy session gần nhất

- [x] **Task 1.2**: Implement repository methods
  - SQL joins: `reading_sessions` ← `book_resources` ← `books`
  - Aggregation queries cho summary stats

- [x] **Task 1.3**: Create `ReadingHistoryCalculator` usecase
  - Calculate total duration (formatted string)
  - Calculate average session duration
  - Group sessions by date
  - Group sessions by resource

### Phase 2: State Management (Estimated: 20 min)

**Agent: backend-specialist**

- [x] **Task 2.1**: Create `ReadingHistoryCubit`
  - State: loading, loaded, error
  - Hold list of sessions + summary stats
  - Filter/group state management

- [x] **Task 2.2**: Create `ReadingHistoryState`
  - `sessions: List<ReadingSession>`
  - `totalDuration: Duration`
  - `sessionCount: int`
  - `lastReadAt: DateTime?`
  - `selectedResourceId: int?` (for filtering)
  - `groupBy: GroupByType` (date/resource)

### Phase 3: UI - Book Detail Integration (Estimated: 30 min)

**Agent: frontend-specialist**

- [x] **Task 3.1**: Create `ReadingStatsCard` widget
  - Display summary stats (total time, sessions, last read)
  - Tappable → Navigate to Reading History Screen
  - Handle empty state (no sessions)

- [x] **Task 3.2**: Integrate into `BookScreen` / `book_status_detail.dart`
  - Add `ReadingStatsCard` below existing content
  - Fetch data via `ReadingHistoryCubit`
  - Only show if book has resources

### Phase 4: UI - Reading History Screen (Estimated: 45 min)

**Agent: frontend-specialist**

- [x] **Task 4.1**: Create `ReadingHistoryScreen`
  - AppBar with book title
  - Summary header (sticky)
  - Filter/group dropdowns
  - Session list

- [x] **Task 4.2**: Create `SessionListItem` widget
  - Time range display (start - end)
  - Duration chip
  - Resource type indicator
  - Chapter info (if available)

- [x] **Task 4.3**: Create `ReadingSummaryHeader` widget
  - Total time
  - Session count
  - Average duration

- [x] **Task 4.4**: Create `ResourceFilterDropdown` widget
  - All resources option
  - Individual resource options (from book_resources)

- [x] **Task 4.5**: Implement grouping UI
  - Group by date (SliverStickyHeader)
  - Group by resource (TabBar or SegmentedButton)

### Phase 5: Navigation & Integration (Estimated: 15 min)

**Agent: frontend-specialist**

- [x] **Task 5.1**: Add route for `ReadingHistoryScreen`
  - Pass `bookId` parameter
  - Register in router

- [x] **Task 5.2**: Wire up navigation from `ReadingStatsCard`
  - Navigate with bookId
  - Pass book title for AppBar

### Phase 6: Testing & Polish (Estimated: 20 min)

**Agent: debugger**

- [x] **Task 6.1**: Test with real data
  - Books with multiple resources
  - Books with no sessions (empty state)
  - Books with many sessions (performance)

- [x] **Task 6.2**: UI Polish
  - Animations (list item appearance)
  - Loading states
  - Error handling

---

## 📋 Verification Checklist

### Functional Requirements

- [ ] Book Detail shows reading stats card with correct summary
- [ ] Tapping card navigates to Reading History Screen
- [ ] History screen shows all sessions grouped by date
- [ ] Can filter by specific resource (EPUB/PDF/Audio)
- [ ] Can switch grouping between Date and Resource
- [ ] Empty state shown when no sessions exist
- [ ] Total duration is correctly aggregated across resources

### Technical Requirements

- [ ] No N+1 queries (efficient SQL joins)
- [ ] Cubit properly disposed
- [ ] Navigation works correctly
- [ ] Loading/error states handled

### UI/UX Requirements

- [ ] Card matches app design language
- [ ] History screen is scrollable and performant
- [ ] Dates formatted according to locale
- [ ] Duration formatted as "Xh Ym" or "Xm Ys"

---

## 🎯 Success Metrics

1. **User can view total reading time** for any book from Book Detail Screen
2. **User can see detailed history** of each reading session
3. **User can filter/group** sessions by resource when book has multiple files
4. **Performance**: Screen loads in < 500ms for books with < 100 sessions

---

## 📝 Notes

- Schema không thay đổi, chỉ query existing tables
- `reading_sessions.resource_id` → join `book_resources.book_id` để get book
- Consider pagination nếu book có quá nhiều sessions (> 100)
- Có thể reuse logic này cho Statistics screen trong tương lai

---

## 📅 Estimated Total Time: ~2.5 hours

| Phase                        | Time   | Agent               |
| ---------------------------- | ------ | ------------------- |
| Phase 1: Domain Layer        | 30 min | backend-specialist  |
| Phase 2: State Management    | 20 min | backend-specialist  |
| Phase 3: UI - Book Detail    | 30 min | frontend-specialist |
| Phase 4: UI - History Screen | 45 min | frontend-specialist |
| Phase 5: Navigation          | 15 min | frontend-specialist |
| Phase 6: Testing             | 20 min | debugger            |
