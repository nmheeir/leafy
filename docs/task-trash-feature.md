# Task: Implement "Delete Book Permanently" & Improves Trash UI

## Context
The user wants to implement "Delete Permanently" feature in the Trash bin screen. This requires following Clean Architecture principles (Use Case -> Repository -> Data Source). The UI also needs to be improved.

## Steps

### 1. Domain Layer Update (Clean Architecture)
- [ ] Create `DeleteBookPermanentlyUseCase` in `lib/domain/book/usecases/delete_book_permanently.dart`.
- [ ] Add `deletePermanently(int id)` to `BookRepository` interface in `lib/domain/book/repositories/book_repository.dart`.

### 2. Data Layer Update
- [ ] Implement `deletePermanently(int id)` in `BookRepositoryImpl` (`lib/data/repositories/book_repository_impl.dart`).
    - Logic: Use the local data source (DAO) to delete the record completely from DB.

### 3. Logic Layer Update (Cubit)
- [ ] Update `TrashBinCubit` (`lib/logic/cubit/trash/trash_bin_cubit.dart`):
    - Inject `DeleteBookPermanentlyUseCase`.
    - Uncomment and implement `deletePermanently`.
    - Handle success/error states: remove from local list, emit state.

### 4. UI Layer Update (TrashScreen)
- [ ] Improve `TrashScreen` (`lib/ui/trash_screen/trash_screen.dart`):
    - Enhanced design for `Dismissible` background (rounded corners, shadow, vibrant colors).
    - Add meaningful icons.
    - Animation transitions.
    - Confirm dialog enhancement (UI polish).

### 5. Verification
- [ ] Compile and verify no errors.
