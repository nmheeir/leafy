# PLAN-pdf-reader

> **Goal:** Implement a fully functional PDF Reader screen in Leafy with vertical scrolling, text selection, translation support, search, and table of contents.

## 1. Context & Requirements

- **Type:** New Feature
- **Core Library:** `pdfrx`
- **Key Requirements:**
  - **Display:** Vertical continuous scroll (standard mobile PDF feel).
  - **Interaction:** Text selection enabled + Context menu for "Translate" (Popup style).
  - **Navigation:** Table of Contents (TOC) drawer.
  - **Tools:** Search functionality within the document.
  - **Consistency:** UI should match existing `EpubReaderScreen` (Logic for controls, settings).

## 2. Architecture

### 2.1 Logic (`PdfReaderCubit`)

We will create a new Cubit to handle PDF-specific state, separate from EPUB to avoid bloating the existing cubit.

- **State:** `PdfReaderState`
  - `loading`: File parsing.
  - `loaded`: `PdfDocument` object, current page, total pages, outline (TOC).
  - `error`: Load failure.
  - `controlsVisible`: Boolean for UI toggling.
  - `searchResults`: List of search matches.

- **Actions:**
  - `openDocument(String path)`
  - `toggleControls()`
  - `jumpToPage(int pageNumber)`
  - `search(String query)`
  - `clearSearch()`

### 2.2 UI Structure (`PdfReaderScreen`)

- **Widget Tree:**
  - `Scaffold`
  - **Body:** `PdfViewer.file` (from `pdfrx`)
    - `controller`: To handle programmatic scrolling (search/TOC).
    - `scrollDirection`: `Axis.vertical` (Requirement 2A).
    - `onPageChanged`: Sync with Cubit state.
    - `onTextSelectionChange`: Show context menu overlay.
  - **Overlays:**
    - **Top Bar:** Back button, Title, Search Icon, TOC Icon, Settings Icon.
    - **Bottom Bar:** Page slider, Page number indicator.
    - **Search Bar:** Appears when search is active.
    - **Selection Menu:** Custom Overlay or `SelectionArea` integration (pdfrx has built-in support, might need customization for "Translate" button).

## 3. Component Breakdown

### 3.1 `PdfReaderScreen` (`lib/ui/pdf_reader/`)

- Main container.
- Initializes `PdfReaderCubit`.
- Handles `PdfViewer` configurations:

    ```dart
    PdfViewer.file(
      path,
      controller: _pdfController,
      params: PdfViewerParams(
        layoutPages: (pages, params) { ... }, // Vertical layout logic if needed custom
        enableTextSelection: true,
        onTextSelectionChange: _onSelectionChanged,
      ),
    )
    ```

### 3.2 Text Selection & Translation

- **Challenge:** `pdfrx` provides selection details. We need to show a menu "Copy | Translate".
- **Solution:**
  - Listen to `onTextSelectionChange`.
  - If selection is not empty, calculate screen coordinates.
  - Show a `OverlayEntry` or usage of `SystemContextMenu` if possible, but likely a custom Bubble Menu is needed for "Translate" which calls `EpubReaderCubit`'s translation repository or a shared translation service.
  - **Popup Translation:** Show a Dialog/Modal with the translated text.

### 3.3 Search

- Use `pdfrx`'s `PdfViewerController` or built-in search parameters if available.
- `pdfrx` supports search:

    ```dart
    // Example conceptual
    final matches = await document.extractText... // or check pdfrx search API
    // PdfTextSearcher is available in pdfrx
    ```

### 3.4 Table of Contents (TOC)

- Read `PdfDocument.outline`.
- Map to a Drawer widget (similar to EPUB TOC).
- On click -> `controller.jumpToPage(pageNumber)`.

## 4. Implementation Steps

### Step 1: Cubit & Basic Screen

- [ ] Create `lib/logic/cubit/pdf_reader/` (Cubit + State).
- [ ] Create `lib/ui/pdf_reader/pdf_reader_screen.dart`.
- [ ] Basic `PdfViewer.file` implementation with vertical scroll.

### Step 2: Controls & Navigation

- [ ] Implement Top Bar (Title, Back).
- [ ] Implement Bottom Bar (Slider, Page/Total).
- [ ] Connect TOC to Drawer (Read `document.outline`).

### Step 3: Search Feature

- [ ] Add Search Logic to Cubit.
- [ ] Highlight matches in `PdfViewer`.
- [ ] Navigation between matches.

### Step 4: Text Selection & Translate

- [ ] Enable text selection.
- [ ] Build custom Selection Toolbar widget.
- [ ] Integrate Translation Service (reuse existing translation logic from app).

## 5. Verification Checklist

- [ ] **Open File:** Can open a local PDF file.
- [ ] **Scroll:** Vertical scrolling works smooth.
- [ ] **TOC:** Drawer shows correct chapters; clicking jumps to page.
- [ ] **Search:** Can find "the"; navigates to instances.
- [ ] **Translation:** Select text -> Click Translate -> Popup shows translation.
- [ ] **Theme:** Controls toggle visibility on tap.
