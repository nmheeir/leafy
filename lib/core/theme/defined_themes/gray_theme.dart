import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class GrayTheme extends AppTheme {
  @override
  String get id => 'gray';

  @override
  String get name => 'Gray';

  // Colors
  static const primaryLight = Color(0xFF000000);
  static const onPrimaryLight = Color(0xFFE2E2E2);
  static const primaryContainerLight = Color(0xFF3B3B3B);
  static const onPrimaryContainerLight = Color(0xFFFFFFFF);
  static const secondaryLight = Color(0xFF5E5E5E);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFD4D4D4);
  static const onSecondaryContainerLight = Color(0xFF1B1B1B);
  static const tertiaryLight = Color(0xFF3B3B3B);
  static const onTertiaryLight = Color(0xFFE2E2E2);
  static const tertiaryContainerLight = Color(0xFF747474);
  static const onTertiaryContainerLight = Color(0xFFFFFFFF);
  static const errorLight = Color(0xFFB3261E);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFF9DEDC);
  static const onErrorContainerLight = Color(0xFF410E0B);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const onBackgroundLight = Color(0xFF1B1B1B);
  static const surfaceLight = Color(0xFFF9F9F9);
  static const onSurfaceLight = Color(0xFF1B1B1B);
  static const surfaceVariantLight = Color(0xFFE2E2E2);
  static const onSurfaceVariantLight = Color(0xFF474747);
  static const outlineLight = Color(0xFF777777);
  static const outlineVariantLight = Color(0xFFC6C6C6);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF131313);
  static const inverseOnSurfaceLight = Color(0xFFE2E2E2);
  static const inversePrimaryLight = Color(0xFFFFFFFF);
  static const surfaceDimLight = Color(0xFFDADADA);
  static const surfaceBrightLight = Color(0xFFF9F9F9);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF3F3F3);
  static const surfaceContainerLight = Color(0xFFEEEEEE);
  static const surfaceContainerHighLight = Color(0xFFE8E8E8);
  static const surfaceContainerHighestLight = Color(0xFFE2E2E2);
  static const primaryDark = Color(0xFFFFFFFF);
  static const onPrimaryDark = Color(0xFF1B1B1B);
  static const primaryContainerDark = Color(0xFFD4D4D4);
  static const onPrimaryContainerDark = Color(0xFF000000);
  static const secondaryDark = Color(0xFFC6C6C6);
  static const onSecondaryDark = Color(0xFF1B1B1B);
  static const secondaryContainerDark = Color(0xFF474747);
  static const onSecondaryContainerDark = Color(0xFFE2E2E2);
  static const tertiaryDark = Color(0xFFE2E2E2);
  static const onTertiaryDark = Color(0xFF1B1B1B);
  static const tertiaryContainerDark = Color(0xFF919191);
  static const onTertiaryContainerDark = Color(0xFF000000);
  static const errorDark = Color(0xFFF2B8B5);
  static const onErrorDark = Color(0xFF601410);
  static const errorContainerDark = Color(0xFF8C1D18);
  static const onErrorContainerDark = Color(0xFFF9DEDC);
  static const backgroundDark = Color(0xFF131313);
  static const onBackgroundDark = Color(0xFFE2E2E2);
  static const surfaceDark = Color(0xFF101010);
  static const onSurfaceDark = Color(0xFFE2E2E2);
  static const surfaceVariantDark = Color(0xFF474747);
  static const onSurfaceVariantDark = Color(0xFFC6C6C6);
  static const outlineDark = Color(0xFF919191);
  static const outlineVariantDark = Color(0xFF474747);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFF9F9F9);
  static const inverseOnSurfaceDark = Color(0xFF1B1B1B);
  static const inversePrimaryDark = Color(0xFF000000);
  static const surfaceDimDark = Color(0xFF131313);
  static const surfaceBrightDark = Color(0xFF393939);
  static const surfaceContainerLowestDark = Color(0xFF0A0A0A);
  static const surfaceContainerLowDark = Color(0xFF1B1B1B);
  static const surfaceContainerDark = Color(0xFF1F1F1F);
  static const surfaceContainerHighDark = Color(0xFF2A2A2A);
  static const surfaceContainerHighestDark = Color(0xFF353535);

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
