import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/data/models/book/reading_time/reading_time.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/reading.dart';
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
    required List<String> defaultTags,
    BookStatus? status,
    int? coverId,
  }) {
    final String? isbn = (isbnList != null && isbnList.isNotEmpty)
        ? isbnList.first
        : null;
    final String? cleanOlid = olidRaw?.replaceAll('/works/', '');
    final String? formattedTags = defaultTags.isNotEmpty
        ? defaultTags.join('|||||')
        : null;

    final newBook = Book(
      id: null,
      title: title,
      subtitle: subtitle,
      author: author,
      status: status ?? BookStatus.unfinished,
      favorite: false,
      pages: pages,
      isbn: isbn,
      olid: cleanOlid,
      publicationYear: publishYear,
      bookFormat: defaultFormat,
      readings: const [],
      tags: formattedTags,
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
    required List<GtdPerson> authors,
    required List<String> bookshelves,
    required List<String> subjects,
    int? pages,
    BookStatus? status,
  }) {
    final newAuthor = authors.map((e) => e.name ?? "Unknown").join(", ");
    final allTags = [...bookshelves, ...subjects];

    final String? formattedTags = allTags.isNotEmpty
        ? allTags.join('|||||')
        : null;

    final newBook = Book(
      title: title ?? 'Unknow title',
      author: newAuthor,
      status: BookStatus.unfinished,
      readings: const [],
      tags: formattedTags,
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

  void setISBN(String isbn) =>
      emit(state.copyWith(isbn: isbn.isEmpty ? null : isbn));

  void setOLID(String olid) =>
      emit(state.copyWith(olid: olid.isEmpty ? null : olid));

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

  // --- LOGIC XỬ LÝ DANH SÁCH ĐỌC (READINGS) ---

  void addNewReading(Reading reading) {
    // Luôn tạo list mới để đảm bảo tính immutability
    emit(state.copyWith(readings: [...state.readings, reading]));
  }

  void removeReading(int index) {
    if (index < 0 || index >= state.readings.length) return;

    final readings = List<Reading>.from(state.readings)..removeAt(index);
    emit(state.copyWith(readings: readings));
  }

  void setReadingStartDate(DateTime? date, int index) {
    if (index < 0 || index >= state.readings.length) return;

    final readings = List<Reading>.from(state.readings);
    readings[index] = readings[index].copyWith(startDate: date);

    emit(state.copyWith(readings: readings));
  }

  void setReadingFinishDate(DateTime? date, int index) {
    if (index < 0 || index >= state.readings.length) return;

    final readings = List<Reading>.from(state.readings);
    readings[index] = readings[index].copyWith(finishDate: date);

    emit(state.copyWith(readings: readings));
  }

  // ĐÃ FIX: Logic cập nhật CustomReadingTime
  void setCustomReadingTime(ReadingTime? time, int index) {
    if (index < 0 || index >= state.readings.length) return;

    final readings = List<Reading>.from(state.readings);
    readings[index] = readings[index].copyWith(
      readingTimeMs: time!.milliSeconds,
    );

    emit(state.copyWith(readings: readings));
  }

  // --- LOGIC XỬ LÝ TAGS ---

  void addNewTag(String tag) {
    // Clean tag input
    tag = tag.trim().replaceAll('@', '').replaceAll('|', '');
    if (tag.isEmpty) return;

    final currentTags = state.tags?.split('|||||') ?? [];
    if (currentTags.contains(tag)) return; // Tránh trùng lặp

    final newTagsList = [...currentTags, tag];

    // Sort tag cho đẹp nếu muốn
    newTagsList.sort();

    emit(state.copyWith(tags: newTagsList.join('|||||')));
  }

  void removeTag(String tag) {
    final currentTags = state.tags?.split('|||||') ?? [];

    if (!currentTags.contains(tag)) return;

    currentTags.remove(tag);

    emit(
      state.copyWith(
        tags: currentTags.isEmpty ? null : currentTags.join('|||||'),
      ),
    );
  }
}
