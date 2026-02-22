# Task: Backup, Restore & CSV Export Feature

> **Created:** 2026-01-27
> **Status:** ✅ COMPLETED
> **Agent:** mobile-developer

---

## 📋 Overview

Implemented full backup/restore functionality and CSV export for Leafy book reader app.

### Features Delivered

1. **Local Backup**: ZIP file containing SQLite database + cover images
2. **Cloud Backup**: Integration with Google Drive for cloud backup
3. **Restore**: Restore from local ZIP or Google Drive
4. **CSV Export**: Export database to Leafy format CSV
5. **CSV Import**: Import from Leafy, Goodreads, and Bookwyrm formats

---

## 🗂️ Files Created

### Domain Layer

| File                                                    | Description                 |
| ------------------------------------------------------- | --------------------------- |
| `lib/domain/backup/entities/backup_result.dart`         | Domain entities for results |
| `lib/domain/backup/repositories/backup_repository.dart` | Repository interface        |

### Data Layer

| File                                          | Description               |
| --------------------------------------------- | ------------------------- |
| `lib/data/backup/backup_service.dart`         | Core backup/restore logic |
| `lib/data/backup/csv_service.dart`            | CSV export/import logic   |
| `lib/data/backup/google_drive_service.dart`   | Google Drive integration  |
| `lib/data/backup/backup_repository_impl.dart` | Repository implementation |

### Logic Layer

| File                                         | Description          |
| -------------------------------------------- | -------------------- |
| `lib/logic/backup/backup_restore_state.dart` | Cubit state          |
| `lib/logic/backup/backup_restore_cubit.dart` | Business logic cubit |

### UI Layer

| File                                                         | Description                            |
| ------------------------------------------------------------ | -------------------------------------- |
| `lib/ui/settings/screens/setting_backup_restore_screen.dart` | Updated screen with full functionality |

---

## 📝 Implementation Details

### Database Tables Backed Up

- `books` - Book metadata
- `book_resources` - EPUB/PDF file references
- `reader_progress` - Current reading position
- `reading_sessions` - Reading history/analytics
- `epub_translations` - Translated chapters
- `epub_summary` - Chapter summaries
- `book_marks` - Highlights/bookmarks

### Backup ZIP Structure

```
leafy_backup_20260127T163742.zip
├── manifest.json              # Backup metadata
├── database/
│   ├── books.json
│   ├── book_resources.json
│   ├── reader_progress.json
│   ├── reading_sessions.json
│   ├── epub_translations.json
│   ├── epub_summary.json
│   └── book_marks.json
└── covers/
    ├── 1.jpg
    ├── 2.jpg
    └── ...
```

---

## 🔧 Dependencies Added

```yaml
archive: ^4.0.4                                    # ZIP creation/extraction
google_sign_in: ^7.1.1                             # Google Sign-in
googleapis: ^14.0.0                                # Google Drive API
extension_google_sign_in_as_googleapis_auth: ^3.0.0 # Auth extension
googleapis_auth: ^2.0.0                            # Google API auth client
csv: ^6.0.0                                        # CSV parsing
```

---

## ✅ Completed Tasks

- [x] Create domain entities (BackupResult, RestoreResult, CsvExportResult)
- [x] Create BackupRepository interface
- [x] Implement BackupService for ZIP creation/extraction
- [x] Implement CsvService for CSV export/import
- [x] Implement GoogleDriveService for cloud backup
- [x] Implement BackupRepositoryImpl
- [x] Create BackupRestoreCubit for UI state management
- [x] Update SettingBackupRestoreScreen with full functionality
- [x] Add loading overlay and progress feedback
- [x] Add confirmation and success/error dialogs
- [x] Support Goodreads CSV import
- [x] Support Bookwyrm CSV import

---

## 📌 Notes

- Cover images stored at: `appDocumentsDirectory.path/{bookId}.jpg`
- Database path: `appDocumentsDirectory.path/leafy.db`
- Uses google_sign_in 7.x API with authenticate() method
- Uses extension_google_sign_in_as_googleapis_auth for auth client
- All files registered with injectable for DI
