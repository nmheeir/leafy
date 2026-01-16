import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';

part 'epub_reader_setting_state.dart';
part 'epub_reader_setting_cubit.freezed.dart';
part 'epub_reader_setting_cubit.g.dart';

@injectable
class EpubReaderSettingCubit extends HydratedCubit<EpubReaderSettingState> {
  EpubReaderSettingCubit() : super(const EpubReaderSettingState());

  @override
  EpubReaderSettingState? fromJson(Map<String, dynamic> json) {
    return EpubReaderSettingState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(EpubReaderSettingState state) {
    return state.toJson();
  }

  void updateReadingMode(ReadingMode mode) {
    emit(state.copyWith(readingMode: mode));
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

  void updateCustomBrightness(int brightness) {
    emit(state.copyWith(customBrightness: brightness));
  }

  void updateScreenOrientation(ScreenOrientation orientation) {
    emit(state.copyWith(screenOrientation: orientation));
  }

  void toggleFullScreen() {
    emit(state.copyWith(fullScreen: !state.fullScreen));
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

  void toggleDoubleClickTranslator() {
    emit(state.copyWith(doubleClickTranslator: !state.doubleClickTranslator));
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

  void updateChapterAlignment(TextAlign alignment) {
    emit(state.copyWith(chapterAlignment: alignment));
  }
}
