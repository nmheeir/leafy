import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/tag/usecases/get_tags_for_book.dart';
import 'book_tags_state.dart';

@injectable
class BookTagsCubit extends Cubit<BookTagsState> {
  final GetTagsForBookUseCase _getTagsForBookUseCase;

  BookTagsCubit(this._getTagsForBookUseCase)
    : super(const BookTagsState.initial());

  Future<void> loadTags(int bookId) async {
    emit(const BookTagsState.loading());
    final result = await _getTagsForBookUseCase(bookId);
    result.fold(
      (failure) =>
          emit(BookTagsState.failure(failure.message ?? 'Unknown error')),
      (tags) => emit(BookTagsState.success(tags)),
    );
  }
}
