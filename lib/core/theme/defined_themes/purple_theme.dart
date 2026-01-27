import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class PurpleTheme extends AppTheme {
  @override
  String get id => 'purple';

  @override
  String get name => 'Purple';

  @override
  List<ThemeContrast> get supportedContrasts => ThemeContrast.values;

  // Colors
  static const primaryLight = Color(0xFF725188);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFF3DAFF);
  static const onPrimaryContainerLight = Color(0xFF2B0C40);
  static const secondaryLight = Color(0xFF675A6E);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFEFDCF5);
  static const onSecondaryContainerLight = Color(0xFF221729);
  static const tertiaryLight = Color(0xFF815154);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFFFDADA);
  static const onTertiaryContainerLight = Color(0xFF331014);
  static const errorLight = Color(0xFFBA1A1A);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFFFDAD6);
  static const onErrorContainerLight = Color(0xFF410002);
  static const backgroundLight = Color(0xFFFFF7FD);
  static const onBackgroundLight = Color(0xFF1E1A20);
  static const surfaceLight = Color(0xFFFFF7FD);
  static const onSurfaceLight = Color(0xFF1E1A20);
  static const surfaceVariantLight = Color(0xFFEADFEA);
  static const onSurfaceVariantLight = Color(0xFF4B454D);
  static const outlineLight = Color(0xFF7C747E);
  static const outlineVariantLight = Color(0xFFCDC3CE);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF332F35);
  static const inverseOnSurfaceLight = Color(0xFFF7EEF6);
  static const inversePrimaryLight = Color(0xFFDFB8F6);
  static const surfaceDimLight = Color(0xFFE0D7DF);
  static const surfaceBrightLight = Color(0xFFFFF7FD);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFFAF1F9);
  static const surfaceContainerLight = Color(0xFFF4EBF3);
  static const surfaceContainerHighLight = Color(0xFFEEE6ED);
  static const surfaceContainerHighestLight = Color(0xFFE9E0E8);
  static const primaryLightMediumContrast = Color(0xFF55366A);
  static const onPrimaryLightMediumContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightMediumContrast = Color(0xFF89679F);
  static const onPrimaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryLightMediumContrast = Color(0xFF4B3E52);
  static const onSecondaryLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightMediumContrast = Color(0xFF7E6F85);
  static const onSecondaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryLightMediumContrast = Color(0xFF613739);
  static const onTertiaryLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightMediumContrast = Color(0xFF9A676A);
  static const onTertiaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const errorLightMediumContrast = Color(0xFF8C0009);
  static const onErrorLightMediumContrast = Color(0xFFFFFFFF);
  static const errorContainerLightMediumContrast = Color(0xFFDA342E);
  static const onErrorContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const backgroundLightMediumContrast = Color(0xFFFFF7FD);
  static const onBackgroundLightMediumContrast = Color(0xFF1E1A20);
  static const surfaceLightMediumContrast = Color(0xFFFFF7FD);
  static const onSurfaceLightMediumContrast = Color(0xFF1E1A20);
  static const surfaceVariantLightMediumContrast = Color(0xFFEADFEA);
  static const onSurfaceVariantLightMediumContrast = Color(0xFF474149);
  static const outlineLightMediumContrast = Color(0xFF645D66);
  static const outlineVariantLightMediumContrast = Color(0xFF807882);
  static const scrimLightMediumContrast = Color(0xFF000000);
  static const inverseSurfaceLightMediumContrast = Color(0xFF332F35);
  static const inverseOnSurfaceLightMediumContrast = Color(0xFFF7EEF6);
  static const inversePrimaryLightMediumContrast = Color(0xFFDFB8F6);
  static const surfaceDimLightMediumContrast = Color(0xFFE0D7DF);
  static const surfaceBrightLightMediumContrast = Color(0xFFFFF7FD);
  static const surfaceContainerLowestLightMediumContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightMediumContrast = Color(0xFFFAF1F9);
  static const surfaceContainerLightMediumContrast = Color(0xFFF4EBF3);
  static const surfaceContainerHighLightMediumContrast = Color(0xFFEEE6ED);
  static const surfaceContainerHighestLightMediumContrast = Color(0xFFE9E0E8);
  static const primaryLightHighContrast = Color(0xFF321347);
  static const onPrimaryLightHighContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightHighContrast = Color(0xFF55366A);
  static const onPrimaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryLightHighContrast = Color(0xFF291E30);
  static const onSecondaryLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightHighContrast = Color(0xFF4B3E52);
  static const onSecondaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryLightHighContrast = Color(0xFF3B171A);
  static const onTertiaryLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightHighContrast = Color(0xFF613739);
  static const onTertiaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const errorLightHighContrast = Color(0xFF4E0002);
  static const onErrorLightHighContrast = Color(0xFFFFFFFF);
  static const errorContainerLightHighContrast = Color(0xFF8C0009);
  static const onErrorContainerLightHighContrast = Color(0xFFFFFFFF);
  static const backgroundLightHighContrast = Color(0xFFFFF7FD);
  static const onBackgroundLightHighContrast = Color(0xFF1E1A20);
  static const surfaceLightHighContrast = Color(0xFFFFF7FD);
  static const onSurfaceLightHighContrast = Color(0xFF000000);
  static const surfaceVariantLightHighContrast = Color(0xFFEADFEA);
  static const onSurfaceVariantLightHighContrast = Color(0xFF27222A);
  static const outlineLightHighContrast = Color(0xFF474149);
  static const outlineVariantLightHighContrast = Color(0xFF474149);
  static const scrimLightHighContrast = Color(0xFF000000);
  static const inverseSurfaceLightHighContrast = Color(0xFF332F35);
  static const inverseOnSurfaceLightHighContrast = Color(0xFFFFFFFF);
  static const inversePrimaryLightHighContrast = Color(0xFFF9E6FF);
  static const surfaceDimLightHighContrast = Color(0xFFE0D7DF);
  static const surfaceBrightLightHighContrast = Color(0xFFFFF7FD);
  static const surfaceContainerLowestLightHighContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightHighContrast = Color(0xFFFAF1F9);
  static const surfaceContainerLightHighContrast = Color(0xFFF4EBF3);
  static const surfaceContainerHighLightHighContrast = Color(0xFFEEE6ED);
  static const surfaceContainerHighestLightHighContrast = Color(0xFFE9E0E8);
  static const primaryDark = Color(0xFFDFB8F6);
  static const onPrimaryDark = Color(0xFF412356);
  static const primaryContainerDark = Color(0xFF593A6E);
  static const onPrimaryContainerDark = Color(0xFFF3DAFF);
  static const secondaryDark = Color(0xFFD2C1D9);
  static const onSecondaryDark = Color(0xFF382C3E);
  static const secondaryContainerDark = Color(0xFF4F4256);
  static const onSecondaryContainerDark = Color(0xFFEFDCF5);
  static const tertiaryDark = Color(0xFFF4B7B9);
  static const onTertiaryDark = Color(0xFF4C2528);
  static const tertiaryContainerDark = Color(0xFF663B3D);
  static const onTertiaryContainerDark = Color(0xFFFFDADA);
  static const errorDark = Color(0xFFFFB4AB);
  static const onErrorDark = Color(0xFF690005);
  static const errorContainerDark = Color(0xFF93000A);
  static const onErrorContainerDark = Color(0xFFFFDAD6);
  static const backgroundDark = Color(0xFF161217);
  static const onBackgroundDark = Color(0xFFE9E0E8);
  static const surfaceDark = Color(0xFF161217);
  static const onSurfaceDark = Color(0xFFE9E0E8);
  static const surfaceVariantDark = Color(0xFF4B454D);
  static const onSurfaceVariantDark = Color(0xFFCDC3CE);
  static const outlineDark = Color(0xFF968E98);
  static const outlineVariantDark = Color(0xFF4B454D);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFE9E0E8);
  static const inverseOnSurfaceDark = Color(0xFF332F35);
  static const inversePrimaryDark = Color(0xFF725188);
  static const surfaceDimDark = Color(0xFF161217);
  static const surfaceBrightDark = Color(0xFF3C383E);
  static const surfaceContainerLowestDark = Color(0xFF100D12);
  static const surfaceContainerLowDark = Color(0xFF1E1A20);
  static const surfaceContainerDark = Color(0xFF221E24);
  static const surfaceContainerHighDark = Color(0xFF2D282E);
  static const surfaceContainerHighestDark = Color(0xFF383339);
  static const primaryDarkMediumContrast = Color(0xFFE4BCFB);
  static const onPrimaryDarkMediumContrast = Color(0xFF25053A);
  static const primaryContainerDarkMediumContrast = Color(0xFFA783BD);
  static const onPrimaryContainerDarkMediumContrast = Color(0xFF000000);
  static const secondaryDarkMediumContrast = Color(0xFFD6C5DD);
  static const onSecondaryDarkMediumContrast = Color(0xFF1D1223);
  static const secondaryContainerDarkMediumContrast = Color(0xFF9B8BA2);
  static const onSecondaryContainerDarkMediumContrast = Color(0xFF000000);
  static const tertiaryDarkMediumContrast = Color(0xFFF9BBBE);
  static const onTertiaryDarkMediumContrast = Color(0xFF2C0B0F);
  static const tertiaryContainerDarkMediumContrast = Color(0xFFB98385);
  static const onTertiaryContainerDarkMediumContrast = Color(0xFF000000);
  static const errorDarkMediumContrast = Color(0xFFFFBAB1);
  static const onErrorDarkMediumContrast = Color(0xFF370001);
  static const errorContainerDarkMediumContrast = Color(0xFFFF5449);
  static const onErrorContainerDarkMediumContrast = Color(0xFF000000);
  static const backgroundDarkMediumContrast = Color(0xFF161217);
  static const onBackgroundDarkMediumContrast = Color(0xFFE9E0E8);
  static const surfaceDarkMediumContrast = Color(0xFF161217);
  static const onSurfaceDarkMediumContrast = Color(0xFFFFF9FB);
  static const surfaceVariantDarkMediumContrast = Color(0xFF4B454D);
  static const onSurfaceVariantDarkMediumContrast = Color(0xFFD2C8D2);
  static const outlineDarkMediumContrast = Color(0xFFA9A0AA);
  static const outlineVariantDarkMediumContrast = Color(0xFF89808A);
  static const scrimDarkMediumContrast = Color(0xFF000000);
  static const inverseSurfaceDarkMediumContrast = Color(0xFFE9E0E8);
  static const inverseOnSurfaceDarkMediumContrast = Color(0xFF2D292E);
  static const inversePrimaryDarkMediumContrast = Color(0xFF5A3B70);
  static const surfaceDimDarkMediumContrast = Color(0xFF161217);
  static const surfaceBrightDarkMediumContrast = Color(0xFF3C383E);
  static const surfaceContainerLowestDarkMediumContrast = Color(0xFF100D12);
  static const surfaceContainerLowDarkMediumContrast = Color(0xFF1E1A20);
  static const surfaceContainerDarkMediumContrast = Color(0xFF221E24);
  static const surfaceContainerHighDarkMediumContrast = Color(0xFF2D282E);
  static const surfaceContainerHighestDarkMediumContrast = Color(0xFF383339);
  static const primaryDarkHighContrast = Color(0xFFFFF9FB);
  static const onPrimaryDarkHighContrast = Color(0xFF000000);
  static const primaryContainerDarkHighContrast = Color(0xFFE4BCFB);
  static const onPrimaryContainerDarkHighContrast = Color(0xFF000000);
  static const secondaryDarkHighContrast = Color(0xFFFFF9FB);
  static const onSecondaryDarkHighContrast = Color(0xFF000000);
  static const secondaryContainerDarkHighContrast = Color(0xFFD6C5DD);
  static const onSecondaryContainerDarkHighContrast = Color(0xFF000000);
  static const tertiaryDarkHighContrast = Color(0xFFFFF9F9);
  static const onTertiaryDarkHighContrast = Color(0xFF000000);
  static const tertiaryContainerDarkHighContrast = Color(0xFFF9BBBE);
  static const onTertiaryContainerDarkHighContrast = Color(0xFF000000);
  static const errorDarkHighContrast = Color(0xFFFFF9F9);
  static const onErrorDarkHighContrast = Color(0xFF000000);
  static const errorContainerDarkHighContrast = Color(0xFFFFBAB1);
  static const onErrorContainerDarkHighContrast = Color(0xFF000000);
  static const backgroundDarkHighContrast = Color(0xFF161217);
  static const onBackgroundDarkHighContrast = Color(0xFFE9E0E8);
  static const surfaceDarkHighContrast = Color(0xFF161217);
  static const onSurfaceDarkHighContrast = Color(0xFFFFFFFF);
  static const surfaceVariantDarkHighContrast = Color(0xFF4B454D);
  static const onSurfaceVariantDarkHighContrast = Color(0xFFFFF9FB);
  static const outlineDarkHighContrast = Color(0xFFD2C8D2);
  static const outlineVariantDarkHighContrast = Color(0xFFD2C8D2);
  static const scrimDarkHighContrast = Color(0xFF000000);
  static const inverseSurfaceDarkHighContrast = Color(0xFFE9E0E8);
  static const inverseOnSurfaceDarkHighContrast = Color(0xFF000000);
  static const inversePrimaryDarkHighContrast = Color(0xFF3A1C4F);
  static const surfaceDimDarkHighContrast = Color(0xFF161217);
  static const surfaceBrightDarkHighContrast = Color(0xFF3C383E);
  static const surfaceContainerLowestDarkHighContrast = Color(0xFF100D12);
  static const surfaceContainerLowDarkHighContrast = Color(0xFF1E1A20);
  static const surfaceContainerDarkHighContrast = Color(0xFF221E24);
  static const surfaceContainerHighDarkHighContrast = Color(0xFF2D282E);
  static const surfaceContainerHighestDarkHighContrast = Color(0xFF383339);

  @override
  ColorScheme lightColorScheme(ThemeContrast contrast) {
    switch (contrast) {
      case ThemeContrast.standard:
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
      case ThemeContrast.medium:
        return const ColorScheme(
          brightness: Brightness.light,
          primary: primaryLightMediumContrast,
          onPrimary: onPrimaryLightMediumContrast,
          primaryContainer: primaryContainerLightMediumContrast,
          onPrimaryContainer: onPrimaryContainerLightMediumContrast,
          secondary: secondaryLightMediumContrast,
          onSecondary: onSecondaryLightMediumContrast,
          secondaryContainer: secondaryContainerLightMediumContrast,
          onSecondaryContainer: onSecondaryContainerLightMediumContrast,
          tertiary: tertiaryLightMediumContrast,
          onTertiary: onTertiaryLightMediumContrast,
          tertiaryContainer: tertiaryContainerLightMediumContrast,
          onTertiaryContainer: onTertiaryContainerLightMediumContrast,
          error: errorLightMediumContrast,
          onError: onErrorLightMediumContrast,
          errorContainer: errorContainerLightMediumContrast,
          onErrorContainer: onErrorContainerLightMediumContrast,
          surface: surfaceLightMediumContrast,
          onSurface: onSurfaceLightMediumContrast,
          surfaceContainerHighest: surfaceContainerHighestLightMediumContrast,
          onSurfaceVariant: onSurfaceVariantLightMediumContrast,
          outline: outlineLightMediumContrast,
          outlineVariant: outlineVariantLightMediumContrast,
          shadow: scrimLightMediumContrast,
          inverseSurface: inverseSurfaceLightMediumContrast,
          onInverseSurface: inverseOnSurfaceLightMediumContrast,
          inversePrimary: inversePrimaryLightMediumContrast,
          surfaceTint: primaryLightMediumContrast,
        );
      case ThemeContrast.high:
        return const ColorScheme(
          brightness: Brightness.light,
          primary: primaryLightHighContrast,
          onPrimary: onPrimaryLightHighContrast,
          primaryContainer: primaryContainerLightHighContrast,
          onPrimaryContainer: onPrimaryContainerLightHighContrast,
          secondary: secondaryLightHighContrast,
          onSecondary: onSecondaryLightHighContrast,
          secondaryContainer: secondaryContainerLightHighContrast,
          onSecondaryContainer: onSecondaryContainerLightHighContrast,
          tertiary: tertiaryLightHighContrast,
          onTertiary: onTertiaryLightHighContrast,
          tertiaryContainer: tertiaryContainerLightHighContrast,
          onTertiaryContainer: onTertiaryContainerLightHighContrast,
          error: errorLightHighContrast,
          onError: onErrorLightHighContrast,
          errorContainer: errorContainerLightHighContrast,
          onErrorContainer: onErrorContainerLightHighContrast,
          surface: surfaceLightHighContrast,
          onSurface: onSurfaceLightHighContrast,
          surfaceContainerHighest: surfaceContainerHighestLightHighContrast,
          onSurfaceVariant: onSurfaceVariantLightHighContrast,
          outline: outlineLightHighContrast,
          outlineVariant: outlineVariantLightHighContrast,
          shadow: scrimLightHighContrast,
          inverseSurface: inverseSurfaceLightHighContrast,
          onInverseSurface: inverseOnSurfaceLightHighContrast,
          inversePrimary: inversePrimaryLightHighContrast,
          surfaceTint: primaryLightHighContrast,
        );
    }
  }

  @override
  ColorScheme darkColorScheme(ThemeContrast contrast) {
    switch (contrast) {
      case ThemeContrast.standard:
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
      case ThemeContrast.medium:
        return const ColorScheme(
          brightness: Brightness.dark,
          primary: primaryDarkMediumContrast,
          onPrimary: onPrimaryDarkMediumContrast,
          primaryContainer: primaryContainerDarkMediumContrast,
          onPrimaryContainer: onPrimaryContainerDarkMediumContrast,
          secondary: secondaryDarkMediumContrast,
          onSecondary: onSecondaryDarkMediumContrast,
          secondaryContainer: secondaryContainerDarkMediumContrast,
          onSecondaryContainer: onSecondaryContainerDarkMediumContrast,
          tertiary: tertiaryDarkMediumContrast,
          onTertiary: onTertiaryDarkMediumContrast,
          tertiaryContainer: tertiaryContainerDarkMediumContrast,
          onTertiaryContainer: onTertiaryContainerDarkMediumContrast,
          error: errorDarkMediumContrast,
          onError: onErrorDarkMediumContrast,
          errorContainer: errorContainerDarkMediumContrast,
          onErrorContainer: onErrorContainerDarkMediumContrast,
          surface: surfaceDarkMediumContrast,
          onSurface: onSurfaceDarkMediumContrast,
          surfaceContainerHighest: surfaceContainerHighestDarkMediumContrast,
          onSurfaceVariant: onSurfaceVariantDarkMediumContrast,
          outline: outlineDarkMediumContrast,
          outlineVariant: outlineVariantDarkMediumContrast,
          shadow: scrimDarkMediumContrast,
          inverseSurface: inverseSurfaceDarkMediumContrast,
          onInverseSurface: inverseOnSurfaceDarkMediumContrast,
          inversePrimary: inversePrimaryDarkMediumContrast,
          surfaceTint: primaryDarkMediumContrast,
        );
      case ThemeContrast.high:
        return const ColorScheme(
          brightness: Brightness.dark,
          primary: primaryDarkHighContrast,
          onPrimary: onPrimaryDarkHighContrast,
          primaryContainer: primaryContainerDarkHighContrast,
          onPrimaryContainer: onPrimaryContainerDarkHighContrast,
          secondary: secondaryDarkHighContrast,
          onSecondary: onSecondaryDarkHighContrast,
          secondaryContainer: secondaryContainerDarkHighContrast,
          onSecondaryContainer: onSecondaryContainerDarkHighContrast,
          tertiary: tertiaryDarkHighContrast,
          onTertiary: onTertiaryDarkHighContrast,
          tertiaryContainer: tertiaryContainerDarkHighContrast,
          onTertiaryContainer: onTertiaryContainerDarkHighContrast,
          error: errorDarkHighContrast,
          onError: onErrorDarkHighContrast,
          errorContainer: errorContainerDarkHighContrast,
          onErrorContainer: onErrorContainerDarkHighContrast,
          surface: surfaceDarkHighContrast,
          onSurface: onSurfaceDarkHighContrast,
          surfaceContainerHighest: surfaceContainerHighestDarkHighContrast,
          onSurfaceVariant: onSurfaceVariantDarkHighContrast,
          outline: outlineDarkHighContrast,
          outlineVariant: outlineVariantDarkHighContrast,
          shadow: scrimDarkHighContrast,
          inverseSurface: inverseSurfaceDarkHighContrast,
          onInverseSurface: inverseOnSurfaceDarkHighContrast,
          inversePrimary: inversePrimaryDarkHighContrast,
          surfaceTint: primaryDarkHighContrast,
        );
    }
  }
}
