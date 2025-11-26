import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/data/models/reading.dart';
import 'package:leafy/ui/book_editor/widgets/book_rating_bar.dart';
import 'package:leafy/ui/book_editor/widgets/book_status_row.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/book_editor/widgets/covers/cover_view_edit.dart';
import 'package:leafy/ui/book_editor/widgets/reading_row.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/tags_fiels.dart';
import 'package:leafy/ui/common/keyboard_dismissable.dart';

// Default empty callbacks for BookEditorScreen
void _defaultOnValueChanged(Book value) {}
void _defaultVoidCallback() {}
void _defaultOnRemoveReading(int value) {}
void _defaultOnReadingChanged(int index, Reading reading) {}

/// Một widget chỉ để hiển thị (presentational widget) cho màn hình thêm/sửa sách.
/// Widget này không chứa logic nghiệp vụ. Nó nhận dữ liệu để hiển thị
/// và sử dụng các hàm callback để thông báo cho widget cha về các tương tác của người dùng.
class BookEditorScreen extends StatefulWidget {
  BookEditorScreen({
    super.key,
    this.appBarTitle = 'Add Book',
    this.coverImage,
    this.isCoverLoading = false,
    this.authorSuggestions = const [],
    this.tagSuggestions = const [],
    this.onValueChanged = _defaultOnValueChanged,
    this.onSave = _defaultVoidCallback,
    this.onCancel = _defaultVoidCallback,
    this.onCoverPicked = _defaultVoidCallback,
    this.onCoverDeleted = _defaultVoidCallback,
    this.onScanBarcode = _defaultVoidCallback,
    this.onAddReading = _defaultVoidCallback,
    this.onRemoveReading = _defaultOnRemoveReading,
    this.onReadingChanged = _defaultOnReadingChanged,
  });

  // --- Dữ liệu và trạng thái UI được truyền từ bên ngoài ---
  final String appBarTitle;
  final Book initialBook = Book.empty();
  final Uint8List? coverImage;
  final bool isCoverLoading;
  final List<String> authorSuggestions;
  final List<String> tagSuggestions;

  // --- Callbacks để thông báo cho widget cha ---
  final ValueChanged<Book> onValueChanged;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final VoidCallback onCoverPicked;
  final VoidCallback onCoverDeleted;
  final VoidCallback onScanBarcode;
  final VoidCallback onAddReading;
  final ValueChanged<int> onRemoveReading;
  final void Function(int index, Reading reading) onReadingChanged;

  @override
  State<BookEditorScreen> createState() => _BookEditorScreenState();
}

