# Tag Real-time Updates Plan

## Problem

The `TagFilterCubit` only fetches tags once upon initialization. If tags are created, updated, or deleted elsewhere (e.g., in Settings or Edit Book), the filter list becomes stale.

## Solution: Reactive Repository Pattern

Since the underlying SQLite database does not provide native streams for table updates, we will implement a "notification stream" in the `TagRepository`.

### 1. TagRepository Interface

Add a stream getter to the interface:

```dart
Stream<void> get activeTagsStream;
```

### 2. TagRepository Implementation

- Add a `StreamController<void>.broadcast()` to `TagRepositoryImpl`.
- In `createTag`, `updateTag`, `deleteTag`, `restoreTag`:
  - After a successful database operation, call `_controller.add(null)`.
- Implement `activeTagsStream` returning `_controller.stream`.

### 3. TagFilterCubit

- In the constructor, subscribe to `_tagRepository.activeTagsStream`.
- When an event occurs, call `loadTags()`.
- Ensure to `close` the subscription in `close()`.

## Benefits

- Decoupled: `TagFilterCubit` doesn't need to know *who* changed the tags, just *that* they changed.
- Centralized: Any part of the app modifying tags via the repository will automatically trigger updates in all listeners.

## Files to Modify

1. `lib/domain/tag/repositories/tag_repository.dart`
2. `lib/data/repositories/tag_repository_impl.dart`
3. `lib/logic/cubit/tag_filter/tag_filter_cubit.dart`
