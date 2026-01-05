part of 'trash_bin_cubit.dart';

@freezed
class TrashBinState with _$TrashBinState {
  const factory TrashBinState.initial() = _Initial;
  const factory TrashBinState.loading() = _Loading;
  const factory TrashBinState.loaded({required List<Book> deletedBooks}) =
      _Loaded;
  const factory TrashBinState.empty() = _Empty;
  const factory TrashBinState.error(String message) = _Error;
  const factory TrashBinState.actionSuccess(String message) = _ActionSuccess;
}
