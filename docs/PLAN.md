# Refactoring Plan: Book Management Logic

## Part 1: CurrentBookCubit Assessment

### 1. Analysis Findings (CurrentBookCubit)

- **Role**: Acts as a global state container to pass the "Selected Book" from Lists (Grid/List views) to the `BookScreen` (Detail view).
- **Current Usage**:
  - `BookScreen` (UI): Reads `CurrentBookCubit` to get the `ID` to load data.
  - `BookScreen` (Logic): Listeners sync `BookDetailCubit` when `CurrentBookCubit` changes.
  - `BookActorCubit`: Updates `CurrentBookCubit` after edits.
- **Architectural Status**: **Functional but Suboptimal**.
  - It effectively functions as a "Global Argument Holder".
  - **Downside**: Prevents effective Deep Linking (e.g., opening app directly to `book/123`), increases coupling, and creates potential race conditions if the state isn't cleared.

### 2. Verdict (CurrentBookCubit)

- **Currently**: **YES**, it is critical. Removing it now would break navigation to the Book Detail screen.
- **Ideally**: **NO**, it should be replaced by **Route Arguments** (Path Parameters).

### 3. Proposed Action Plan (Refactoring)

To modernize the app and remove this global dependency:

#### Phase 1: Migrate to Route Arguments

1. Update `go_router` (or navigation logic) to accept `bookId` as a parameter (e.g., `/book/:id`).
2. Update `BookScreen` to accept `bookId` from the route arguments instead of `context.read<CurrentBookCubit>()`.
3. Update `BookDetailCubit` initialization to use the passed `bookId`.

#### Phase 2: Cleanup (CurrentBookCubit)

1. Remove `CurrentBookCubit` usage from `BookScreen`.
2. Remove `CurrentBookCubit` injection from `main.dart` / global providers.
3. Delete `current_book_cubit.dart`.

### 4. Decision (CurrentBookCubit)

- **Option A (Refactor)**: Proceed with the proposed plan to remove it and implement Route Arguments.
- **Option B (Keep)**: Keep the file as is (no changes).

---

## Part 2: BookDetailCubit Assessment

### 1. Analysis Findings (BookDetailCubit)

- **Role**: Manages the state for the `BookScreen` (Loading, Loaded, Error).
- **Functionality**:
  - Fetches full book details (including tags, resources) via `GetBookWithDetailsUseCase`.
  - Supports "Optimistic UI" via `setBook` (displaying partial data while loading full data).
  - Handles updates when book is edited.
- **Dependencies**: Depends on `BookRepository` (via UseCase).
- **Usage**: Used extensively in `BookScreen` to render UI.
- **Tests**: ❌ NO tests found in `test/` folder.

### 2. Verdict (BookDetailCubit)

- **YES, ABSOLUTELY**.
- Unlike `CurrentBookCubit`, `BookDetailCubit` contains **Real Business Logic** (State Management, Data Fetching, Error Handling).
- Even if we implement Route Arguments, we **STILL NEED** this Cubit to fetch the data using that ID.

### 3. Improvement Plan (BookDetailCubit)

While we must keep the file, it needs improvements:

#### Phase 1: Test Coverage (Critical)

- Create `test/logic/cubit/book_detail_cubit_test.dart`.
- Cover: `loadBook`, `refresh`, `updateBook`.
- Mocks: Mock `GetBookWithDetailsUseCase`.

#### Phase 2: Refactor (After CurrentBookCubit removal)

- Currently, it relies on `CurrentBookCubit` to trigger its load.
- Future state: `BookScreen` receives `id` via Route Arguments -> calls `BookDetailCubit.loadBook(id)`.

### 4. Decision (BookDetailCubit)

- **Action**: **KEEP** the file.
- **Task**: Add Unit Tests immediately to ensure stability.
