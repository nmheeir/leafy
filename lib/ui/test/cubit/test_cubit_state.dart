part of 'test_cubit.dart';

@freezed
class TestCubitState with _$TestCubitState {
  const factory TestCubitState.initial() = _Initial;
  const factory TestCubitState.loading({required double progress}) = _Loading;
  const factory TestCubitState.error({required String message}) = _Error;

 const factory TestCubitState.loaded({
    required EpubBook book,
    required List<EpubDisplayItem> displayItems, // <--- THÊM MỚI
    required int currentChapterIndex,
    @Default(0) int currentItemIndex, // Vị trí item hiện tại trong list phẳng
  }) = _Loaded;
}
