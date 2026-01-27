import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class Green2Theme extends AppTheme {
  @override
  String get id => 'green2';

  @override
  String get name => 'Green2';

  // Colors
  static const primaryLight = Color(0xFF475B35);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFBAD1A2);
  static const onPrimaryContainerLight = Color(0xFF0D1E02);
  static const secondaryLight = Color(0xFF56624A);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFDAE7C9);
  static const onSecondaryContainerLight = Color(0xFF141E0C);
  static const tertiaryLight = Color(0xFF386664);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFBBECE9);
  static const onTertiaryContainerLight = Color(0xFF00201F);
  static const errorLight = Color(0xFFB3261E);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFF9DEDC);
  static const onErrorContainerLight = Color(0xFF410E0B);
  static const backgroundLight = Color(0xFFF7FBED);
  static const onBackgroundLight = Color(0xFF191D14);
  static const surfaceLight = Color(0xFFF7FBED);
  static const onSurfaceLight = Color(0xFF191D14);
  static const surfaceVariantLight = Color(0xFFE0E4D6);
  static const onSurfaceVariantLight = Color(0xFF44483E);
  static const outlineLight = Color(0xFF73786C);
  static const outlineVariantLight = Color(0xFFC4C8BA);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF2D3228);
  static const inverseOnSurfaceLight = Color(0xFFEFF2E4);
  static const inversePrimaryLight = Color(0xFFA1B88B);
  static const surfaceDimLight = Color(0xFFD7DCCE);
  static const surfaceBrightLight = Color(0xFFF7FBED);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF1F5E7);
  static const surfaceContainerLight = Color(0xFFEBF0E1);
  static const surfaceContainerHighLight = Color(0xFFE5EADC);
  static const surfaceContainerHighestLight = Color(0xFFE0E4D6);
  static const primaryDark = Color(0xFFA1B88B);
  static const onPrimaryDark = Color(0xFF1F3110);
  static const primaryContainerDark = Color(0xFF334522);
  static const onPrimaryContainerDark = Color(0xFFBAD1A2);
  static const secondaryDark = Color(0xFFBECBAE);
  static const onSecondaryDark = Color(0xFF29341F);
  static const secondaryContainerDark = Color(0xFF3F4A34);
  static const onSecondaryContainerDark = Color(0xFFDAE7C9);
  static const tertiaryDark = Color(0xFFA0CFCD);
  static const onTertiaryDark = Color(0xFF003736);
  static const tertiaryContainerDark = Color(0xFF1E4E4D);
  static const onTertiaryContainerDark = Color(0xFFBBECE9);
  static const errorDark = Color(0xFFF2B8B5);
  static const onErrorDark = Color(0xFF601410);
  static const errorContainerDark = Color(0xFF8C1D18);
  static const onErrorContainerDark = Color(0xFFF9DEDC);
  static const backgroundDark = Color(0xFF10150D);
  static const onBackgroundDark = Color(0xFFE0E4D6);
  static const surfaceDark = Color(0xFF0F120D);
  static const onSurfaceDark = Color(0xFFE0E4D6);
  static const surfaceVariantDark = Color(0xFF44483E);
  static const onSurfaceVariantDark = Color(0xFFC4C8BA);
  static const outlineDark = Color(0xFF8E9286);
  static const outlineVariantDark = Color(0xFF44483E);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFE0E4D6);
  static const inverseOnSurfaceDark = Color(0xFF2D3228);
  static const inversePrimaryDark = Color(0xFF475B35);
  static const surfaceDimDark = Color(0xFF10150D);
  static const surfaceBrightDark = Color(0xFF363B31);
  static const surfaceContainerLowestDark = Color(0xFF090B08);
  static const surfaceContainerLowDark = Color(0xFF191D15);
  static const surfaceContainerDark = Color(0xFF1D2119);
  static const surfaceContainerHighDark = Color(0xFF272B23);
  static const surfaceContainerHighestDark = Color(0xFF31362D);

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
