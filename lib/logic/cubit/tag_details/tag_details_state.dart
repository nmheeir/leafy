import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/book/entities/book.dart';

part 'tag_details_state.freezed.dart';

@freezed
class TagDetailsState with _$TagDetailsState {
  const factory TagDetailsState.initial() = _Initial;
  const factory TagDetailsState.loading() = _Loading;
  const factory TagDetailsState.success(List<Book> books) = _Success;
  const factory TagDetailsState.failure(String message) = _Failure;
}
