import 'dart:typed_data';

import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';
import 'package:leafy/domain/open_lib/entities/ol_search_result_doc.dart';

class BookEditorArgs {
  final Book initialBook;
  final bool isEditMode; // True: Sửa sách cũ, False: Thêm mới

  // Dữ liệu ảnh bìa (1 trong 2 cái này sẽ có giá trị)
  final String? remoteCoverUrl;
  final Uint8List? localCoverBytes;

  // Các cờ logic phụ
  final bool isGutenbergUrl;
  final String? downloadFileUrl; // URL để tải file epub (dành cho Gutendex)

  BookEditorArgs({
    required this.initialBook,
    this.isEditMode = false,
    this.remoteCoverUrl,
    this.isGutenbergUrl = false,
    this.localCoverBytes,
    this.downloadFileUrl,
  });

  // --- NGUỒN 1: GUTENDEX ---
  factory BookEditorArgs.fromGutendex(GtdBook gtdBook) {
    final allTags = [...gtdBook.bookshelves, ...gtdBook.subjects].join('|||||');
    return BookEditorArgs(
      isEditMode: false,
      remoteCoverUrl: gtdBook.formats!.imageJpeg,
      isGutenbergUrl: true,
      downloadFileUrl: gtdBook.formats!.applicationEpubZip,
      initialBook: Book(
        title: gtdBook.title ?? '',
        author: gtdBook.authors.firstOrNull?.name ?? 'Unknown',
        // Map logic kiểm tra EPUB ở đây luôn
        // hasFileAttached: format.applicationEpubZip != null,
        description: gtdBook.summaries.join('\n\n'),
        tags: allTags,
        status: BookStatus.unfinished,
        dateAdded: DateTime.now(),
        dateModified: DateTime.now(),
      ),
    );
  }

  // --- NGUỒN 2: OPEN LIBRARY ---
  factory BookEditorArgs.fromOpenLibrary(OLSearchResultDoc olBook) {
    final author = olBook.authorName!.join(" ,");
    return BookEditorArgs(
      isEditMode: false,
      remoteCoverUrl: (olBook.coverI != null && olBook.coverI! > 0)
          ? olBook.coverI.toString()
          : null,
      initialBook: Book(
        title: olBook.title!,
        description: olBook.description,
        author: author,
        status: BookStatus.unfinished,
        dateAdded: DateTime.now(),
        dateModified: DateTime.now(),
      ),
    );
  }

  // --- NGUỒN 3: LOCAL DATABASE (DB) ---
  factory BookEditorArgs.fromLocal(Book localBook, Uint8List? coverBytes) {
    return BookEditorArgs(
      isEditMode: true,
      localCoverBytes: coverBytes,
      initialBook: localBook,
    );
  }

  //
  factory BookEditorArgs.newBook() {
    return BookEditorArgs(initialBook: Book.empty());
  }

  // --- TƯƠNG LAI: GOOGLE BOOKS ---
  // factory BookEditorArgs.fromGoogleBooks(GoogleBook gBook) {
  //   return BookEditorArgs(
  //     isEditMode: false,
  //     remoteCoverUrl: gBook.volumeInfo.imageLinks?.thumbnail,
  //     initialBook: Book(
  //       title: gBook.volumeInfo.title,
  //       author: gBook.volumeInfo.authors?.join(', ') ?? '',
  //       description: gBook.volumeInfo.description,
  //     ),
  //   );
  // }
}
