import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/data/models/reading.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/ui/book/book_screen.dart';
import 'package:leafy/ui/book_editor/widgets/book_rating_bar.dart';
import 'package:leafy/ui/book_editor/widgets/book_status_row.dart';
import 'package:leafy/ui/book_editor/widgets/covers/cover_view_edit.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_type_dropdown.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/tags_fiels.dart';
import 'package:leafy/ui/book_editor/widgets/reading_row.dart';
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

  List<String> bookTypes = [
    LocaleKeys.book_format_paperback.tr(),
    LocaleKeys.book_format_hardcover.tr(),
    LocaleKeys.book_format_ebook.tr(),
    LocaleKeys.book_format_audiobook.tr(),
  ];

  void _changeBookType(String? bookType) {
    if (bookType == null) return;

    if (bookType == bookTypes[0]) {
      context.read<EditBookCubit>().setBookFormat(BookFormat.paperback);
    } else if (bookType == bookTypes[1]) {
      context.read<EditBookCubit>().setBookFormat(BookFormat.hardcover);
    } else if (bookType == bookTypes[2]) {
      context.read<EditBookCubit>().setBookFormat(BookFormat.ebook);
    } else if (bookType == bookTypes[3]) {
      context.read<EditBookCubit>().setBookFormat(BookFormat.audiobook);
    } else {
      context.read<EditBookCubit>().setBookFormat(BookFormat.paperback);
    }

    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    super.initState();

    final book = context.read<EditBookCubit>().state;

    _prefillBookDetails(book);
    _attachListeners();
  }

  void _attachListeners() {
    final cubit = context.read<EditBookCubit>();

    void bind(TextEditingController ctrl, Function(String) action) {
      ctrl.addListener(() => action(ctrl.text));
    }

    bind(_titleCtrl, cubit.setTitle);
    bind(_subtitleCtrl, cubit.setSubtitle);
    bind(_authorCtrl, cubit.setAuthor);
    bind(_pagesCtrl, cubit.setPages);
    bind(_descriptionCtrl, cubit.setDescription);
    bind(_isbnCtrl, cubit.setISBN);
    bind(_olidCtrl, cubit.setOLID);
    bind(_pubYearCtrl, cubit.setPublicationYear);
    bind(_myReviewCtrl, cubit.setMyReview);
    bind(_notesCtrl, cubit.setNotes);
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

  void _showSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  bool _validate() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final book = context.read<EditBookCubit>().state;

    if (book.title.isEmpty) {
      _showSnackbar(LocaleKeys.title_cannot_be_empty.tr());
      return false;
    }

    return true;
  }

  void _prefillBookDetails(Book book) {
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

  void _saveNewBook(Book book) async {
    print('New ${book.toJSON()}');
    FocusManager.instance.primaryFocus?.unfocus();

    if (!_validate()) return;
    if (!mounted) return;

    Uint8List? cover;

    book.hasCover == false
        ? context.read<EditBookCoverCubit>().deleteCover(book.id)
        : cover = context.read<EditBookCoverCubit>().state;

    final newBookID = await context.read<EditBookCubit>().addNewBook(cover);
    book = book.copyWith(id: newBookID);
    if (!mounted) return;

    context.read<CurrentBookCubit>().setBook(book);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const BookScreen(heroTag: "")),
      (route) => route.isFirst,
    );
  }

  void _updateBook(Book book) async {
     print('Update ${book.toJSON()}');
    
    if (_validate()) return;

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissible(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarTitle, style: const TextStyle(fontSize: 18)),
          actions: [
            BlocBuilder<EditBookCubit, Book>(
              builder: (context, state) {
                return TextButton(
                  onPressed: (state.id == null)
                      ? () => _saveNewBook(state)
                      : () => _updateBook(state),
                  child: Text(
                    LocaleKeys.save.tr(),
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
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
                  hint: LocaleKeys.enter_title.tr(),
                  keyboardType: TextInputType.text,
                  icon: Icons.book,
                ),
                const SizedBox(height: 10),
                BookTextField(
                  controller: _subtitleCtrl,
                  hint: LocaleKeys.enter_subtitle.tr(),
                  keyboardType: TextInputType.text,
                  icon: Icons.book,
                ),

                const SizedBox(height: 10),
                BookTextField(
                  controller: _authorCtrl,
                  hint: LocaleKeys.enter_author.tr(),
                  keyboardType: TextInputType.text,
                  icon: Icons.person,
                  suggestions: widget.authorSuggestions,
                ),
                const Padding(padding: EdgeInsets.all(10), child: Divider()),

                // --- Trạng thái và Lịch sử đọc ---
                BookStatusRow(
                  animDuration: _animDuration,
                  defaultHeight: Constants.formHeight,
                ),
                const SizedBox(height: 10),
                BookRatingBar(animDuration: _animDuration),
                ...widget.initialBook.readings.asMap().entries.map((entry) {
                  return ReadingRow(index: entry.key, reading: entry.value);
                }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: FilledButton.tonal(
                    onPressed: widget.onAddReading, // Gọi callback
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text(LocaleKeys.add_additional_reading_time.tr()),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10), child: Divider()),

                // --- Các thông tin chi tiết khác ---
                BookTypeDropdown(
                  bookTypes: bookTypes,
                  changeBookType: _changeBookType,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: BookTextField(
                        controller: _pagesCtrl,
                        hint: LocaleKeys.enter_pages.tr(),
                        icon: FontAwesomeIcons.solidFileLines,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: BookTextField(
                        controller: _pubYearCtrl,
                        hint: LocaleKeys.enter_publication_year.tr(),
                        icon: FontAwesomeIcons.solidCalendar,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                BookTextField(
                  controller: _descriptionCtrl,
                  hint: LocaleKeys.description.tr(),
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
                        hint: LocaleKeys.isbn.tr(),
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
                  hint: LocaleKeys.enter_tags.tr(),
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
                        child: Center(child: Text(LocaleKeys.cancel.tr())),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 19,
                      child: FilledButton(
                        onPressed: widget.onSave, // Gọi callback
                        child: Center(child: Text(LocaleKeys.save.tr())),
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
