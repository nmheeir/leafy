import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/usecases/add_book.dart';
import 'package:leafy/domain/book/usecases/delete_book.dart';
import 'package:leafy/domain/book/usecases/params/add_book_usecase_param.dart';
import 'package:leafy/domain/book/usecases/params/update_book_param.dart';
import 'package:leafy/domain/book/usecases/update_book.dart';
import 'package:leafy/generated/locale_keys.g.dart';

part 'book_actor_state.dart';
part 'book_actor_cubit.freezed.dart';

@injectable
class BookActorCubit extends Cubit<BookActorState> {
  final AddBookUseCase _addBookUseCase;
  final UpdateBookUseCase _updateBookUseCase;
  final DeleteBookUseCase _deleteBookUseCase;

  BookActorCubit(
    this._addBookUseCase,
    this._updateBookUseCase,
    this._deleteBookUseCase,
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
      (_) {
        emit(const BookActorState.success(message: "Thêm sách thành công"));
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

  Future<void> buikUpdateBooks() async {}
}
