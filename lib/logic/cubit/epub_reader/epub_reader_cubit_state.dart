part of 'epub_reader_cubit.dart';

@freezed
class EpubReaderCubitState with _$EpubReaderCubitState {
  const factory EpubReaderCubitState.initial() = _Initial;
  const factory EpubReaderCubitState.loading({required double progress}) =
      _Loading;
  const factory EpubReaderCubitState.error({required String message}) = _Error;

  const factory EpubReaderCubitState.loaded({
    required EpubBook book,
    required List<EpubDisplayItem> displayItems,
    required int currentChapterIndex,
    @Default(0) int currentItemIndex,
  }) = _Loaded;
}
