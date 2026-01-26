part of 'epub_reader_setting_cubit.dart';

@freezed
abstract class EpubReaderSettingState with _$EpubReaderSettingState {
  const factory EpubReaderSettingState({
    @Default(HorizontalGestureMode.off)
    HorizontalGestureMode horizontalGestureMode,
    @Default(16.0) double sideMargin,
    @Default(16.0) double verticalMargin,
    @Default(16.0) double bottomBarMargin,
    @Default(true) bool customBrightnessEnabled,
    @Default(50) int customBrightness,
    @Default(ScreenOrientation.defaultValue)
    ScreenOrientation screenOrientation,
    @Default(false) bool volumeKeyNavigation,
    @Default(false) bool keepScreenOn,
    @Default(false) bool hideBarOnFastScroll,
    @Default(true) bool displayImage,
    @Default(true) bool showImageCaption,
    @Default(ImageColorEffect.off) ImageColorEffect imageColorEffect,
    @Default(0.0) double imageCornerRadius,
    @Default(ImageAlignment.center) ImageAlignment imageAlignment,
    @Default(100.0) double imageSizeMultiplier,
    @Default(false) bool doubleTapTranslate,
    @Default('Serif') String fontFamily,
    @Default(FontThickness.normal) FontThickness fontThickness,
    @Default(FontStyle.normal) FontStyle fontStyle,
    @Default(16.0) double fontSize,
    @Default(1.2) double lineHeight,
    @Default(0.0) double paragraphSpacing,
    @Default(0.0) double indent,
    @Default(0.0) double letterSpacing,
    @Default(TextAlign.justify) TextAlign textAlignment,
    @Default(TextAlign.center) TextAlign chapterAlignment,
    @Default(ProgressCountType.percentage) ProgressCountType progressCountType,
    @Default(true) bool showProgressBar,
    @Default(0xFF2196F3) int progressBarColor,
    @Default(0.5) double scrollFraction,
    @Default(1.0) double sensitivity,
    @Default(true) bool pullAnimation,
    @Default(true) bool visibilityAnimation,
    @Default(false) bool cutoutMargin,
    @Default(false) bool highlightWords,
    @Default(false) bool perceptionExpander,
    @Default(1.0) double highlightThickness,
    @Default(0.0) double lineSideMargin,
    @Default(0.0) double lineSideThickness,
    @Default(0) int currentTabIndex,
    @Default(TranslationLanguage.vietnamese)
    TranslationLanguage translationLanguage,
    @Default(0xFFFFFFFF) int backgroundColor,
    @Default(0xFF000000) int textColor,
    @Default(0xFFFFFF00)
    int selectionColor, // Default is a standard yellow highlight
    @Default('Light') String themePreset,
  }) = _EpubReaderSettingState;

  factory EpubReaderSettingState.fromJson(Map<String, dynamic> json) =>
      _$EpubReaderSettingStateFromJson(json);
}
