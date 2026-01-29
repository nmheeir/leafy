# PLAN-transfer-book-tags

## Context

When saving a book from Gutendex to the local library, the `bookshelves` and `subjects` data is currently lost. The user wants to preserve this data and display it as tags in the `BookEditorScreen` so they can be saved with the book.

## Goal

Transfer `bookshelves` and `subjects` from `GtdBookScreen` to `BookEditorScreen` and pre-populate the `BookTagsInput` widget with these values.

## Architecture

- **Source**: `GtdBookScreen` (Gutendex).
- **Transport**: `BookEditorArgs` (Data Transfer Object).
- **Destination**: `BookTagsInput` (Inside `BookEditorScreen`).

## Task Breakdown

### Phase 1: Data Transfer (BookEditorArgs)

- [ ] **Modify `BookEditorArgs`**:
  - Add `List<String>? initialTags` field.
- [ ] **Update `BookEditorArgs.fromGutendex`**:
  - Merge `gtdBook.bookshelves` and `gtdBook.subjects` into `initialTags`.
  - Ensure unique values (deduplicate).

### Phase 2: UI Updates (BookTagsInput)

- [ ] **Modify `BookTagsInput` widget**:
  - Add `final List<String>? initialTags` to the constructor.
- [ ] **Update `BookTagsInputState.initState`**:
  - Usage logic:
    - IF `book.id` exists (Editing) -> Load from DB (Keep existing logic).
    - ELSE IF `initialTags` is not empty (New from Gutendex) -> Convert strings to temporal `Tag` objects (id: null) and set as `_selectedTags`.
    - ELSE -> Empty list.

### Phase 3: Wiring (BookEditorScreen)

- [ ] **Update `BookEditorScreen`**:
  - Pass `widget.args.initialTags` into the `BookTagsInput` constructor in the `build` method.

## Verification Checklist

1. Select a book on Gutendex (e.g., Frankenstein).
2. Click "Save to Library".
3. Verify `BookEditorScreen` opens.
4. Verify "Tags" input field is pre-filled with items like "Gothic fiction", "Horror tales", etc.
5. Save the book.
6. Verify tags are persisted to the database (requires checking Book Detail screen or re-opening editor).

## Open Questions

- None. (Assumed standard merging of bookshelves and subjects into a unified Tag list as per current architecture).
