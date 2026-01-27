import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class Pink2Theme extends AppTheme {
  @override
  String get id => 'pink2';

  @override
  String get name => 'Pink2';

  // Colors
  static const primaryLight = Color(0xFF3E5C38);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFB0D3A5);
  static const onPrimaryContainerLight = Color(0xFF031F03);
  static const secondaryLight = Color(0xFF7C5264);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFFFD8E6);
  static const onSecondaryContainerLight = Color(0xFF301120);
  static const tertiaryLight = Color(0xFF535B8B);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFDEE0FF);
  static const onTertiaryContainerLight = Color(0xFF0E1744);
  static const errorLight = Color(0xFFB3261E);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFF9DEDC);
  static const onErrorContainerLight = Color(0xFF410E0B);
  static const backgroundLight = Color(0xFFF7F8FF);
  static const onBackgroundLight = Color(0xFF191B27);
  static const surfaceLight = Color(0xFFF7F8FF);
  static const onSurfaceLight = Color(0xFF191B27);
  static const surfaceVariantLight = Color(0xFFE1E1F3);
  static const onSurfaceVariantLight = Color(0xFF444654);
  static const outlineLight = Color(0xFF747584);
  static const outlineVariantLight = Color(0xFFC5C5D6);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF2E303D);
  static const inverseOnSurfaceLight = Color(0xFFF0EFFF);
  static const inversePrimaryLight = Color(0xFF98BA8D);
  static const surfaceDimLight = Color(0xFFD8D9EA);
  static const surfaceBrightLight = Color(0xFFF7F8FF);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF2F3FF);
  static const surfaceContainerLight = Color(0xFFECEDFF);
  static const surfaceContainerHighLight = Color(0xFFE6E7F9);
  static const surfaceContainerHighestLight = Color(0xFFE1E1F3);
  static const primaryDark = Color(0xFF98BA8D);
  static const onPrimaryDark = Color(0xFF163212);
  static const primaryContainerDark = Color(0xFF2A4724);
  static const onPrimaryContainerDark = Color(0xFFB0D3A5);
  static const secondaryDark = Color(0xFFEDB8CD);
  static const onSecondaryDark = Color(0xFF482535);
  static const secondaryContainerDark = Color(0xFF623B4C);
  static const onSecondaryContainerDark = Color(0xFFFFD8E6);
  static const tertiaryDark = Color(0xFFBCC3FA);
  static const onTertiaryDark = Color(0xFF252D5A);
  static const tertiaryContainerDark = Color(0xFF3C4472);
  static const onTertiaryContainerDark = Color(0xFFDEE0FF);
  static const errorDark = Color(0xFFF2B8B5);
  static const onErrorDark = Color(0xFF601410);
  static const errorContainerDark = Color(0xFF8C1D18);
  static const onErrorContainerDark = Color(0xFFF9DEDC);
  static const backgroundDark = Color(0xFF12131F);
  static const onBackgroundDark = Color(0xFFE1E1F3);
  static const surfaceDark = Color(0xFF12131B);
  static const onSurfaceDark = Color(0xFFE1E1F3);
  static const surfaceVariantDark = Color(0xFF444654);
  static const onSurfaceVariantDark = Color(0xFFC5C5D6);
  static const outlineDark = Color(0xFF8F8F9F);
  static const outlineVariantDark = Color(0xFF444654);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFE1E1F3);
  static const inverseOnSurfaceDark = Color(0xFF2E303D);
  static const inversePrimaryDark = Color(0xFF3E5C38);
  static const surfaceDimDark = Color(0xFF12131F);
  static const surfaceBrightDark = Color(0xFF373846);
  static const surfaceContainerLowestDark = Color(0xFF0E0E13);
  static const surfaceContainerLowDark = Color(0xFF1A1C27);
  static const surfaceContainerDark = Color(0xFF1F202B);
  static const surfaceContainerHighDark = Color(0xFF292A36);
  static const surfaceContainerHighestDark = Color(0xFF333442);

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
