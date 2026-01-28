import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'tag_details_state.dart';

@injectable
class TagDetailsCubit extends Cubit<TagDetailsState> {
  final BookTagRepository _repository;

  TagDetailsCubit(this._repository) : super(const TagDetailsState.initial());

  Future<void> loadBooks(int tagId) async {
    emit(const TagDetailsState.loading());
    final result = await _repository.getBooksWithTag(tagId);
    result.fold(
      (failure) => emit(
        TagDetailsState.failure(failure.message ?? 'Failed to load books'),
      ),
      (books) => emit(TagDetailsState.success(books)),
    );
  }
}
