part of 'test_cubit.dart';

@freezed
class TestCubitState with _$TestCubitState {
  const factory TestCubitState.initial() = _Initial;
  const factory TestCubitState.loading({required double progress}) = _Loading;
  const factory TestCubitState.error({required String message}) = _Error;

  const factory TestCubitState.loaded({
    required EpubBook book, // Model Entity của bạn
    @Default(0) int currentChapterIndex, // Index chương đang đọc
  }) = _Loaded;
}
