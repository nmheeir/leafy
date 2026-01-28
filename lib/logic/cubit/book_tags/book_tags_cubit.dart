import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'book_tags_state.dart';

@injectable
class BookTagsCubit extends Cubit<BookTagsState> {
  final BookTagRepository _repository;

  BookTagsCubit(this._repository) : super(const BookTagsState.initial());

  Future<void> loadTags(int bookId) async {
    emit(const BookTagsState.loading());
    final result = await _repository.getTagsForBook(bookId);
    result.fold(
      (failure) =>
          emit(BookTagsState.failure(failure.message ?? 'Unknown error')),
      (tags) => emit(BookTagsState.success(tags)),
    );
  }
}
