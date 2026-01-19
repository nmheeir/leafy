import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/device/usecases/brightness/get_brightness.dart';
import 'package:leafy/domain/device/usecases/brightness/reset_brightness.dart';
import 'package:leafy/domain/device/usecases/brightness/set_brightness.dart';
import 'package:leafy/domain/device/usecases/orientation/set_orientation.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/usecase/usecase.dart';

part 'epub_reader_setting_state.dart';
part 'epub_reader_setting_cubit.freezed.dart';
part 'epub_reader_setting_cubit.g.dart';

@injectable
class EpubReaderSettingCubit extends HydratedCubit<EpubReaderSettingState> {
  final GetBrightness _getBrightness;
  final SetBrightness _setBrightness;
  final ResetBrightnessUseCase _resetBrightness;
  final SetOrientation _setOrientation;

  EpubReaderSettingCubit(
    this._getBrightness,
    this._setBrightness,
    this._resetBrightness,
    this._setOrientation,
  ) : super(const EpubReaderSettingState());

  @override
  EpubReaderSettingState? fromJson(Map<String, dynamic> json) {
    return EpubReaderSettingState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(EpubReaderSettingState state) {
    return state.toJson();
  }

  void updateHorizontalGestureMode(HorizontalGestureMode mode) {
    emit(state.copyWith(horizontalGestureMode: mode));
  }

  void updateSideMargin(double margin) {
    emit(state.copyWith(sideMargin: margin));
  }

  void updateVerticalMargin(double margin) {
    emit(state.copyWith(verticalMargin: margin));
  }

  void updateBottomBarMargin(double margin) {
    emit(state.copyWith(bottomBarMargin: margin));
  }

  Future<void> updateCustomBrightness(int brightness) async {
    emit(state.copyWith(customBrightness: brightness));
    if (state.customBrightnessEnabled) {
      await _setBrightness(brightness / 100.0);
    }
  }

  Future<void> toggleCustomBrightness() async {
    final newState = !state.customBrightnessEnabled;
    emit(state.copyWith(customBrightnessEnabled: newState));
    if (newState) {
      await _setBrightness(state.customBrightness / 100.0);
    } else {
      await _resetBrightness(const NoParams());
    }
  }

  Future<void> updateScreenOrientation(ScreenOrientation orientation) async {
    emit(state.copyWith(screenOrientation: orientation));
    await _setOrientation(orientation);
  }

  void toggleVolumeKeyNavigation() {
    emit(state.copyWith(volumeKeyNavigation: !state.volumeKeyNavigation));
  }

  void toggleKeepScreenOn() {
    emit(state.copyWith(keepScreenOn: !state.keepScreenOn));
  }

  void toggleHideBarOnFastScroll() {
    emit(state.copyWith(hideBarOnFastScroll: !state.hideBarOnFastScroll));
  }

  void toggleDisplayImage() {
    emit(state.copyWith(displayImage: !state.displayImage));
  }

  void toggleDoubleTapTranslate() {
    emit(state.copyWith(doubleTapTranslate: !state.doubleTapTranslate));
  }

  void updateFontFamily(String fontFamily) {
    emit(state.copyWith(fontFamily: fontFamily));
  }

  void updateFontThickness(FontThickness thickness) {
    emit(state.copyWith(fontThickness: thickness));
  }

  void updateFontStyle(FontStyle style) {
    emit(state.copyWith(fontStyle: style));
  }

  void updateFontSize(double size) {
    emit(state.copyWith(fontSize: size));
  }

  void updateLetterSpacing(double spacing) {
    emit(state.copyWith(letterSpacing: spacing));
  }

  void updateTextAlignment(TextAlign alignment) {
    emit(state.copyWith(textAlignment: alignment));
  }

  void updateLineHeight(double height) {
    emit(state.copyWith(lineHeight: height));
  }

  void updateParagraphSpacing(double spacing) {
    emit(state.copyWith(paragraphSpacing: spacing));
  }

  void updateIndent(double indent) {
    emit(state.copyWith(indent: indent));
  }

  void updateChapterAlignment(TextAlign alignment) {
    emit(state.copyWith(chapterAlignment: alignment));
  }

  void updateScrollFraction(double fraction) {
    emit(state.copyWith(scrollFraction: fraction));
  }

  void updateSensitivity(double sensitivity) {
    emit(state.copyWith(sensitivity: sensitivity));
  }

  void togglePullAnimation() {
    emit(state.copyWith(pullAnimation: !state.pullAnimation));
  }

  void toggleVisibilityAnimation() {
    emit(state.copyWith(visibilityAnimation: !state.visibilityAnimation));
  }

  void toggleCutoutMargin() {
    emit(state.copyWith(cutoutMargin: !state.cutoutMargin));
  }

  void toggleHighlightWords() {
    emit(state.copyWith(highlightWords: !state.highlightWords));
  }

  void togglePerceptionExpander() {
    emit(state.copyWith(perceptionExpander: !state.perceptionExpander));
  }

  void updateHighlightThickness(double thickness) {
    emit(state.copyWith(highlightThickness: thickness));
  }

  void updateLineSideMargin(double margin) {
    emit(state.copyWith(lineSideMargin: margin));
  }

  void updateLineSideThickness(double thickness) {
    emit(state.copyWith(lineSideThickness: thickness));
  }

  void toggleShowImageCaption() {
    emit(state.copyWith(showImageCaption: !state.showImageCaption));
  }

  void updateImageColorEffect(ImageColorEffect effect) {
    emit(state.copyWith(imageColorEffect: effect));
  }

  void updateImageCornerRadius(double radius) {
    emit(state.copyWith(imageCornerRadius: radius));
  }

  void updateImageAlignment(ImageAlignment alignment) {
    emit(state.copyWith(imageAlignment: alignment));
  }

  void updateImageSizeMultiplier(double multiplier) {
    emit(state.copyWith(imageSizeMultiplier: multiplier));
  }

  void updateProgressCountType(ProgressCountType type) {
    emit(state.copyWith(progressCountType: type));
  }

  void toggleShowProgressBar() {
    emit(state.copyWith(showProgressBar: !state.showProgressBar));
  }

  void updateProgressBarColor(int color) {
    emit(state.copyWith(progressBarColor: color));
  }

  void updateProgressBarHeight(double height) {
    emit(state.copyWith(progressBarHeight: height));
  }

  void updateTabIndex(int index) {
    emit(state.copyWith(currentTabIndex: index));
  }
}
