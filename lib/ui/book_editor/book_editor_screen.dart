import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/reading.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/book_actor/book_actor_cubit.dart';
import 'package:leafy/logic/cubit/book_editor_action/book_editor_action_cubit.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/logic/cubit/library/library_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cover/edit_book_cover_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/book/book_screen.dart';
import 'package:leafy/ui/book_editor/book_editor_args.dart';
import 'package:leafy/ui/book_editor/widgets/book_file_card.dart';
import 'package:leafy/ui/book_editor/widgets/book_rating_bar.dart';
import 'package:leafy/ui/book_editor/widgets/book_status_row.dart';
import 'package:leafy/ui/book_editor/widgets/covers/cover_view_edit.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_type_dropdown.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/tags_fiels.dart';
import 'package:leafy/ui/book_editor/widgets/reading_row.dart';
import 'package:leafy/ui/common/keyboard_dismissable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BookEditorScreen extends StatefulWidget {
  const BookEditorScreen({
    super.key,
    // this.fromGutendex = false,
    // this.fromOpenLibrary = false,
    // this.fromOpenLibraryEdition = false,
    // this.editingExistingBook = false,
    // this.duplicatingBook = false,
    // this.coverOpenLibraryID,
    // this.gutendexFormat,
    // this.work,
    required this.args,
  });

  // final bool fromGutendex;
  // final bool fromOpenLibrary;
  // final bool fromOpenLibraryEdition;
  // final bool editingExistingBook;
  // final bool duplicatingBook;
  // final int? coverOpenLibraryID;
  // final GtdFormat? gutendexFormat;
  // final String? work;

  final BookEditorArgs args;

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
  final _tagsCtrl = TextEditingController();
  final _myReviewCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  String? _currentFilePath;
  String? _currentDownloadUrl;

  final _animDuration = const Duration(milliseconds: 250);

  List<String> bookTypes = [
    LocaleKeys.book_format_paperback.tr(),
    LocaleKeys.book_format_hardcover.tr(),
    LocaleKeys.book_format_ebook.tr(),
    LocaleKeys.book_format_audiobook.tr(),
  ];

  void _prefillControllers(Book book) {
    _titleCtrl.text = book.title;
    _subtitleCtrl.text = book.subtitle ?? '';
    _authorCtrl.text = book.author;
    _pubYearCtrl.text = (book.publicationYear ?? '').toString();
    _pagesCtrl.text = (book.pages ?? '').toString();
    _descriptionCtrl.text = book.description ?? '';
    _myReviewCtrl.text = book.myReview ?? '';
    _notesCtrl.text = book.notes ?? '';
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // TODO: cần xử lý validate trong cubit
  // NOTE: hiện tại để cubit ở đây vì chưa biết xử lý failure như nào cho hợp lý
  bool _validate() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final book = context.editBookCubit.state;

    if (book.title.isEmpty) {
      _showSnackbar(LocaleKeys.title_cannot_be_empty.tr());
      return false;
    }

    if (book.author.isEmpty) {
      _showSnackbar(LocaleKeys.author_cannot_be_empty.tr());
      return false;
    }
    for (final reading in book.readings) {
      if (reading.startDate != null && reading.finishDate != null) {
        if (reading.finishDate!.isBefore(reading.startDate!)) {
          _showSnackbar(LocaleKeys.finish_date_before_start.tr());
          return false;
        }
      }
    }

    return true;
  }

  void _handleSaveButton() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!_validate()) return;
    if (await _checkIfWaitForCoverDownload(context) == true) return;
    if (!mounted) return;

    final bookData = context.editBookCubit.state;

    // Lấy bytes ảnh (nếu có)
    Uint8List? coverBytes;
    if (bookData.hasCover) {
      coverBytes = context.editBookCoverCubit.state.coverData;
    }

    if (widget.args.isEditMode) {
      // --- UPDATE EXISTING BOOK ---
      final updatedBook = bookData.copyWith(dateModified: DateTime.now());
      context.editBookCubit.setBook(updatedBook);

      if (updatedBook.hasCover == false) {
        context.editBookCoverCubit.deleteCover(updatedBook.id);
        context.bookActorCubit.updateBook(updatedBook, null);
      } else {
        context.bookActorCubit.updateBook(updatedBook, coverBytes);
      }
      Navigator.pop(context);
    } else {
      // --- ADD NEW BOOK ---
      // Nếu có URL file download (từ Gutendex) thì truyền vào
      if (widget.args.downloadFileUrl != null) {
        print('BookEditorScreen - epubUrl: ${widget.args.downloadFileUrl}');

        context.bookActorCubit.addBook(
          bookData,
          coverBytes,
          widget.args.downloadFileUrl,
        );
      } else {
        // Trường hợp OpenLibrary hoặc nhập tay
        context.bookActorCubit.addBook(bookData, coverBytes);
      }
    }
  }

  Future<bool?> _checkIfWaitForCoverDownload(BuildContext context) async {
    final isCoverDownloading =
        context.bookEditorActionCubit.state.isCoverDownloading;

    if (isCoverDownloading) {
      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Text(LocaleKeys.cover_still_downloaded.tr()),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              Platform.isIOS
                  ? CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(
                        LocaleKeys.wait_for_downloading_to_finish.tr(),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  : TextButton(
                      child: Text(
                        LocaleKeys.wait_for_downloading_to_finish.tr(),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
              Platform.isIOS
                  ? CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: Text(LocaleKeys.save_without_cover.tr()),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    )
                  : TextButton(
                      child: Text(
                        LocaleKeys.save_without_cover.tr(),
                        style: TextStyle(color: context.colorScheme.error),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
            ],
          );
        },
      );
      return result ?? true;
    } else {
      return Future.value(false);
    }
  }

  void _changeBookType(String? bookType) {
    if (bookType == null) return;

    if (bookType == bookTypes[0]) {
      context.editBookCubit.setBookFormat(BookFormat.paperback);
    } else if (bookType == bookTypes[1]) {
      context.editBookCubit.setBookFormat(BookFormat.hardcover);
    } else if (bookType == bookTypes[2]) {
      context.editBookCubit.setBookFormat(BookFormat.ebook);
    } else if (bookType == bookTypes[3]) {
      context.editBookCubit.setBookFormat(BookFormat.audiobook);
    } else {
      context.editBookCubit.setBookFormat(BookFormat.paperback);
    }

    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget _buildCover() {
    return BlocBuilder<BookEditorActionCubit, BookEditorActionState>(
      builder: (context, state) {
        bool isDownloading = state.isCoverDownloading;
        if (isDownloading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: LoadingAnimationWidget.threeArchedCircle(
              color: context.colorScheme.primary,
              size: 36,
            ),
          );
        }
        return const CoverViewEdit();
      },
    );
  }

  void _addNewTag() {
    final tag = _tagsCtrl.text;

    if (tag.isEmpty) {
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }

    context.editBookCubit.addNewTag(_tagsCtrl.text);

    _tagsCtrl.clear();
  }

  void _unselectTag(String tag) {
    context.editBookCubit.removeTag(tag);
  }

  void _attachListeners() {
    _titleCtrl.addListener(() {
      context.editBookCubit.setTitle(_titleCtrl.text);
    });

    _subtitleCtrl.addListener(() {
      context.editBookCubit.setSubtitle(_subtitleCtrl.text);
    });

    _authorCtrl.addListener(() {
      context.editBookCubit.setAuthor(_authorCtrl.text);
    });

    _pagesCtrl.addListener(() {
      context.editBookCubit.setPages(_pagesCtrl.text);
    });

    _descriptionCtrl.addListener(() {
      context.editBookCubit.setDescription(_descriptionCtrl.text);
    });

    _pubYearCtrl.addListener(() {
      context.editBookCubit.setPublicationYear(_pubYearCtrl.text);
    });

    _myReviewCtrl.addListener(() {
      context.editBookCubit.setMyReview(_myReviewCtrl.text);
    });

    _notesCtrl.addListener(() {
      context.editBookCubit.setNotes(_notesCtrl.text);
    });
  }

  // TODO: uncomment this
  // void _setDefaultTags(Book book) {
  //   final defaultTags = context.read<DefaultBookTagsCubit>().state;

  //   if (book.id == null) {
  //     context.editBookCubit.setBook(
  //       book.copyWith(
  //         tags: defaultTags.isNotEmpty ? defaultTags.join('|||||') : null,
  //       ),
  //     );
  //   }
  // }

  void _handlePickFile() async {
    // TODO: Sử dụng file_picker package để chọn file .epub
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['epub'],
    // );

    // if (result != null) {
    //   setState(() {
    //     _currentFilePath = result.files.single.path;
    //     _currentDownloadUrl = null; // Nếu pick file local thì bỏ url download đi
    //   });
    //   // Update vào Cubit nếu cần: context.editBookCubit.setFilePath(...)
    // }

    debugPrint("User clicked Pick File");
  }

  void _handleDeleteFile() {
    setState(() {
      _currentFilePath = null;
      _currentDownloadUrl = null;
    });
    // Update vào Cubit: context.editBookCubit.setFilePath(null);
  }

  @override
  void initState() {
    super.initState();
    // 1. Reset Cubit trạng thái
    context.bookEditorActionCubit.reset();

    final args = widget.args;
    // _currentFilePath = widget.args.initialBook.filePath;
    // _currentFilePath = "adsfjlajdf";
    _currentDownloadUrl = widget.args.downloadFileUrl;

    // 2. Set dữ liệu sách vào Cubit & Controller
    // Logic này dùng chung cho cả Edit và Add New
    context.editBookCubit.setBook(args.initialBook);
    _prefillControllers(args.initialBook);
    _attachListeners();

    // 3. Xử lý logic Cover (Ảnh bìa)
    // Cần initialize để clear dữ liệu cũ từ book trước đó (do Cubit được share ở level App)
    context.read<EditBookCoverCubit>().initialize(
      currentCover: args.localCoverBytes,
      currentBlurHash: args.initialBook.blurHash,
    );

    if (args.localCoverBytes != null) {
      // Ưu tiên 1: Dùng ảnh local (Edit mode hoặc Import file)
      // Đã nạp qua initialize ở trên, nhưng gọi lại setCoverImage để trigger logic success/blurhash nếu cần
      context.editBookCoverCubit.setCoverImage(args.localCoverBytes);
      context.editBookCubit.setHasCover(true);
    } else if (args.remoteCoverUrl != null) {
      // Ưu tiên 2: Download từ URL (Gutendex / OpenLibrary)
      context.bookEditorActionCubit.downloadCover(
        source: args.remoteCoverUrl!,
        isGutenbergUrl: args.isGutenbergUrl,
      );
    }
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _subtitleCtrl.dispose();
    _authorCtrl.dispose();
    _pagesCtrl.dispose();
    _pubYearCtrl.dispose();
    _descriptionCtrl.dispose();
    _tagsCtrl.dispose();
    _myReviewCtrl.dispose();
    _notesCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BookActorCubit, BookActorState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (message, newBook) {
                var bookSaved = context.editBookCubit.state;

                if (newBook != null) {
                  bookSaved = newBook;
                }

                context.read<CurrentBookCubit>().setBook(bookSaved);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookScreen(heroTag: ""),
                  ),
                  (route) => route.isFirst,
                );
              },
              failure: (errorMessage) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage), // Hoặc .tr() nếu là key
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
        ),
        BlocListener<BookEditorActionCubit, BookEditorActionState>(
          listener: (context, state) {
            // Logic update Cover tự động
            if (state.coverBytes != null && state.coverBlurHash != null) {
              context.editBookCoverCubit.setCoverImage(state.coverBytes);
              context.editBookCubit.setHasCover(true);
              context.editBookCubit.setBlurHash(state.coverBlurHash!);
            }
          },
        ),
      ],
      child: KeyboardDismissible(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.args.isEditMode
                  ? LocaleKeys.edit_book.tr()
                  : LocaleKeys.add_new_book.tr(),
              style: const TextStyle(fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: _handleSaveButton,
                child: Text(
                  LocaleKeys.save.tr(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildCover(),
                  const Padding(padding: EdgeInsets.all(10), child: Divider()),
                  BookTextField(
                    controller: _titleCtrl,
                    hint: LocaleKeys.enter_title.tr(),
                    icon: Icons.book,
                    keyboardType: TextInputType.text,
                    autofocus: _titleCtrl.text.isEmpty,
                    maxLines: 5,
                    maxLength: 255,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 10),
                  BookTextField(
                    controller: _subtitleCtrl,
                    hint: LocaleKeys.enter_subtitle.tr(),
                    icon: Icons.book,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    maxLength: 255,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 10),
                  BlocSelector<LibraryCubit, LibraryState, List<String>>(
                    selector: (state) => state.allAuthors,
                    builder: (context, author) {
                      return BookTextField(
                        controller: _authorCtrl,
                        hint: LocaleKeys.enter_author.tr(),
                        icon: Icons.person,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        maxLength: 255,
                        textCapitalization: TextCapitalization.words,
                        suggestions: author,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BookFileCard(
                    localFilePath: _currentFilePath,
                    downloadUrl: _currentDownloadUrl,
                    onPickFile: _handlePickFile,
                    onDeleteFile: _handleDeleteFile,
                  ),
                  const Padding(padding: EdgeInsets.all(10), child: Divider()),
                  if (widget.args.isEditMode)
                    BookStatusRow(
                      animDuration: _animDuration,
                      defaultHeight: Constants.formHeight,
                    ),
                  const SizedBox(height: 10),
                  BookRatingBar(animDuration: _animDuration),
                  BlocBuilder<EditBookCubit, Book>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          ...state.readings.asMap().entries.map((entry) {
                            return ReadingRow(
                              index: entry.key,
                              reading: entry.value,
                            );
                          }),
                        ],
                      );
                    },
                  ),
                  // _buildAddNewReadingButton(context),
                  const Padding(padding: EdgeInsets.all(10), child: Divider()),
                  BookTypeDropdown(
                    bookTypes: bookTypes,
                    changeBookType: _changeBookType,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // DEPRECATED
                      // Expanded(
                      //   child: BookTextField(
                      //     controller: _pagesCtrl,
                      //     hint: LocaleKeys.enter_pages.tr(),
                      //     icon: FontAwesomeIcons.solidFileLines,
                      //     keyboardType: TextInputType.number,
                      //     inputFormatters: <TextInputFormatter>[
                      //       FilteringTextInputFormatter.digitsOnly,
                      //     ],
                      //     maxLength: 10,
                      //     padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      //   ),
                      // ),
                      // DEPRECATED
                      // Expanded(
                      //   child: BookTextField(
                      //     controller: _pubYearCtrl,
                      //     hint: LocaleKeys.enter_publication_year.tr(),
                      //     icon: FontAwesomeIcons.solidCalendar,
                      //     keyboardType: TextInputType.number,
                      //     inputFormatters: <TextInputFormatter>[
                      //       FilteringTextInputFormatter.digitsOnly,
                      //     ],
                      //     maxLength: 4,
                      //     padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  BookTextField(
                    controller: _descriptionCtrl,
                    hint: LocaleKeys.enter_description.tr(),
                    icon: FontAwesomeIcons.solidKeyboard,
                    keyboardType: TextInputType.multiline,
                    maxLength: 5000,
                    hideCounter: false,
                    maxLines: 15,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 10),
                  // DEPRECATED:
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: BookTextField(
                  //         controller: _isbnCtrl,
                  //         hint: LocaleKeys.isbn.tr(),
                  //         icon: FontAwesomeIcons.i,
                  //         textCapitalization: TextCapitalization.characters,
                  //         keyboardType: TextInputType.text,
                  //         maxLength: 20,
                  //       ),
                  //     ),
                  //     InkWell(
                  //       customBorder: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(cornerRadius),
                  //       ),
                  //       onTap: () async {
                  //         // var result = await BarcodeScanner.scan(
                  //         //   options: ScanOptions(
                  //         //     strings: {
                  //         //       'cancel': LocaleKeys.cancel.tr(),
                  //         //       'flash_on': LocaleKeys.flash_on.tr(),
                  //         //       'flash_off': LocaleKeys.flash_off.tr(),
                  //         //     },
                  //         //   ),
                  //         // );

                  //         // if (result.type == ResultType.Barcode) {
                  //         //   setState(() {
                  //         //     _isbnCtrl.text = result.rawContent;
                  //         //   });
                  //         // }
                  //       },
                  //       child: Container(
                  //         height: 60,
                  //         width: 60,
                  //         padding: const EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(cornerRadius),
                  //           color: context.colorScheme.surfaceContainerHighest
                  //               .withValues(alpha: 0.5),
                  //         ),
                  //         child: Icon(
                  //           FontAwesomeIcons.barcode,
                  //           size: 28,
                  //           color: context.colorScheme.primary,
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //   ],
                  // ),
                  const SizedBox(height: 10),
                  // DEPRECATED:
                  // BookTextField(
                  //   controller: _olidCtrl,
                  //   hint: LocaleKeys.open_library_ID.tr(),
                  //   icon: FontAwesomeIcons.o,
                  //   keyboardType: TextInputType.text,
                  //   maxLength: 20,
                  //   textCapitalization: TextCapitalization.characters,
                  // ),
                  const SizedBox(height: 10),
                  BlocSelector<LibraryCubit, LibraryState, List<String>>(
                    selector: (state) => state.allTags,
                    builder: (context, tags) {
                      return TagsField(
                        controller: _tagsCtrl,
                        hint: LocaleKeys.enter_tags.tr(),
                        icon: FontAwesomeIcons.tags,
                        keyboardType: TextInputType.text,
                        maxLength: Constants.maxTagLength,
                        onSubmitted: (_) => _addNewTag(),
                        onEditingComplete: () {},
                        unselectTag: (tag) => _unselectTag(tag),
                        allTags: tags,
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(10), child: Divider()),
                  BookTextField(
                    controller: _myReviewCtrl,
                    hint: LocaleKeys.my_review.tr(),
                    icon: FontAwesomeIcons.solidKeyboard,
                    keyboardType: TextInputType.multiline,
                    maxLength: 5000,
                    hideCounter: false,
                    maxLines: 15,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 10),
                  BookTextField(
                    controller: _notesCtrl,
                    hint: LocaleKeys.notes.tr(),
                    icon: FontAwesomeIcons.noteSticky,
                    keyboardType: TextInputType.multiline,
                    maxLength: 5000,
                    hideCounter: false,
                    maxLines: 15,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 10,
                        child: FilledButton.tonal(
                          onPressed: () => Navigator.pop(context),
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  cornerRadius,
                                ),
                              ),
                            ),
                          ),
                          child: Center(child: Text(LocaleKeys.cancel.tr())),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 19,
                        child: FilledButton(
                          onPressed: _handleSaveButton,
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  cornerRadius,
                                ),
                              ),
                            ),
                          ),
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
      ),
    );
  }

  Padding _buildAddNewReadingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: FilledButton.tonal(
        onPressed: () {
          context.editBookCubit.addNewReading(Reading());
        },
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add),
            const SizedBox(width: 10),
            Text(LocaleKeys.add_additional_reading_time.tr()),
          ],
        ),
      ),
    );
  }
}
