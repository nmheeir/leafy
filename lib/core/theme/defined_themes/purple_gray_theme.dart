import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class PurpleGrayTheme extends AppTheme {
  @override
  String get id => 'purplegray';

  @override
  String get name => 'PurpleGray';

  // Colors
  static const primaryLight = Color(0xFF55545D);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFCBC8D3);
  static const onPrimaryContainerLight = Color(0xFF191921);
  static const secondaryLight = Color(0xFF5F5D67);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFE4E1EC);
  static const onSecondaryContainerLight = Color(0xFF1B1B23);
  static const tertiaryLight = Color(0xFF5E5C71);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFE3E0F9);
  static const onTertiaryContainerLight = Color(0xFF1A1A2C);
  static const errorLight = Color(0xFFB3261E);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFF9DEDC);
  static const onErrorContainerLight = Color(0xFF410E0B);
  static const backgroundLight = Color(0xFFFCF8F9);
  static const onBackgroundLight = Color(0xFF1C1B1D);
  static const surfaceLight = Color(0xFFFCF8F9);
  static const onSurfaceLight = Color(0xFF1C1B1D);
  static const surfaceVariantLight = Color(0xFFE5E1E3);
  static const onSurfaceVariantLight = Color(0xFF484648);
  static const outlineLight = Color(0xFF777577);
  static const outlineVariantLight = Color(0xFFC9C5C7);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF313032);
  static const inverseOnSurfaceLight = Color(0xFFF4F0F1);
  static const inversePrimaryLight = Color(0xFFB2AFBA);
  static const surfaceDimLight = Color(0xFFDCD9DA);
  static const surfaceBrightLight = Color(0xFFFCF8F9);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF6F3F4);
  static const surfaceContainerLight = Color(0xFFF0EDEE);
  static const surfaceContainerHighLight = Color(0xFFEAE7E8);
  static const surfaceContainerHighestLight = Color(0xFFE5E1E3);
  static const primaryDark = Color(0xFFB2AFBA);
  static const onPrimaryDark = Color(0xFF2C2B34);
  static const primaryContainerDark = Color(0xFF403F48);
  static const onPrimaryContainerDark = Color(0xFFCBC8D3);
  static const secondaryDark = Color(0xFFC8C5D0);
  static const onSecondaryDark = Color(0xFF302F38);
  static const secondaryContainerDark = Color(0xFF47464F);
  static const onSecondaryContainerDark = Color(0xFFE4E1EC);
  static const tertiaryDark = Color(0xFFC7C4DD);
  static const onTertiaryDark = Color(0xFF2F2E42);
  static const tertiaryContainerDark = Color(0xFF464559);
  static const onTertiaryContainerDark = Color(0xFFE3E0F9);
  static const errorDark = Color(0xFFF2B8B5);
  static const onErrorDark = Color(0xFF601410);
  static const errorContainerDark = Color(0xFF8C1D18);
  static const onErrorContainerDark = Color(0xFFF9DEDC);
  static const backgroundDark = Color(0xFF131314);
  static const onBackgroundDark = Color(0xFFE5E1E3);
  static const surfaceDark = Color(0xFF111111);
  static const onSurfaceDark = Color(0xFFE5E1E3);
  static const surfaceVariantDark = Color(0xFF484648);
  static const onSurfaceVariantDark = Color(0xFFC9C5C7);
  static const outlineDark = Color(0xFF929092);
  static const outlineVariantDark = Color(0xFF484648);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFE5E1E3);
  static const inverseOnSurfaceDark = Color(0xFF313032);
  static const inversePrimaryDark = Color(0xFF55545D);
  static const surfaceDimDark = Color(0xFF131314);
  static const surfaceBrightDark = Color(0xFF39393A);
  static const surfaceContainerLowestDark = Color(0xFF0A0A0B);
  static const surfaceContainerLowDark = Color(0xFF1C1B1D);
  static const surfaceContainerDark = Color(0xFF201F20);
  static const surfaceContainerHighDark = Color(0xFF2A2A2B);
  static const surfaceContainerHighestDark = Color(0xFF353435);

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
