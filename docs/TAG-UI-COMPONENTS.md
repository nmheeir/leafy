# Tag System UI Components - Implementation Guide

**Created:** 2026-01-28  
**Status:** ✅ Ready for Integration  
**Design System:** Material Design 3 + Premium Aesthetics

---

## 📦 Created Components

### ✅ 1. TagChip Widget

**File:** `lib/ui/common/widgets/tag_chip.dart`

**Features:**

- ✨ Material Design 3 aesthetics
- 🎨 Custom colors per tag
- 🔘 Selected/unselected states
- 📊 Optional book count badge
- ❌ Optional delete button
- 🎭 Smooth animations (200ms)
- 🌈 Dynamic shadows when selected

**Variants:**

- `TagChip` - Full-featured chip with all options
- `TagChipCompact` - Compact version for lists

**Usage:**

```dart
TagChip(
  tag: tag,
  selected: true,
  showCount: true,
  bookCount: 15,
  onTap: () => handleTap(),
  onDelete: () => handleDelete(),
)
```

---

### ✅ 2. TagInputField Widget

**File:** `lib/ui/common/widgets/tag_input_field.dart`

**Features:**

- 🔍 Real-time autocomplete
- ➕ Create tags on-the-fly
- 🎯 Smart suggestions (max 8)
- 💫 Premium focus animations
- 🎨 Material Design 3 styled
- ⚡ Keyboard shortcuts (Enter to add)
- 🔢 Optional max tags limit
- 📋 Visual separation (selected vs available)

**UI Elements:**

- Selected tags display (chip grid)
- Input field with prefix icon
- Autocomplete dropdown (smooth)
- "Create new tag" suggestion
- Add button when typing

**Usage:**

```dart
TagInputField(
  selectedTags: selectedTags,
  onTagsChanged: (newTags) {
    setState(() => selectedTags = newTags);
  },
  hintText: 'Add tags...',
  maxTags: 10,
)
```

**Dependencies:**

- Requires `TagRepository` in context
- Uses BLoC for state management

---

### ✅ 3. TagManagementScreen

**File:** `lib/ui/tags/tag_management_screen.dart`

**Features:**

- 📊 3 tabs: Popular / User Tags / System
- 📈 Tag statistics integration
- 🎨 Beautiful card layouts
- 🏆 Ranking for popular tags
- 📱 Responsive grid/list views
- ➕ FAB for creating new tags
- ⚙️ Edit/Delete actions
- 🎭 Empty states

**Tab Details:**

**Popular Tags Tab:**

- Sorted by book count (descending)
- Shows rank (#1, #2, etc.)
- Displays book count
- List view with rankings

**User Tags Tab:**

- Grid layout (2 columns)
- Compact card design
- Shows usage count
- Edit/delete menu

**System Tags Tab:**

- List view
- "System" badge
- No edit/delete (protected)
- Shows usage stats

**Actions:**

- Create new tag (FAB)
- Edit tag (popup menu)
- Delete tag (popup menu)
- View tag details (tap)

**Usage:**

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TagManagementScreen(),
  ),
);
```

---

### ✅ 4. TagFilterWidget

**File:** `lib/ui/common/widgets/tag_filter_widget.dart`

**Features:**

- 🎯 Multi-select tags
- 🔀 3 filter modes (ANY/ALL/EXCLUDE)
- 📱 Bottom sheet presentation
- 🎨 Material Design 3 SegmentedButton
- ✨ Smooth animations
- 🧹 Clear all filters
- 📊 Selected count display
- 🎭 Draggable sheet

**Filter Modes:**

1. **ANY** (OR logic) - Books with any selected tag
2. **ALL** (AND logic) - Books with all selected tags
3. **EXCLUDE** (NOT logic) - Books without selected tags

**UI Sections:**

- Drag handle bar
- Header with clear button
- Mode selector (segmented button)
- Selected tags preview
- All available tags (wrapped)

**Usage:**

```dart
// Show filter sheet
showTagFilterSheet(
  context,
  onFilterChanged: (tags, mode) {
    // Apply filter
    filterBooks(tags, mode);
  },
  initialTags: currentFilters,
  initialMode: TagFilterMode.any,
);
```

---

## 🎨 Design Principles Applied

### Material Design 3 Features

- ✅ Dynamic color system
- ✅ Surface containers with elevation tints
- ✅ Rounded corners (16px standard)
- ✅ Segmented buttons for mode selection
- ✅ Proper color roles (primary, surface, etc.)
- ✅ Consistent spacing (8px grid)

### Aesthetic Enhancements

- 🌈 Custom tag colors with opacity
- 💫 Smooth micro-animations (200ms easing)
- 🎭 Elevation with colored shadows
- 🎨 Gradient-like color layering
- ✨ Focus state animations
- 🌊 Ripple effects on tap

### Premium Touches

- Beautiful empty states
- Smooth transitions
- Haptic-ready interactions
- Accessibility considerations
- Responsive layouts

---

## 🔌 Integration Points

### Required Providers (BLoC)

```dart
// In your app setup
MultiRepositoryProvider(
  providers: [
    RepositoryProvider<TagRepository>(
      create: (context) => get<TagRepository>(),
    ),
    RepositoryProvider<BookTagRepository>(
      create: (context) => get<BookTagRepository>(),
    ),
  ],
  child: YourApp(),
)
```

### Navigation Integration

```dart
// Add to settings or menu
ListTile(
  leading: Icon(Icons.label_rounded),
  title: Text('Manage Tags'),
  onTap: () => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TagManagementScreen(),
    ),
  ),
)
```

---

## 🚧 TODO: Update Existing UI

### Files Needing Updates

**1. lib/logic/cubit/library/library_state.dart**

```dart
// OLD (line 17):
if (book.tags != null) tags.addAll(book.tags!.split('|||||'));

