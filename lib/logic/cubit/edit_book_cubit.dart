import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/gutendex/entities/gtd_person.dart';

@injectable
class EditBookCubit extends Cubit<Book> {
  // KHÔNG CẦN Inject UseCase nữa
  EditBookCubit() : super(Book.empty());

  void initBookFromOpenLibrary({
    required String title,
    String? subtitle,
    required String author,
    int? pages,
    List<String>? isbnList,
    String? olidRaw,
    int? publishYear,
    required BookFormat defaultFormat,
    required List<String>
    defaultTags, // Tags sẽ được xử lý riêng qua EditBookTagsCubit
    BookStatus? status,
    int? coverId,
  }) {
    // Note: defaultTags sẽ được xử lý riêng trong BookEditorScreen thông qua use cases

    final newBook = Book(
      id: null,
      title: title,
      subtitle: subtitle,
      author: author,
      status: status ?? BookStatus.unfinished,
      favorite: false,
      pages: pages,
      publicationYear: publishYear,
      bookFormat: defaultFormat,
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),

      rating: 0,
      hasCover: false,
    );

    // 3. Emit state mới
    emit(newBook);
  }

  void initBookFromGutendex({
    String? title,
    String? subtitle,
    String? description,
    required List<GtdPerson> authors,
    required List<String> bookshelves,
    required List<String> subjects,
    int? pages,
    BookStatus? status,
  }) {
    final newAuthor = authors.map((e) => e.name ?? "Unknown").join(", ");
    // Note: bookshelves và subjects (tags) sẽ được xử lý riêng trong BookEditorScreen

    final newBook = Book(
      title: title ?? 'Unknow title',
      author: newAuthor,
      description: description,
      status: BookStatus.unfinished,
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
    );

    emit(newBook);
  }

  // Hàm này dùng để khởi tạo dữ liệu khi vào màn hình sửa
  void setBook(Book book) => emit(book);

  // --- CÁC HÀM CẬP NHẬT TRƯỜNG DỮ LIỆU ---

  void setStatus(BookStatus status) => emit(state.copyWith(status: status));

  void setRating(double rating) =>
      emit(state.copyWith(rating: (rating * 10).toInt()));

  void setBookFormat(BookFormat format) =>
      emit(state.copyWith(bookFormat: format));

  void setTitle(String title) => emit(state.copyWith(title: title));

  void setSubtitle(String subtitle) =>
      emit(state.copyWith(subtitle: subtitle.isEmpty ? null : subtitle));

  void setAuthor(String author) => emit(state.copyWith(author: author));

  void setPages(String pages) =>
      emit(state.copyWith(pages: pages.isEmpty ? null : int.parse(pages)));

  void setDescription(String description) => emit(
    state.copyWith(description: description.isEmpty ? null : description),
  );

  void setPublicationYear(String year) => emit(
    state.copyWith(publicationYear: year.isEmpty ? null : int.parse(year)),
  );

  void setMyReview(String review) =>
      emit(state.copyWith(myReview: review.isEmpty ? null : review));

  void setNotes(String notes) =>
      emit(state.copyWith(notes: notes.isEmpty ? null : notes));

  void setBlurHash(String? blurHash) =>
      emit(state.copyWith(blurHash: blurHash));

  void setHasCover(bool hasCover) => emit(state.copyWith(hasCover: hasCover));

  void setStartDate(DateTime? date) => emit(state.copyWith(startDate: date));

  void setFinishDate(DateTime? date) => emit(state.copyWith(finishDate: date));

  // NOTE: Tags are now managed separately through EditBookTagsCubit
  // The addNewTag and removeTag methods have been removed.
  // Use the BookTagsInput widget which handles tag operations via use cases.
}