class _BookEditorScreenState extends State<BookEditorScreen> {
  final _titleCtrl = TextEditingController();
  final _subtitleCtrl = TextEditingController();
  final _authorCtrl = TextEditingController();
  final _pagesCtrl = TextEditingController();
  final _pubYearCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _isbnCtrl = TextEditingController();
  final _olidCtrl = TextEditingController();
  final _tagsCtrl = TextEditingController();
  final _myReviewCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  final _animDuration = const Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    _prefillForm(widget.initialBook);
    _attachListeners();
  }

  void _prefillForm(Book book) {
    _titleCtrl.text = book.title;
    _subtitleCtrl.text = book.subtitle ?? '';
    _authorCtrl.text = book.author;
    _pubYearCtrl.text = (book.publicationYear ?? '').toString();
    _pagesCtrl.text = (book.pages ?? '').toString();
    _descriptionCtrl.text = book.description ?? '';
    _isbnCtrl.text = book.isbn ?? '';
    _olidCtrl.text = book.olid ?? '';
    _myReviewCtrl.text = book.myReview ?? '';
    _notesCtrl.text = book.notes ?? '';
  }

  void _attachListeners() {
    // Mỗi khi một trường thay đổi, tạo một bản sao của cuốn sách,
    // cập nhật giá trị và gọi callback onValueChanged.
    _titleCtrl.addListener(
      () => _handleValueChange(
        widget.initialBook.copyWith(title: _titleCtrl.text),
      ),
    );
    _subtitleCtrl.addListener(
      () => _handleValueChange(
        widget.initialBook.copyWith(subtitle: _subtitleCtrl.text),
      ),
    );
    _authorCtrl.addListener(
      () => _handleValueChange(
        widget.initialBook.copyWith(author: _authorCtrl.text),
      ),
    );
    _pagesCtrl.addListener(
      () => _handleValueChange(
        widget.initialBook.copyWith(pages: int.tryParse(_pagesCtrl.text)),
      ),
    );
    _pubYearCtrl.addListener(
      () => _handleValueChange(
        widget.initialBook.copyWith(
          publicationYear: int.tryParse(_pubYearCtrl.text),
        ),
      ),
    );
    _descriptionCtrl.addListener(
      () => _handleValueChange(
        widget.initialBook.copyWith(description: _descriptionCtrl.text),
      ),
    );
    _isbnCtrl.addListener(
      () =>
          _handleValueChange(widget.initialBook.copyWith(isbn: _isbnCtrl.text)),
    );
    _olidCtrl.addListener(
      () =>
          _handleValueChange(widget.initialBook.copyWith(olid: _olidCtrl.text)),
    );
    _myReviewCtrl.addListener(
      () => _handleValueChange(
        widget.initialBook.copyWith(myReview: _myReviewCtrl.text),
      ),
    );
    _notesCtrl.addListener(
      () => _handleValueChange(
        widget.initialBook.copyWith(notes: _notesCtrl.text),
      ),
    );
  }

  void _handleValueChange(Book updatedBook) {
    widget.onValueChanged(updatedBook);
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _subtitleCtrl.dispose();
    _authorCtrl.dispose();
    _pagesCtrl.dispose();
    _pubYearCtrl.dispose();
    _descriptionCtrl.dispose();
    _isbnCtrl.dispose();
    _olidCtrl.dispose();
    _tagsCtrl.dispose();
    _myReviewCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hardcoded book types list, vì widget này không phụ thuộc vào localization
    final List<String> bookTypes = [
      'Paperback',
      'Hardcover',
      'E-book',
      'Audiobook',
    ];

    return KeyboardDismissible(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarTitle, style: const TextStyle(fontSize: 18)),
          actions: [
            TextButton(
              onPressed: widget.onSave, // Gọi callback
              child: const Text('Save', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // --- Phần ảnh bìa ---
                if (widget.isCoverLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: CircularProgressIndicator(),
                  )
                else
                  CoverViewEdit(
                    onDeleteCover: () {},
                    onEditCover: () {},
                    onLoadFromOpenLibrary: () {},
                    onPickFromGallery: () {},
                    onSearchOnline: () {},
                    // Giả sử CoverViewEdit cũng là pure UI
                    coverBytes: widget.coverImage,
                  ),
                const Padding(padding: EdgeInsets.all(10), child: Divider()),

                // --- Các trường thông tin cơ bản ---
                BookTextField(
                  controller: _titleCtrl,
                  hint: 'Title',
                  keyboardType: TextInputType.text,
                  icon: Icons.book,
                ),
                const SizedBox(height: 10),
                BookTextField(
                  controller: _authorCtrl,
                  hint: 'Author',
                  keyboardType: TextInputType.text,
                  icon: Icons.person,
                  suggestions: widget.authorSuggestions,
                ),
                const Padding(padding: EdgeInsets.all(10), child: Divider()),

                // --- Trạng thái và Lịch sử đọc ---
                BookStatusRow(
                  status: widget.initialBook.status,
                  onStatusChanged: (status) => _handleValueChange(
                    widget.initialBook.copyWith(status: status),
                  ),
                  animDuration: _animDuration,
                  defaultHeight: 60.0,
                ),
                const SizedBox(height: 10),
                BookRatingBar(
                  rating: widget.initialBook.rating,
                  status: widget.initialBook.status,
                  onRatingChanged: (rating) => _handleValueChange(
                    widget.initialBook.copyWith(rating: rating),
                  ),
                  animDuration: _animDuration,
                ),
                ...widget.initialBook.readings.asMap().entries.map((entry) {
                  return ReadingRow(index: entry.key, reading: entry.value);
                }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: FilledButton.tonal(
                    onPressed: widget.onAddReading, // Gọi callback
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text('Add reading session'),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10), child: Divider()),

                // --- Các thông tin chi tiết khác ---
                // BookTypeDropdown(
                //   bookTypes: bookTypes,
                //   selectedFormat: widget.initialBook.bookFormat,
                //   changeBookType: (format) {
                //     if (format != null) {
                //       _handleValueChange(
                //         widget.initialBook.copyWith(bookFormat: format),
                //       );
                //     }
                //   },
                // ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: BookTextField(
                        controller: _pagesCtrl,
                        hint: 'Pages',
                        icon: FontAwesomeIcons.solidFileLines,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: BookTextField(
                        controller: _pubYearCtrl,
                        hint: 'Publication Year',
                        icon: FontAwesomeIcons.solidCalendar,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                BookTextField(
                  controller: _descriptionCtrl,
                  hint: 'Description',
                  keyboardType: TextInputType.text,
                  icon: FontAwesomeIcons.solidKeyboard,
                  maxLines: 15,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: BookTextField(
                        controller: _isbnCtrl,
                        hint: 'ISBN',
                        keyboardType: TextInputType.text,
                        icon: FontAwesomeIcons.i,
                      ),
                    ),
                    InkWell(
                      onTap: widget.onScanBarcode, // Gọi callback
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          FontAwesomeIcons.barcode,
                          size: 28,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 10),
                TagsField(
                  controller: _tagsCtrl,
                  hint: 'Tags',
                  icon: FontAwesomeIcons.tags,
                  tags: widget.initialBook.tags?.split('|||||') ?? [],
                  allTags: widget.tagSuggestions,
                  unselectTag: (tag) {
                    final newTags = List<String>.from(
                      widget.initialBook.tags?.split('|||||') ?? [],
                    );
                    newTags.remove(tag);
                    _handleValueChange(
                      widget.initialBook.copyWith(tags: newTags.join('|||||')),
                    );
                  },
                  onSubmitted: (tag) {
                    final newTags = List<String>.from(
                      widget.initialBook.tags?.split('|||||') ?? [],
                    );
                    if (tag.isNotEmpty && !newTags.contains(tag)) {
                      newTags.add(tag);
                    }
                    _tagsCtrl.clear();
                    _handleValueChange(
                      widget.initialBook.copyWith(tags: newTags.join('|||||')),
                    );
                    FocusScope.of(context).unfocus();
                  },
                ),

                // --- Các nút bấm dưới cùng ---
                const SizedBox(height: 50.0),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 10,
                      child: FilledButton.tonal(
                        onPressed: widget.onCancel, // Gọi callback
                        child: const Center(child: Text('Cancel')),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 19,
                      child: FilledButton(
                        onPressed: widget.onSave, // Gọi callback
                        child: const Center(child: Text('Save')),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
