import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/usecases/get_deleted_book.dart';
import 'package:leafy/domain/book/usecases/delete_book_permanently.dart';
import 'package:leafy/domain/book/usecases/restore_book.dart';
import 'package:logger/logger.dart';

part 'trash_bin_cubit.freezed.dart';
part 'trash_bin_state.dart';

@injectable
class TrashBinCubit extends Cubit<TrashBinState> {
  final GetDeletedBooksUseCase _getDeletedBooksUseCase;
  final RestoreBookUseCase _restoreBookUseCase;
  final DeleteBookPermanentlyUseCase _deleteBookPermanentlyUseCase;
  final Logger _logger;

  // Cache danh sách local để Optimistic Update (Cập nhật UI ngay lập tức)
  List<Book> _currentDeletedBooks = [];

  TrashBinCubit(
    this._logger,
    this._getDeletedBooksUseCase,
    this._restoreBookUseCase,
    this._deleteBookPermanentlyUseCase,
  ) : super(const TrashBinState.initial());

  /// Use Case 1: Lấy danh sách sách đã xóa
  Future<void> loadDeletedBooks() async {
    emit(const TrashBinState.loading());

    final result = await _getDeletedBooksUseCase(NoParams());

    result.fold(
      (failure) =>
          emit(TrashBinState.error(failure.message ?? "Lỗi tải dữ liệu")),
      (books) {
        _logger.i("Deleted books: $books");
        _currentDeletedBooks = books;
        if (books.isEmpty) {
          emit(const TrashBinState.empty());
        } else {
          emit(TrashBinState.loaded(deletedBooks: books));
        }
      },
    );
  }

  /// Use Case 2: Khôi phục sách (Đưa trở lại thư viện)
  Future<void> restoreBook(int bookId) async {
    // 1. Gọi UseCase
    final result = await _restoreBookUseCase(bookId);

    result.fold(
      (failure) =>
          emit(TrashBinState.error(failure.message ?? "Khôi phục thất bại")),
      (_) {
        // 2. Cập nhật Local List (Xóa sách vừa restore khỏi list hiển thị)
        _currentDeletedBooks.removeWhere((book) => book.id == bookId);

        // 3. Emit Success để hiện SnackBar
        emit(const TrashBinState.actionSuccess("Đã khôi phục sách"));

        // 4. Emit lại state danh sách mới
        if (_currentDeletedBooks.isEmpty) {
          emit(const TrashBinState.empty());
        } else {
          emit(
            TrashBinState.loaded(deletedBooks: List.from(_currentDeletedBooks)),
          );
        }
      },
    );
  }

  /// Use Case 3: Xóa vĩnh viễn (Hard Delete)
  Future<void> deletePermanently(int bookId) async {
    final result = await _deleteBookPermanentlyUseCase(bookId);

    result.fold(
      (failure) => emit(TrashBinState.error(failure.message ?? "Xóa thất bại")),
      (_) {
        _currentDeletedBooks.removeWhere((book) => book.id == bookId);

        emit(const TrashBinState.actionSuccess("Đã xóa vĩnh viễn"));

        if (_currentDeletedBooks.isEmpty) {
          emit(const TrashBinState.empty());
        } else {
          emit(
            TrashBinState.loaded(deletedBooks: List.from(_currentDeletedBooks)),
          );
        }
      },
    );
  }

  Future<void> emptyTrash() async {
    // TODO: implement
  }
}
