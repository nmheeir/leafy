import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/data/models/book/reading_time/reading_time.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/reading.dart';
import 'package:leafy/domain/book/usecases/add_book.dart';
import 'package:leafy/domain/book/usecases/update_book.dart';

@injectable
class EditBookCubit extends Cubit<Book> {
  final AddBookUseCase _addBook;
  final UpdateBookUseCase _updateBook;
  EditBookCubit(this._addBook, this._updateBook) : super(Book.empty());

  // TODO: fix this
  Future<int> addNewBook(Uint8List? cover) async {
    // return _addBook(book: state, cover: cover);
    return 1;
  }

  // TODO: fix this
  Future<void> updateBook(Uint8List? cover) async {
    // if (state.id == null) return;
    // await _updateBook(book: state, cover: cover);
  }

  void setBook(Book book) => emit(book);

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

  void addNewReading(Reading reading) {
    emit(state.copyWith(readings: [...state.readings, reading]));
  }

  void removeReading(int index) {
    final readings = List<Reading>.from(state.readings)..removeAt(index);
    emit(state.copyWith(readings: readings));
  }

  void setReadingStartDate(DateTime? date, int index) {
    final readings = List<Reading>.from(state.readings);
    readings[index] = readings[index].copyWith(startDate: date);

    emit(state.copyWith(readings: readings));
  }

  void setReadingFinishDate(DateTime? date, int index) {
    final readings = List<Reading>.from(state.readings);
    readings[index] = readings[index].copyWith(finishDate: date);

    emit(state.copyWith(readings: readings));
  }

  void setCustomReadingTime(ReadingTime? time, int index) {
    final readings = List<Reading>.from(state.readings);
    // TODO: fix
    // readings[index] = readings[index].copyWith(customReadingTime: time);

    emit(state.copyWith(readings: readings));
  }

  void addNewTag(String tag) {
    tag = tag.trim().replaceAll('@', '').replaceAll('|', '');
    if (tag.isEmpty) return;

    final tags = state.tags?.split('|||||') ?? [];
    if (tags.contains(tag)) return;

    emit(state.copyWith(tags: [...tags, tag].join('|||||')));
  }

  void removeTag(String tag) {
    final tags = state.tags?.split('|||||') ?? [];
    tags.remove(tag);

    emit(state.copyWith(tags: tags.isEmpty ? null : tags.join('|||||')));
  }
}
