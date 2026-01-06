import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/reading.dart';
import 'package:leafy/domain/book/usecases/add_book.dart';
import 'package:leafy/domain/book/usecases/bulk_delete.dart';
import 'package:leafy/domain/book/usecases/bulk_update.dart';
import 'package:leafy/domain/book/usecases/delete_book.dart';
import 'package:leafy/domain/book/usecases/params/add_book_usecase_param.dart';
import 'package:leafy/domain/book/usecases/params/bulk_update_params.dart';
import 'package:leafy/domain/book/usecases/params/update_book_param.dart';
import 'package:leafy/domain/book/usecases/update_book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/ui/extensions/book_extension.dart';

part 'book_actor_cubit.freezed.dart';
part 'book_actor_state.dart';

@injectable
class BookActorCubit extends Cubit<BookActorState> {
  final AddBookUseCase _addBookUseCase;
  final UpdateBookUseCase _updateBookUseCase;
  final DeleteBookUseCase _deleteBookUseCase;
  final BulkUpdateUseCase _bulkUpdateUseCase;
  final BulkDeleteUseCase _bulkDeleteUseCase;

  BookActorCubit(
    this._addBookUseCase,
    this._updateBookUseCase,
    this._deleteBookUseCase,
    this._bulkUpdateUseCase,
    this._bulkDeleteUseCase,
  ) : super(const BookActorState.initial());

  Future<void> addBook(Book book, Uint8List? cover) async {
    emit(const BookActorState.loading());

    final result = await _addBookUseCase(
      AddBookParams(book: book, cover: cover),
    );

    result.fold(
      (failure) => emit(
        BookActorState.failure(message: failure.message ?? 'Message unknow'),
      ),
      (newBook) {
        emit(
          BookActorState.success(
            message: "Thêm sách thành công",
            book: newBook,
          ),
        );
      },
    );
  }

  /// Xử lý cập nhật sách
  Future<void> updateBook(Book book, Uint8List? cover) async {
    emit(const BookActorState.loading());

    final result = await _updateBookUseCase(
      UpdateBookParams(book: book, cover: cover),
    );

    result.fold(
      (failure) => emit(
        BookActorState.failure(
          message: failure.message ?? LocaleKeys.error_no_error_return,
        ),
      ),
      (_) => emit(const BookActorState.success(message: "Cập nhật thành công")),
    );
  }

  /// Xử lý xóa sách
  Future<void> deleteBook(int id) async {
    emit(const BookActorState.loading());

    final result = await _deleteBookUseCase(id);

    result.fold(
      (failure) => emit(BookActorState.failure(message: failure.message!)),
      (_) => emit(const BookActorState.success(message: "Đã xóa sách")),
    );
  }

  Future<void> bulkUpdate(BulkUpdateBooksParams params) async {
    emit(const BookActorState.loading());

    final result = await _bulkUpdateUseCase(params);

    result.fold(
      (failure) => emit(BookActorState.failure(message: failure.message!)),
      (_) =>
          emit(const BookActorState.success(message: "Đã cập nhật nhiều sách")),
    );
  }

  Future<void> bulkDelete(Set<int> ids) async {
    emit(const BookActorState.loading());

    final result = await _bulkDeleteUseCase(ids);

    result.fold(
      (failure) => emit(BookActorState.failure(message: failure.message!)),
      (_) => emit(const BookActorState.success(message: "Đã xoá nhiều sách")),
    );
  }

  Future<void> changeReadingStatus(Book book, {int? rating}) async {
    final dateNow = DateTime.now();
    final today = DateTime(dateNow.year, dateNow.month, dateNow.day);

    BookStatus newStatus = book.status;

    if (book.status == BookStatus.inProgress) {
      newStatus = BookStatus.finished;
    } else if (book.status == BookStatus.forLater ||
        book.status == BookStatus.unfinished) {
      newStatus = BookStatus.inProgress;
    }

    if (newStatus == book.status) return;

    Book updatedBook;

    if (newStatus == BookStatus.finished) {
      // CASE A: Hoàn thành sách

      updatedBook = book.markAsFinished(date: today, rating: rating);
    } else if (newStatus == BookStatus.inProgress) {
      // CASE B: Bắt đầu đọc (hoặc Đọc lại)

      List<Reading> newReadings = List.from(book.readings);

      // Tạo một phiên đọc mới bắt đầu từ hôm nay
      final newReadingSession = Reading(startDate: today);

      // Logic: Luôn thêm phiên đọc mới nhất vào đầu danh sách
      newReadings.insert(0, newReadingSession);

      updatedBook = book.copyWith(
        status: BookStatus.inProgress,
        readings: newReadings,
      );
    } else {
      // CASE C: Các trạng thái khác (VD: chuyển về ForLater...)
      updatedBook = book.copyWith(status: newStatus);
    }

    await _performUpdate(updatedBook, null);
  }

  Future<void> toggleFavorite(Book book) async {
    final updatedBook = book.copyWith(favorite: !book.favorite);
    await _performUpdate(
      updatedBook,
      null,
      successMessage: updatedBook.favorite ? "Đã thích" : "Đã bỏ thích",
    );
  }

  Future<void> _performUpdate(
    Book book,
    Uint8List? cover, {
    String? successMessage,
  }) async {
    emit(const BookActorState.loading());
    final result = await _updateBookUseCase(
      UpdateBookParams(book: book, cover: cover),
    );

    result.fold(
      (failure) => emit(
        BookActorState.failure(
          message: failure.message ?? LocaleKeys.error_no_error_return,
        ),
      ),
      (_) => emit(
        BookActorState.success(
          message: successMessage ?? "Cập nhật thành công",
        ),
      ),
    );
  }
}
