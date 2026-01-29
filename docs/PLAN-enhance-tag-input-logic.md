# PLAN-local-tag-creation

## Context

When creating a new tag via the `TagInputField` (specifically the "Create 'X'" button), the current implementation calls `_createAndAddTag`, which immediately calls `tagRepository.getOrCreateTag(name.trim())`.

## Goal

The user wants to defer the creation of the tag in the database until the "Save" button is clicked in the `BookEditorScreen`.
When "Create 'X'" is clicked, it should only add a temporary `Tag` object (with `id=null`) to the local list, just like the initial tags from Gutendex.

## Architecture

- **`TagInputField`**:
  - Needs to distinguish between "Select existing tag" (adds existing tag) vs "Create new tag" (adds temporary tag).
  - `_createAndAddTag` should NOT call repository. It should just create a `Tag` object and add it to the list.
- **`BookTagsInput`**:
  - `saveTagsToBook` logic logic handles saving.
    - Iterate `_selectedTags`.
    - If `tag.id != null` -> Add to book (relation).
    - If `tag.id == null` -> `getOrCreateTag` (create DB tag) -> THEN Add to book (relation).
  - This logic **already exists** in `BookTagsInput.saveTagsToBook`.

## Task Breakdown

### Phase 1: Modify `TagInputField`

- [ ] **Update `_createAndAddTag`**:
  - Remove `TagRepository` calls.
  - Create a temporary `Tag` object:
    - `id`: null
    - `name`: user input
    - `createdAt`/`updatedAt`: `DateTime.now()`
  - Call `_addTag` with this object.

### Phase 2: Verify `BookTagsInput`

- [ ] **Check `saveTagsToBook`**:
  - Ensure it correctly handles tags with `id=null` by creating them first. (Verified in Step 77, Lines 109-120).

## Verification Checklist

1. Open Editor.
2. Type a new tag name "NewTag123".
3. Click "Create NewTag123".
4. DB Check: Tag "NewTag123" should NOT exist in `tags` table yet.
5. Click Save Book.
6. DB Check: Tag "NewTag123" SHOULD exist, and be linked to the book.
