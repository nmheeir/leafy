import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class GreenGrayTheme extends AppTheme {
  @override
  String get id => 'greengray';

  @override
  String get name => 'GreenGray';

  // Colors
  static const primaryLight = Color(0xFF52564B);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFC7CBBC);
  static const onPrimaryContainerLight = Color(0xFF161B12);
  static const secondaryLight = Color(0xFF5B6055);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFE0E4D6);
  static const onSecondaryContainerLight = Color(0xFF191D14);
  static const tertiaryLight = Color(0xFF56624A);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFDAE7C9);
  static const onTertiaryContainerLight = Color(0xFF141E0C);
  static const errorLight = Color(0xFFB3261E);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFF9DEDC);
  static const onErrorContainerLight = Color(0xFF410E0B);
  static const backgroundLight = Color(0xFFFCF9F6);
  static const onBackgroundLight = Color(0xFF1B1C1A);
  static const surfaceLight = Color(0xFFFCF9F6);
  static const onSurfaceLight = Color(0xFF1B1C1A);
  static const surfaceVariantLight = Color(0xFFE4E2DE);
  static const onSurfaceVariantLight = Color(0xFF474744);
  static const outlineLight = Color(0xFF777673);
  static const outlineVariantLight = Color(0xFFC8C6C3);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF30302E);
  static const inverseOnSurfaceLight = Color(0xFFF3F0ED);
  static const inversePrimaryLight = Color(0xFFAEB2A4);
  static const surfaceDimLight = Color(0xFFDCD9D7);
  static const surfaceBrightLight = Color(0xFFFCF9F6);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF6F3F0);
  static const surfaceContainerLight = Color(0xFFF0EDEA);
  static const surfaceContainerHighLight = Color(0xFFEBE8E5);
  static const surfaceContainerHighestLight = Color(0xFFE4E2DE);
  static const primaryDark = Color(0xFFAEB2A4);
  static const onPrimaryDark = Color(0xFF292E24);
  static const primaryContainerDark = Color(0xFF3D4237);
  static const onPrimaryContainerDark = Color(0xFFC7CBBC);
  static const secondaryDark = Color(0xFFC4C8BA);
  static const onSecondaryDark = Color(0xFF2D3228);
  static const secondaryContainerDark = Color(0xFF44483E);
  static const onSecondaryContainerDark = Color(0xFFE0E4D6);
  static const tertiaryDark = Color(0xFFBECBAE);
  static const onTertiaryDark = Color(0xFF29341F);
  static const tertiaryContainerDark = Color(0xFF3F4A34);
  static const onTertiaryContainerDark = Color(0xFFDAE7C9);
  static const errorDark = Color(0xFFF2B8B5);
  static const onErrorDark = Color(0xFF601410);
  static const errorContainerDark = Color(0xFF8C1D18);
  static const onErrorContainerDark = Color(0xFFF9DEDC);
  static const backgroundDark = Color(0xFF131312);
  static const onBackgroundDark = Color(0xFFE4E2DE);
  static const surfaceDark = Color(0xFF101010);
  static const onSurfaceDark = Color(0xFFE4E2DE);
  static const surfaceVariantDark = Color(0xFF474744);
  static const onSurfaceVariantDark = Color(0xFFC8C6C3);
  static const outlineDark = Color(0xFF92918D);
  static const outlineVariantDark = Color(0xFF474744);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFE4E2DE);
  static const inverseOnSurfaceDark = Color(0xFF30302E);
  static const inversePrimaryDark = Color(0xFF52564B);
  static const surfaceDimDark = Color(0xFF131312);
  static const surfaceBrightDark = Color(0xFF3A3937);
  static const surfaceContainerLowestDark = Color(0xFF0A0A09);
  static const surfaceContainerLowDark = Color(0xFF1B1C1A);
  static const surfaceContainerDark = Color(0xFF20201E);
  static const surfaceContainerHighDark = Color(0xFF2A2A28);
  static const surfaceContainerHighestDark = Color(0xFF353533);

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
