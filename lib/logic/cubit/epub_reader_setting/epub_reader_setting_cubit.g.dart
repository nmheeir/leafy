// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epub_reader_setting_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpubReaderSettingState _$EpubReaderSettingStateFromJson(
  Map<String, dynamic> json,
) => _EpubReaderSettingState(
  horizontalGestureMode:
      $enumDecodeNullable(
        _$HorizontalGestureModeEnumMap,
        json['horizontalGestureMode'],
      ) ??
      HorizontalGestureMode.off,
  sideMargin: (json['sideMargin'] as num?)?.toDouble() ?? 16.0,
  verticalMargin: (json['verticalMargin'] as num?)?.toDouble() ?? 16.0,
  bottomBarMargin: (json['bottomBarMargin'] as num?)?.toDouble() ?? 16.0,
  customBrightnessEnabled: json['customBrightnessEnabled'] as bool? ?? true,
  customBrightness: (json['customBrightness'] as num?)?.toInt() ?? 50,
  screenOrientation:
      $enumDecodeNullable(
        _$ScreenOrientationEnumMap,
        json['screenOrientation'],
      ) ??
      ScreenOrientation.defaultValue,
  volumeKeyNavigation: json['volumeKeyNavigation'] as bool? ?? false,
  keepScreenOn: json['keepScreenOn'] as bool? ?? false,
  hideBarOnFastScroll: json['hideBarOnFastScroll'] as bool? ?? false,
  displayImage: json['displayImage'] as bool? ?? true,
  doubleTapTranslate: json['doubleTapTranslate'] as bool? ?? false,
  fontFamily: json['fontFamily'] as String? ?? 'Serif',
  fontThickness:
      $enumDecodeNullable(_$FontThicknessEnumMap, json['fontThickness']) ??
      FontThickness.normal,
  fontStyle:
      $enumDecodeNullable(_$FontStyleEnumMap, json['fontStyle']) ??
      FontStyle.normal,
  fontSize: (json['fontSize'] as num?)?.toDouble() ?? 18.0,
  lineHeight: (json['lineHeight'] as num?)?.toDouble() ?? 1.5,
  letterSpacing: (json['letterSpacing'] as num?)?.toDouble() ?? 0.0,
  textAlignment:
      $enumDecodeNullable(_$TextAlignEnumMap, json['textAlignment']) ??
      TextAlign.center,
  chapterAlignment:
      $enumDecodeNullable(_$TextAlignEnumMap, json['chapterAlignment']) ??
      TextAlign.center,
  scrollFraction: (json['scrollFraction'] as num?)?.toDouble() ?? 0.5,
  sensitivity: (json['sensitivity'] as num?)?.toDouble() ?? 1.0,
  pullAnimation: json['pullAnimation'] as bool? ?? true,
  visibilityAnimation: json['visibilityAnimation'] as bool? ?? true,
  cutoutMargin: json['cutoutMargin'] as bool? ?? false,
  highlightWords: json['highlightWords'] as bool? ?? false,
  perceptionExpander: json['perceptionExpander'] as bool? ?? false,
  highlightThickness: (json['highlightThickness'] as num?)?.toDouble() ?? 1.0,
  lineSideMargin: (json['lineSideMargin'] as num?)?.toDouble() ?? 0.0,
  lineSideThickness: (json['lineSideThickness'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$EpubReaderSettingStateToJson(
  _EpubReaderSettingState instance,
) => <String, dynamic>{
  'horizontalGestureMode':
      _$HorizontalGestureModeEnumMap[instance.horizontalGestureMode]!,
  'sideMargin': instance.sideMargin,
  'verticalMargin': instance.verticalMargin,
  'bottomBarMargin': instance.bottomBarMargin,
  'customBrightnessEnabled': instance.customBrightnessEnabled,
  'customBrightness': instance.customBrightness,
  'screenOrientation': _$ScreenOrientationEnumMap[instance.screenOrientation]!,
  'volumeKeyNavigation': instance.volumeKeyNavigation,
  'keepScreenOn': instance.keepScreenOn,
  'hideBarOnFastScroll': instance.hideBarOnFastScroll,
  'displayImage': instance.displayImage,
  'doubleTapTranslate': instance.doubleTapTranslate,
  'fontFamily': instance.fontFamily,
  'fontThickness': _$FontThicknessEnumMap[instance.fontThickness]!,
  'fontStyle': _$FontStyleEnumMap[instance.fontStyle]!,
  'fontSize': instance.fontSize,
  'lineHeight': instance.lineHeight,
  'letterSpacing': instance.letterSpacing,
  'textAlignment': _$TextAlignEnumMap[instance.textAlignment]!,
  'chapterAlignment': _$TextAlignEnumMap[instance.chapterAlignment]!,
  'scrollFraction': instance.scrollFraction,
  'sensitivity': instance.sensitivity,
  'pullAnimation': instance.pullAnimation,
  'visibilityAnimation': instance.visibilityAnimation,
  'cutoutMargin': instance.cutoutMargin,
  'highlightWords': instance.highlightWords,
  'perceptionExpander': instance.perceptionExpander,
  'highlightThickness': instance.highlightThickness,
  'lineSideMargin': instance.lineSideMargin,
  'lineSideThickness': instance.lineSideThickness,
};

const _$HorizontalGestureModeEnumMap = {
  HorizontalGestureMode.off: 'off',
  HorizontalGestureMode.on: 'on',
  HorizontalGestureMode.inverse: 'inverse',
};

const _$ScreenOrientationEnumMap = {
  ScreenOrientation.defaultValue: 'defaultValue',
  ScreenOrientation.free: 'free',
  ScreenOrientation.portrait: 'portrait',
  ScreenOrientation.landscape: 'landscape',
  ScreenOrientation.lockedPortrait: 'lockedPortrait',
  ScreenOrientation.lockedLandscape: 'lockedLandscape',
};

const _$FontThicknessEnumMap = {
  FontThickness.thin: 'thin',
  FontThickness.extraLight: 'extraLight',
  FontThickness.light: 'light',
  FontThickness.normal: 'normal',
  FontThickness.medium: 'medium',
};

const _$FontStyleEnumMap = {
  FontStyle.normal: 'normal',
  FontStyle.italic: 'italic',
};

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};
