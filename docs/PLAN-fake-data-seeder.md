# Plan: Fake Data Seeder

> **Goal:** Create a robust database seeder using the `faker` package to populate the local SQLite database with consistent, relational test data.

## 1. User Review Required (Context)

- **Dependency:** Adding `faker` to `dev_dependencies`.
- **Location:** `lib/core/database/seeds/db_seeder.dart`.
- **Behavior:** The seeder will **delete all existing data** in the target tables before inserting new fake data.
- **Scope:** covers `books`, `book_resources`, `reading_sessions`, `reader_progress`, `book_marks`, `epub_translations`, `epub_summary`.

## 2. Proposed Changes

### Dependencies

#### [MODIFY] [pubspec.yaml](file:///Users/phucnt63/Documents/flutter/leafy/pubspec.yaml)

- Add `faker: ^2.1.0` (or compatible version) to `dev_dependencies`.

### Database Logic

#### [NEW] [db_seeder.dart](file:///Users/phucnt63/Documents/flutter/leafy/lib/core/database/seeds/db_seeder.dart)

Create a `DbSeeder` class with the following structure:

1. **Dependencies**: Import `sqflite`, `faker`, and `db_constants.dart`.
2. **`seed(Database db)` method**:
    - **Cleanup**: Execute `DELETE FROM table_name` for all 7 tables.
    - **Phase 1: Books (Parent)**
        - Generate N (e.g., 20) books.
        - Fields: `title`, `author`, `description`, `status` (random enum), `rating` (1-5), `publication_year`, etc.
        - Keep track of generated `book_id`s.
    - **Phase 2: Resources (Child of Books)**
        - For each book, generate 1-2 resources (epub/pdf).
        - Fields: `book_id` (FK), `uuid`, `path` (fake path), `storage_type`.
        - Keep track of `resource_id`s.
    - **Phase 3: Deep Relations (Children of Resources)**
        - **Reading Sessions**: Generate random sessions for random resources. `start_time` < `end_time`.
        - **Reader Progress**: Generate one progress entry per resource (optional, or random subset).
        - **Book Marks**: Generate highlights linked to resources.
    - **Phase 4: Independent/Loose Relations**
        - **Epub Translations/Summary**: Generate fake content linked by a fake `file_hash`.

## 3. Verification Plan

### Manual Verification

1. **Run Seeder**: Call `DbSeeder.seed(db)` from a temporary UI button or `main.dart` (user to implement trigger).
2. **Inspect DB**: Use a DB viewer or app UI to check:
    - Books list shows data.
    - Statistics page shows reading sessions.
    - Opening a book shows "fake" progress or bookmarks if matched.

### Automated Tests (Optional)

- Create a test file `test/db_seeder_test.dart` that runs the seeder against an in-memory `sqflite` instance and asserts row counts > 0.
