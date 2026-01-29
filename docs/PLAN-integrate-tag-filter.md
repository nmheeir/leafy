# Plan: Integrate Tag Filter into Books Screen

> **Task:** Integrate `TagFilterWidget` into `BooksScreen` and implement filtering logic using `SortBloc`.
> **Status:** PROPOSED

## 1. Context Analysis

- **Current UI:** `BooksScreen` displays lists of books but lacks a UI for tag filtering.
- **Current Logic:** `SortBloc` manages sorting/filtering parameters. `BookListProcessor` handles the actual list processing synchronously.
- **Problem:** `BookListProcessor` has a `TODO` indicating tag filtering is broken because tag data is normalized (separated from Book entity) and not available for synchronous filtering.
- **Solution:** Implement "Async Filter" pattern. `SortBloc` will query `BookTagRepository` to get a list of "allowed book IDs" matching the filter criteria. `BookListProcessor` will simply intersect the main list with this allowed ID set.

## 2. Technical Architecture

### A. State Management (`SortBloc`)

- **Update `SortState`**:
  - Remove legacy fields (`tags`, `filterTagsAsAnd`, `filterOutTags`).
  - Add `List<Tag> selectedTags`.
  - Add `TagFilterMode filterMode`.
  - Add `Set<int>? filteredBookIds` (null means no filter).
- **Update `SortEvent`**:
  - Add `FilterByTagsChanged(List<Tag> tags, TagFilterMode mode)`.
- **Logic**:
  - On `FilterByTagsChanged`:
    - Call `BookTagRepository` methods (`getBooksWithAllTags`, `getBooksWithAnyTag`, `getBooksWithTagExcludingTag` depending on mode).
    - Update `state.filteredBookIds` with the result.

### B. UI Integration (`BooksScreen`)

- Add a Filter Action Button to the AppBar.
- Use `showTagFilterSheet` to open the filter UI.
- On callback, add `FilterByTagsChanged` event to the active `SortBloc` (Note: There are 4 generic SortBlocs, one for each tab. Need to decide if filter applies globally or per tab. *Decision: Apply per tab for now to match current architecture*).

### C. List Processing (`BookListProcessor`)

- Update `process()` method:
  - Check if `sortState.filteredBookIds` is not null.
  - If not null, filter the input list: `list.where((b) => sortState.filteredBookIds!.contains(b.id))`.

## 3. Implementation Steps

### Phase 1: Logic & State (Backend-ISH)

- [ ] **Step 1.1**: Update `SortState` and `SortEvent` in `lib/logic/bloc/sort_bloc/`.
- [ ] **Step 1.2**: Update `SortBloc` to inject `BookTagRepository` (requires updating `injection.config.dart` / module).
- [ ] **Step 1.3**: Implement event handler in `SortBloc` to fetch matching book IDs from Repository.

### Phase 2: Processing Logic

- [ ] **Step 2.1**: Modify `BookListProcessor.process` to use `filteredBookIds` from state.
- [ ] **Step 2.2**: Remove legacy synchronous tag filtering code in `BookListProcessor`.

### Phase 3: UI Integration

- [ ] **Step 3.1**: In `BooksScreen`, add filter icon to AppBar.
- [ ] **Step 3.2**: Implement `_showFilter` method calling `showTagFilterSheet`.
- [ ] **Step 3.3**: Connect UI callback to `context.read<TSortBloc>().add(...)`.

## 4. Verification Checklist

- [ ] `dart analyze` passes.
- [ ] Filtering by "Any" returns correct books.
- [ ] Filtering by "All" returns correct books (intersection).
- [ ] Filtering by "Exclude" hides books with specific tags.
- [ ] Filter persistence (switching tabs) - *Optional optimization*.
