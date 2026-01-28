# Task: Remove `readings` Field from Book Model/Entity

## Overview

Remove the deprecated `readings` field from `BookModel` and `Book` entity, replacing all usages with queries from the new `ReadingSession` table.

## Current State Analysis

### Old Structure (`Reading` entity)

```dart
class Reading extends Equatable {
  final DateTime? startDate;
  final DateTime? finishDate;
  final int? readingTimeMs;
}
```

### New Structure (`ReadingSession` entity)

```dart
class ReadingSession extends Equatable {
  final String id;
  final int resourceId; // FK → booksTable.id
  final DateTime startTime;
  final DateTime endTime;
  final int durationMs;
  final String? startLocator;
  final String? endLocator;
  final int? chapterIndex;
}
```

## Affected Files

### High Priority (Core Changes)

- [x] `lib/data/models/book/book/book_model.dart` - Remove readings field & TODO comment
- [x] `lib/domain/book/entities/book.dart` - Remove readings field
- [x] `lib/domain/book/entities/reading.dart` - DELETE (no longer needed)
- [x] `lib/data/models/book/reading/` - DELETE entire folder

### Medium Priority (Repository & Datasource)

- [x] `lib/domain/reading_session/repositories/reading_session_repository.dart` - Add getSessionsByBookId()
- [x] `lib/data/repositories/reading_session_repository_impl.dart` - Implement new methods
- [x] `lib/data/datasources/local/reading_session_local_datasource.dart` - Add query methods
- [x] `lib/data/datasources/local/reading_session_local_datasource_impl.dart` - Implement

### UI Layer Updates

- [x] `lib/ui/book/widgets/book_status_detail.dart` - Refactor to use startDate/finishDate
- [x] `lib/ui/book_editor/book_editor_screen.dart` - Remove readings logic
- [x] `lib/ui/book_editor/book_editor_args.dart` - Remove readings field
- [x] `lib/ui/extensions/book_extension.dart` - Refactored markAsFinished method
- [x] `lib/ui/search_ol_edition/search_ol_edition_screen.dart` - Remove readings
- [x] `lib/ui/book/widgets/book_screen_app_bar.dart` - Remove readings
- [x] `lib/ui/book_editor/widgets/reading_row.dart` - DELETE (no longer needed)

### Logic/Utils Updates

- [x] `lib/data/models/book/utils/utils.dart` - Use startDate/finishDate from Book
- [x] `lib/logic/utils/book_list_processor.dart` - Refactor filter logic
- [x] `lib/domain/book/usecases/stat_calculator.dart` - Refactored to use finishDate directly
- [x] `lib/logic/cubit/edit_book_cubit.dart` - Removed readings-related methods
- [x] `lib/logic/cubit/book_actor/book_actor_cubit.dart` - Refactored changeReadingStatus
- [x] `lib/logic/cubit/library/library_state.dart` - Updated finishedYears getter
- [x] `lib/domain/extensions/reading_time_calculator.dart` - DELETE (no longer needed)

## Execution Plan

### Phase 1: Extend ReadingSession Repository

1. Add methods to fetch sessions by book ID
2. Add methods for statistics calculations

### Phase 2: Update Book Entity

1. Remove `readings` field from Book entity
2. Add `startDate` and `finishDate` as direct fields (already exists!)
3. Remove import of Reading

### Phase 3: Update BookModel

1. Remove readings field
2. Remove TODO comment
3. Update toEntity() method

### Phase 4: Update UI Components

1. Refactor book_status_detail.dart to fetch sessions separately
2. Update other UI components

### Phase 5: Update Statistics

1. Refactor stat_calculator.dart to use ReadingSession repository

### Phase 6: Cleanup

1. Delete unused Reading entity and model files
2. Run build_runner

## Notes

- Book entity already has `startDate` and `finishDate` fields directly
- ReadingSession tracks individual reading sessions (for ebook reading time tracking)
- The old `readings` was for tracking multiple read-throughs of the same book
