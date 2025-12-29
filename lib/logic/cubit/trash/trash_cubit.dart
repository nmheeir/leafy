import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/usecases/get_deleted_book.dart';

part 'trash_state.dart';
part 'trash_cubit.freezed.dart';

@injectable
class TrashBinCubit extends Cubit<TrashBinState> {
  final GetDeletedBooksUseCase _getDeletedBooksUseCase;
  // final RestoreBookUseCase _restoreBookUseCase;
  // final DeleteBookPermanentlyUseCase _deleteBookPermanentlyUseCase;

  // Cache danh sách local để Optimistic Update (Cập nhật UI ngay lập tức)
  List<Book> _currentDeletedBooks = [];

  TrashBinCubit(
    this._getDeletedBooksUseCase,
    // this._restoreBookUseCase,
    // this._deleteBookPermanentlyUseCase,
  ) : super(const TrashBinState.initial());

  /// Use Case 1: Lấy danh sách sách đã xóa
  Future<void> loadDeletedBooks() async {
    emit(const TrashBinState.loading());

    final result = await _getDeletedBooksUseCase(NoParams());

    result.fold(
      (failure) =>
          emit(TrashBinState.error(failure.message ?? "Lỗi tải dữ liệu")),
      (books) {
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
    // // 1. Gọi UseCase
    // final result = await _restoreBookUseCase(bookId);

    // result.fold(
    //   (failure) =>
    //       emit(TrashBinState.error(failure.message ?? "Khôi phục thất bại")),
    //   (_) {
    //     // 2. Cập nhật Local List (Xóa sách vừa restore khỏi list hiển thị)
    //     _currentDeletedBooks.removeWhere((book) => book.id == bookId);

    //     // 3. Emit Success để hiện SnackBar (nếu cần)
    //     emit(const TrashBinState.actionSuccess("Đã khôi phục sách"));

    //     // 4. Emit lại state danh sách mới
    //     if (_currentDeletedBooks.isEmpty) {
    //       emit(const TrashBinState.empty());
    //     } else {
    //       emit(
    //         TrashBinState.loaded(deletedBooks: List.from(_currentDeletedBooks)),
    //       );
    //     }

    //     // LƯU Ý: Vì LibraryCubit dùng Stream, nên khi RestoreBookUseCase chạy xong (update DB),
    //     // LibraryCubit sẽ TỰ ĐỘNG nhận được sách này về list Active.
    //   },
    // );
  }

  /// Use Case 3: Xóa vĩnh viễn (Hard Delete)
  Future<void> deletePermanently(int bookId) async {
    // final result = await _deleteBookPermanentlyUseCase(bookId);

    // result.fold(
    //   (failure) => emit(TrashBinState.error(failure.message ?? "Xóa thất bại")),
    //   (_) {
    //     _currentDeletedBooks.removeWhere((book) => book.id == bookId);

    //     emit(const TrashBinState.actionSuccess("Đã xóa vĩnh viễn"));

    //     if (_currentDeletedBooks.isEmpty) {
    //       emit(const TrashBinState.empty());
    //     } else {
    //       emit(
    //         TrashBinState.loaded(deletedBooks: List.from(_currentDeletedBooks)),
    //       );
    //     }
    //   },
    // );
  }
}
