part of 'edit_book_cover_cubit.dart';

enum EditCoverStatus { initial, loading, success, failure, deleted }

@freezed
abstract class EditBookCoverState with _$EditBookCoverState {
  const factory EditBookCoverState({
    @Default(EditCoverStatus.initial) EditCoverStatus status,
    Uint8List? coverData,
    String? blurHash,
    String? errorMessage,
  }) = _EditBookCoverState;
}
