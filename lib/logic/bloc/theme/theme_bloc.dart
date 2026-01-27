import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/theme/theme_contrast.dart';
import 'package:leafy/core/theme/app_theme_provider.dart';

part 'theme_state.dart';
part 'theme_event.dart';

@injectable
class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  String? fontFamily = 'Nunito';

  ThemeBloc()
    : super(
        SetThemeState(
          themeMode: ThemeMode.system,
          primaryColor: const Color(0xff3FA796),
          fontFamily: 'Nunito',
          useMaterialYou: Platform.isAndroid ? true : false,
          amoledDark: false,
          themeContrast: ThemeContrast.standard,
          themeId: null,
          supportedContrasts: [ThemeContrast.standard],
        ),
      ) {
    on<ChangeThemeEvent>((event, emit) {
      fontFamily = event.fontFamily;

      emit(const ChangingThemeState());

      // Validate contrast
      ThemeContrast contrast = event.themeContrast ?? ThemeContrast.standard;
      if (!event.supportedContrasts.contains(contrast)) {
        contrast = ThemeContrast.standard;
      }

      emit(
        SetThemeState(
          themeMode: event.themeMode,
          primaryColor: event.primaryColor,
          fontFamily: fontFamily,
          useMaterialYou: event.useMaterialYou,
          amoledDark: event.amoledDark,
          themeContrast: contrast,
          themeId: event.themeId,
          supportedContrasts: event.supportedContrasts,
        ),
      );
    });
    on<ChangeAccentEvent>((event, emit) {
      if (state is SetThemeState) {
        final themeState = state as SetThemeState;

        emit(const ChangingThemeState());

        emit(
          themeState.copyWith(
            primaryColor: event.primaryColor,
            useMaterialYou: event.useMaterialYou,
          ),
        );
      }
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    final themeState = json['theme_state'] as int?;

    final primaryColor = json['primary_color'] as int?;
    final fontFamily = json['font_family'] as String?;
    final useMaterialYou = json['use_material_you'] as bool?;
    final amoledDark = json['amoled_dark'] as bool?;
    final themeContrastIndex = json['theme_contrast'] as int?;
    final themeId = json['theme_id'] as String?;

    final theme = AppThemes.getThemeById(themeId);
    final supportedContrasts =
        theme?.supportedContrasts ?? [ThemeContrast.standard];

    ThemeContrast themeContrast = themeContrastIndex != null
        ? ThemeContrast.values[themeContrastIndex]
        : ThemeContrast.standard;

    if (!supportedContrasts.contains(themeContrast)) {
      themeContrast = ThemeContrast.standard;
    }

    switch (themeState) {
      case 1:
        return SetThemeState(
          themeMode: ThemeMode.light,
          primaryColor: Color(primaryColor ?? 0xff2146C7),
          fontFamily: fontFamily ?? 'Nunito',
          useMaterialYou: useMaterialYou ?? true,
          amoledDark: amoledDark ?? false,
          themeContrast: themeContrast,
          themeId: themeId,
          supportedContrasts: supportedContrasts,
        );
      case 2:
        return SetThemeState(
          themeMode: ThemeMode.dark,
          primaryColor: Color(primaryColor ?? 0xff2146C7),
          fontFamily: fontFamily ?? 'Nunito',
          useMaterialYou: useMaterialYou ?? true,
          amoledDark: amoledDark ?? false,
          themeContrast: themeContrast,
          themeId: themeId,
          supportedContrasts: supportedContrasts,
        );
      default:
        return SetThemeState(
          themeMode: ThemeMode.system,
          primaryColor: Color(primaryColor ?? 0xff2146C7),
          fontFamily: fontFamily ?? 'Nunito',
          useMaterialYou: useMaterialYou ?? true,
          amoledDark: amoledDark ?? false,
          themeContrast: themeContrast,
          themeId: themeId,
          supportedContrasts: supportedContrasts,
        );
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    if (state is SetThemeState) {
      final baseJson = {
        'primary_color': state.primaryColor.toARGB32(),
        'font_family': state.fontFamily,
        'use_material_you': state.useMaterialYou,
        'amoled_dark': state.amoledDark,
        'theme_contrast': state.themeContrast.index,
        'theme_id': state.themeId,
      };

      switch (state.themeMode) {
        case ThemeMode.light:
          return {...baseJson, 'theme_state': 1};
        case ThemeMode.dark:
          return {...baseJson, 'theme_state': 2};
        case ThemeMode.system:
          return {...baseJson, 'theme_state': 0};
      }
    } else {
      return {
        'theme_state': 0,
        'primary_color': null,
        'font_family': null,
        'read_tab_first': null,
        'use_material_you': null,
        'locale': null,
        'amoled_dark': false,
        'theme_contrast': 0,
        'theme_id': null,
      };
    }
  }
}
