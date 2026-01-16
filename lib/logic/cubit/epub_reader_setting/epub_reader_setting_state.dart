part of 'epub_reader_setting_cubit.dart';

@freezed
abstract class EpubReaderSettingState with _$EpubReaderSettingState {
  const factory EpubReaderSettingState({
    @Default(HorizontalGestureMode.off)
    HorizontalGestureMode horizontalGestureMode,
    @Default(16.0) double sideMargin,
    @Default(16.0) double verticalMargin,
    @Default(16.0) double bottomBarMargin,
    @Default(50) int customBrightness,
    @Default(ScreenOrientation.defaultValue)
    ScreenOrientation screenOrientation,
    @Default(false) bool fullScreen,
    @Default(false) bool keepScreenOn,
    @Default(false) bool hideBarOnFastScroll,
    @Default(true) bool displayImage,
    @Default(false) bool doubleClickTranslator,
    @Default('Serif') String fontFamily,
    @Default(FontThickness.normal) FontThickness fontThickness,
    @Default(FontStyle.normal) FontStyle fontStyle,
    @Default(18.0) double fontSize,
    @Default(1.5) double lineHeight,
    @Default(0.0) double letterSpacing,
    @Default(TextAlign.center) TextAlign textAlignment,
    @Default(TextAlign.center) TextAlign chapterAlignment,
  }) = _EpubReaderSettingState;

  factory EpubReaderSettingState.fromJson(Map<String, dynamic> json) =>
      _$EpubReaderSettingStateFromJson(json);
}
