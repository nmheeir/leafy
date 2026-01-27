import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class Yellow2Theme extends AppTheme {
  @override
  String get id => 'yellow2';

  @override
  String get name => 'Yellow2';

  // Colors
  static const primaryLight = Color(0xFF66530B);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFE2C776);
  static const onPrimaryContainerLight = Color(0xFF211900);
  static const secondaryLight = Color(0xFF685E40);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFF1E1BB);
  static const onSecondaryContainerLight = Color(0xFF221B04);
  static const tertiaryLight = Color(0xFF46664B);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFC7ECCA);
  static const onTertiaryContainerLight = Color(0xFF02210C);
  static const errorLight = Color(0xFFB3261E);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFF9DEDC);
  static const onErrorContainerLight = Color(0xFF410E0B);
  static const backgroundLight = Color(0xFFFBF9F8);
  static const onBackgroundLight = Color(0xFF1B1B1B);
  static const surfaceLight = Color(0xFFFBF9F8);
  static const onSurfaceLight = Color(0xFF1B1B1B);
  static const surfaceVariantLight = Color(0xFFE2E2E2);
  static const onSurfaceVariantLight = Color(0xFF474747);
  static const outlineLight = Color(0xFF767676);
  static const outlineVariantLight = Color(0xFFC6C6C6);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF303030);
  static const inverseOnSurfaceLight = Color(0xFFF1F1F1);
  static const inversePrimaryLight = Color(0xFFC8AF60);
  static const surfaceDimLight = Color(0xFFDBDAD9);
  static const surfaceBrightLight = Color(0xFFFBF9F8);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF5F3F3);
  static const surfaceContainerLight = Color(0xFFEFEDED);
  static const surfaceContainerHighLight = Color(0xFFE9E8E7);
  static const surfaceContainerHighestLight = Color(0xFFE2E2E2);
  static const primaryDark = Color(0xFFC8AF60);
  static const onPrimaryDark = Color(0xFF372B00);
  static const primaryContainerDark = Color(0xFF4E3E00);
  static const onPrimaryContainerDark = Color(0xFFE2C776);
  static const secondaryDark = Color(0xFFD4C5A1);
  static const onSecondaryDark = Color(0xFF383016);
  static const secondaryContainerDark = Color(0xFF50462A);
  static const onSecondaryContainerDark = Color(0xFFF1E1BB);
  static const tertiaryDark = Color(0xFFACCFAF);
  static const onTertiaryDark = Color(0xFF183720);
  static const tertiaryContainerDark = Color(0xFF2F4E35);
  static const onTertiaryContainerDark = Color(0xFFC7ECCA);
  static const errorDark = Color(0xFFF2B8B5);
  static const onErrorDark = Color(0xFF601410);
  static const errorContainerDark = Color(0xFF8C1D18);
  static const onErrorContainerDark = Color(0xFFF9DEDC);
  static const backgroundDark = Color(0xFF131314);
  static const onBackgroundDark = Color(0xFFE2E2E2);
  static const surfaceDark = Color(0xFF111111);
  static const onSurfaceDark = Color(0xFFE2E2E2);
  static const surfaceVariantDark = Color(0xFF474747);
  static const onSurfaceVariantDark = Color(0xFFC6C6C6);
  static const outlineDark = Color(0xFF919191);
  static const outlineVariantDark = Color(0xFF474747);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFE2E2E2);
  static const inverseOnSurfaceDark = Color(0xFF303030);
  static const inversePrimaryDark = Color(0xFF66530B);
  static const surfaceDimDark = Color(0xFF131314);
  static const surfaceBrightDark = Color(0xFF393939);
  static const surfaceContainerLowestDark = Color(0xFF090A0A);
  static const surfaceContainerLowDark = Color(0xFF1B1B1B);
  static const surfaceContainerDark = Color(0xFF1F2020);
  static const surfaceContainerHighDark = Color(0xFF292A2A);
  static const surfaceContainerHighestDark = Color(0xFF343535);

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
