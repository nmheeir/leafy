import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/usecases/watch_all_books.dart';

part 'library_cubit.freezed.dart';
part 'library_state.dart';

@injectable
class LibraryCubit extends Cubit<LibraryState> {
  final WatchAllBooksUseCase _watchAllBooks ;

  StreamSubscription? _subscription;

  LibraryCubit(this._watchAllBooks) : super(LibraryState.initial()) {
    _init();
  }

  void _init() {
    emit(const LibraryState.loading());

    _subscription = _watchAllBooks().listen(
      (books) {
        // Mỗi khi Repository gọi _refreshBooks(), hàm này sẽ chạy lại
        emit(LibraryState.loaded(allBooks: books));
      },
      onError: (error) {
        emit(const LibraryState.error());
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