// NEW:
// Use BookTagRepository to get tags for each book
```

**2. lib/logic/utils/book_list_processor.dart**

```dart
// OLD (lines 63-67):
if (book.tags == null) continue;
final bookTags = book.tags!.split(Constants.tagDelimeter);

// NEW:
// Use BookTagRepository.getTagsForBook(bookId)
```

**3. lib/ui/books/widgets/cards/book_card_list.dart**

```dart
// OLD (lines 166, 195, 199):
return (book.tags == null)
if (book.tags == null) return SizedBox.shrink();
final tags = book.tags!.split('|||||');

// NEW:
// Use FutureBuilder/StreamBuilder with BookTagRepository
// Display TagChipCompact widgets
```

---

## 📝 Next Steps

### Phase 5.1: Update Book Form ⏳

- [ ] Replace old tag input in book editor
- [ ] Add TagInputField widget
- [ ] Wire up BookTagRepository
- [ ] Test create/edit flows

### Phase 5.2: Update Book Display ⏳

- [ ] Replace tag parsing in book cards
- [ ] Use TagChipCompact for display
- [ ] Load tags from repository
- [ ] Add loading states

### Phase 5.3: Add Filter UI ⏳

- [ ] Add filter button to library
- [ ] Wire up TagFilterWidget
- [ ] Implement filter logic in BLoC
- [ ] Update book queries

### Phase 5.4: Polish & Test ⏳

- [ ] Test all tag operations
- [ ] Verify UI responsiveness
- [ ] Check accessibility
- [ ] Performance optimization

---

## 🎯 Usage Examples

### Example 1: Book Editor Integration

```dart
class BookEditorScreen extends StatefulWidget {
  // ... existing code
}

class _BookEditorScreenState extends State<BookEditorScreen> {
  List<Tag> _selectedTags = [];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ... other fields
        
        TagInputField(
          selectedTags: _selectedTags,
          onTagsChanged: (tags) async {
            setState(() => _selectedTags = tags);
            
            // Save to database
            final bookTagRepo = context.read<BookTagRepository>();
            await bookTagRepo.removeAllTagsFromBook(bookId);
            
            for (final tag in tags) {
              await bookTagRepo.addTagToBookById(bookId, tag.id!);
            }
          },
          maxTags: 10,
        ),
      ],
    );
  }
}
```

### Example 2: Book Card Display

```dart
class BookCard extends StatelessWidget {
  final Book book;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // ... book info
          
          // Tags display
          FutureBuilder<Either<Failure, List<Tag>>>(
            future: context.read<BookTagRepository>().getTagsForBook(book.id!),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return SizedBox.shrink();
              
              return snapshot.data!.fold(
                (failure) => SizedBox.shrink(),
                (tags) => Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: tags.take(3).map((tag) => 
                    TagChipCompact(tag: tag)
                  ).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

### Example 3: Library Filter

```dart
class LibraryScreen extends StatefulWidget {
  // ... existing code
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<Tag> _filterTags = [];
  TagFilterMode _filterMode = TagFilterMode.any;
  
  void _showFilters() {
    showTagFilterSheet(
      context,
      onFilterChanged: (tags, mode) {
        setState(() {
          _filterTags = tags;
          _filterMode = mode;
        });
        _applyFilters();
      },
      initialTags: _filterTags,
      initialMode: _filterMode,
    );
  }
  
  Future<void> _applyFilters() async {
    if (_filterTags.isEmpty) {
      // Show all books
      return;
    }
    
    final bookTagRepo = context.read<BookTagRepository>();
    final tagIds = _filterTags.map((t) => t.id!).toList();
    
    final result = switch (_filterMode) {
      TagFilterMode.any => await bookTagRepo.getBooksWithAnyTag(tagIds),
      TagFilterMode.all => await bookTagRepo.getBooksWithAllTags(tagIds),
      TagFilterMode.exclude => /* implement exclude logic */,
    };
    
    result.fold(
      (failure) => /* show error */,
      (books) => /* update UI */,
    );
  }
}
```

---

## ✅ Component Checklist

- [x] TagChip widget with variants
- [x] TagInputField with autocomplete
- [x] TagManagementScreen with tabs
- [x] TagFilterWidget with modes
- [ ] Tag edit dialog (TODO in management screen)
- [ ] Tag create dialog (TODO in management screen)
- [ ] Tag details screen (TODO)
- [ ] Tag analytics dashboard (Future)

---

**Status:** Core UI components complete. Ready for integration into existing screens.
