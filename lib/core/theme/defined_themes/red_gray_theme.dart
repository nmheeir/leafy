import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class RedGrayTheme extends AppTheme {
  @override
  String get id => 'redgray';

  @override
  String get name => 'RedGray';

  // Colors
  static const primaryLight = Color(0xFF62514F);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFDBC4C1);
  static const onPrimaryContainerLight = Color(0xFF231615);
  static const secondaryLight = Color(0xFF6B5A58);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFF5DDDA);
  static const onSecondaryContainerLight = Color(0xFF251917);
  static const tertiaryLight = Color(0xFF775653);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFFFDAD6);
  static const onTertiaryContainerLight = Color(0xFF2C1513);
  static const errorLight = Color(0xFFB3261E);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFF9DEDC);
  static const onErrorContainerLight = Color(0xFF410E0B);
  static const backgroundLight = Color(0xFFFEF8F7);
  static const onBackgroundLight = Color(0xFF1E1B1A);
  static const surfaceLight = Color(0xFFFEF8F7);
  static const onSurfaceLight = Color(0xFF1E1B1A);
  static const surfaceVariantLight = Color(0xFFE9E1DF);
  static const onSurfaceVariantLight = Color(0xFF4A4645);
  static const outlineLight = Color(0xFF7A7574);
  static const outlineVariantLight = Color(0xFFCCC5C4);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF332F2F);
  static const inverseOnSurfaceLight = Color(0xFFF7EFEE);
  static const inversePrimaryLight = Color(0xFFC2ACA9);
  static const surfaceDimLight = Color(0xFFDED9D7);
  static const surfaceBrightLight = Color(0xFFFEF8F7);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF8F2F1);
  static const surfaceContainerLight = Color(0xFFF2ECEB);
  static const surfaceContainerHighLight = Color(0xFFEDE7E6);
  static const surfaceContainerHighestLight = Color(0xFFE9E1DF);
  static const primaryDark = Color(0xFFC2ACA9);
  static const onPrimaryDark = Color(0xFF372927);
  static const primaryContainerDark = Color(0xFF4C3C3A);
  static const onPrimaryContainerDark = Color(0xFFDBC4C1);
  static const secondaryDark = Color(0xFFD8C2BF);
  static const onSecondaryDark = Color(0xFF3B2D2B);
  static const secondaryContainerDark = Color(0xFF534341);
  static const onSecondaryContainerDark = Color(0xFFF5DDDA);
  static const tertiaryDark = Color(0xFFE7BDB8);
  static const onTertiaryDark = Color(0xFF442926);
  static const tertiaryContainerDark = Color(0xFF5D3F3C);
  static const onTertiaryContainerDark = Color(0xFFFFDAD6);
  static const errorDark = Color(0xFFF2B8B5);
  static const onErrorDark = Color(0xFF601410);
  static const errorContainerDark = Color(0xFF8C1D18);
  static const onErrorContainerDark = Color(0xFFF9DEDC);
  static const backgroundDark = Color(0xFF171211);
  static const onBackgroundDark = Color(0xFFE9E1DF);
  static const surfaceDark = Color(0xFF141110);
  static const onSurfaceDark = Color(0xFFE9E1DF);
  static const surfaceVariantDark = Color(0xFF4A4645);
  static const onSurfaceVariantDark = Color(0xFFCCC5C4);
  static const outlineDark = Color(0xFF968F8E);
  static const outlineVariantDark = Color(0xFF4A4645);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFE9E1DF);
  static const inverseOnSurfaceDark = Color(0xFF332F2F);
  static const inversePrimaryDark = Color(0xFF62514F);
  static const surfaceDimDark = Color(0xFF171211);
  static const surfaceBrightDark = Color(0xFF3D3837);
  static const surfaceContainerLowestDark = Color(0xFF0D0B0A);
  static const surfaceContainerLowDark = Color(0xFF1E1B1A);
  static const surfaceContainerDark = Color(0xFF231F1F);
  static const surfaceContainerHighDark = Color(0xFF2D2929);
  static const surfaceContainerHighestDark = Color(0xFF383433);

  @override
  ColorScheme lightColorScheme(ThemeContrast contrast) {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: primaryLight,
      onPrimary: onPrimaryLight,
      primaryContainer: primaryContainerLight,
      onPrimaryContainer: onPrimaryContainerLight,
      secondary: secondaryLight,
      onSecondary: onSecondaryLight,
      secondaryContainer: secondaryContainerLight,
      onSecondaryContainer: onSecondaryContainerLight,
      tertiary: tertiaryLight,
      onTertiary: onTertiaryLight,
      tertiaryContainer: tertiaryContainerLight,
      onTertiaryContainer: onTertiaryContainerLight,
      error: errorLight,
      onError: onErrorLight,
      errorContainer: errorContainerLight,
      onErrorContainer: onErrorContainerLight,
      surface: surfaceLight,
      onSurface: onSurfaceLight,
      surfaceContainerHighest: surfaceContainerHighestLight,
      onSurfaceVariant: onSurfaceVariantLight,
      outline: outlineLight,
      outlineVariant: outlineVariantLight,
      shadow: scrimLight,
      inverseSurface: inverseSurfaceLight,
      onInverseSurface: inverseOnSurfaceLight,
      inversePrimary: inversePrimaryLight,
      surfaceTint: primaryLight,
    );
  }

  @override
  ColorScheme darkColorScheme(ThemeContrast contrast) {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryDark,
      onPrimary: onPrimaryDark,
      primaryContainer: primaryContainerDark,
      onPrimaryContainer: onPrimaryContainerDark,
      secondary: secondaryDark,
      onSecondary: onSecondaryDark,
      secondaryContainer: secondaryContainerDark,
      onSecondaryContainer: onSecondaryContainerDark,
      tertiary: tertiaryDark,
      onTertiary: onTertiaryDark,
      tertiaryContainer: tertiaryContainerDark,
      onTertiaryContainer: onTertiaryContainerDark,
      error: errorDark,
      onError: onErrorDark,
      errorContainer: errorContainerDark,
      onErrorContainer: onErrorContainerDark,
      surface: surfaceDark,
      onSurface: onSurfaceDark,
      surfaceContainerHighest: surfaceContainerHighestDark,
      onSurfaceVariant: onSurfaceVariantDark,
      outline: outlineDark,
      outlineVariant: outlineVariantDark,
      shadow: scrimDark,
      inverseSurface: inverseSurfaceDark,
      onInverseSurface: inverseOnSurfaceDark,
      inversePrimary: inversePrimaryDark,
      surfaceTint: primaryDark,
    );
  }
}
