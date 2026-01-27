import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class PinkTheme extends AppTheme {
  @override
  String get id => 'pink';

  @override
  String get name => 'Pink';

  @override
  List<ThemeContrast> get supportedContrasts => ThemeContrast.values;

  // Colors
  static const primaryLight = Color(0xFF8C4A60);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFFFD9E2);
  static const onPrimaryContainerLight = Color(0xFF3A071D);
  static const secondaryLight = Color(0xFF74565F);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFFFD9E2);
  static const onSecondaryContainerLight = Color(0xFF2B151C);
  static const tertiaryLight = Color(0xFF7C5635);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFFFDCC2);
  static const onTertiaryContainerLight = Color(0xFF2E1500);
  static const errorLight = Color(0xFFBA1A1A);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFFFDAD6);
  static const onErrorContainerLight = Color(0xFF410002);
  static const backgroundLight = Color(0xFFFFF8F8);
  static const onBackgroundLight = Color(0xFF22191C);
  static const surfaceLight = Color(0xFFFFF8F8);
  static const onSurfaceLight = Color(0xFF22191C);
  static const surfaceVariantLight = Color(0xFFF2DDE2);
  static const onSurfaceVariantLight = Color(0xFF514347);
  static const outlineLight = Color(0xFF837377);
  static const outlineVariantLight = Color(0xFFD5C2C6);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF372E30);
  static const inverseOnSurfaceLight = Color(0xFFFDEDEF);
  static const inversePrimaryLight = Color(0xFFFFB0C8);
  static const surfaceDimLight = Color(0xFFE6D6D9);
  static const surfaceBrightLight = Color(0xFFFFF8F8);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFFFF0F2);
  static const surfaceContainerLight = Color(0xFFFAEAED);
  static const surfaceContainerHighLight = Color(0xFFF5E4E7);
  static const surfaceContainerHighestLight = Color(0xFFEFDFE1);
  static const primaryLightMediumContrast = Color(0xFF6B2F45);
  static const onPrimaryLightMediumContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightMediumContrast = Color(0xFFA55F77);
  static const onPrimaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryLightMediumContrast = Color(0xFF563B43);
  static const onSecondaryLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightMediumContrast = Color(0xFF8C6C75);
  static const onSecondaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryLightMediumContrast = Color(0xFF5D3B1C);
  static const onTertiaryLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightMediumContrast = Color(0xFF956C49);
  static const onTertiaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const errorLightMediumContrast = Color(0xFF8C0009);
  static const onErrorLightMediumContrast = Color(0xFFFFFFFF);
  static const errorContainerLightMediumContrast = Color(0xFFDA342E);
  static const onErrorContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const backgroundLightMediumContrast = Color(0xFFFFF8F8);
  static const onBackgroundLightMediumContrast = Color(0xFF22191C);
  static const surfaceLightMediumContrast = Color(0xFFFFF8F8);
  static const onSurfaceLightMediumContrast = Color(0xFF22191C);
  static const surfaceVariantLightMediumContrast = Color(0xFFF2DDE2);
  static const onSurfaceVariantLightMediumContrast = Color(0xFF4D3F43);
  static const outlineLightMediumContrast = Color(0xFF6A5B5F);
  static const outlineVariantLightMediumContrast = Color(0xFF87777A);
  static const scrimLightMediumContrast = Color(0xFF000000);
  static const inverseSurfaceLightMediumContrast = Color(0xFF372E30);
  static const inverseOnSurfaceLightMediumContrast = Color(0xFFFDEDEF);
  static const inversePrimaryLightMediumContrast = Color(0xFFFFB0C8);
  static const surfaceDimLightMediumContrast = Color(0xFFE6D6D9);
  static const surfaceBrightLightMediumContrast = Color(0xFFFFF8F8);
  static const surfaceContainerLowestLightMediumContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightMediumContrast = Color(0xFFFFF0F2);
  static const surfaceContainerLightMediumContrast = Color(0xFFFAEAED);
  static const surfaceContainerHighLightMediumContrast = Color(0xFFF5E4E7);
  static const surfaceContainerHighestLightMediumContrast = Color(0xFFEFDFE1);
  static const primaryLightHighContrast = Color(0xFF420E24);
  static const onPrimaryLightHighContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightHighContrast = Color(0xFF6B2F45);
  static const onPrimaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryLightHighContrast = Color(0xFF321B23);
  static const onSecondaryLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightHighContrast = Color(0xFF563B43);
  static const onSecondaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryLightHighContrast = Color(0xFF371B01);
  static const onTertiaryLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightHighContrast = Color(0xFF5D3B1C);
  static const onTertiaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const errorLightHighContrast = Color(0xFF4E0002);
  static const onErrorLightHighContrast = Color(0xFFFFFFFF);
  static const errorContainerLightHighContrast = Color(0xFF8C0009);
  static const onErrorContainerLightHighContrast = Color(0xFFFFFFFF);
  static const backgroundLightHighContrast = Color(0xFFFFF8F8);
  static const onBackgroundLightHighContrast = Color(0xFF22191C);
  static const surfaceLightHighContrast = Color(0xFFFFF8F8);
  static const onSurfaceLightHighContrast = Color(0xFF000000);
  static const surfaceVariantLightHighContrast = Color(0xFFF2DDE2);
  static const onSurfaceVariantLightHighContrast = Color(0xFF2C2124);
  static const outlineLightHighContrast = Color(0xFF4D3F43);
  static const outlineVariantLightHighContrast = Color(0xFF4D3F43);
  static const scrimLightHighContrast = Color(0xFF000000);
  static const inverseSurfaceLightHighContrast = Color(0xFF372E30);
  static const inverseOnSurfaceLightHighContrast = Color(0xFFFFFFFF);
  static const inversePrimaryLightHighContrast = Color(0xFFFFE6EB);
  static const surfaceDimLightHighContrast = Color(0xFFE6D6D9);
  static const surfaceBrightLightHighContrast = Color(0xFFFFF8F8);
  static const surfaceContainerLowestLightHighContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightHighContrast = Color(0xFFFFF0F2);
  static const surfaceContainerLightHighContrast = Color(0xFFFAEAED);
  static const surfaceContainerHighLightHighContrast = Color(0xFFF5E4E7);
  static const surfaceContainerHighestLightHighContrast = Color(0xFFEFDFE1);
  static const primaryDark = Color(0xFFFFB0C8);
  static const onPrimaryDark = Color(0xFF541D32);
  static const primaryContainerDark = Color(0xFF703349);
  static const onPrimaryContainerDark = Color(0xFFFFD9E2);
  static const secondaryDark = Color(0xFFE2BDC6);
  static const onSecondaryDark = Color(0xFF422931);
  static const secondaryContainerDark = Color(0xFF5A3F47);
  static const onSecondaryContainerDark = Color(0xFFFFD9E2);
  static const tertiaryDark = Color(0xFFEFBD94);
  static const onTertiaryDark = Color(0xFF48290C);
  static const tertiaryContainerDark = Color(0xFF623F20);
  static const onTertiaryContainerDark = Color(0xFFFFDCC2);
  static const errorDark = Color(0xFFFFB4AB);
  static const onErrorDark = Color(0xFF690005);
  static const errorContainerDark = Color(0xFF93000A);
  static const onErrorContainerDark = Color(0xFFFFDAD6);
  static const backgroundDark = Color(0xFF191113);
  static const onBackgroundDark = Color(0xFFEFDFE1);
  static const surfaceDark = Color(0xFF191113);
  static const onSurfaceDark = Color(0xFFEFDFE1);
  static const surfaceVariantDark = Color(0xFF514347);
  static const onSurfaceVariantDark = Color(0xFFD5C2C6);
  static const outlineDark = Color(0xFF9E8C90);
  static const outlineVariantDark = Color(0xFF514347);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFEFDFE1);
  static const inverseOnSurfaceDark = Color(0xFF372E30);
  static const inversePrimaryDark = Color(0xFF8C4A60);
  static const surfaceDimDark = Color(0xFF191113);
  static const surfaceBrightDark = Color(0xFF413739);
  static const surfaceContainerLowestDark = Color(0xFF140C0E);
  static const surfaceContainerLowDark = Color(0xFF22191C);
  static const surfaceContainerDark = Color(0xFF261D20);
  static const surfaceContainerHighDark = Color(0xFF31282A);
  static const surfaceContainerHighestDark = Color(0xFF3C3235);
  static const primaryDarkMediumContrast = Color(0xFFFFB7CC);
  static const onPrimaryDarkMediumContrast = Color(0xFF330218);
  static const primaryContainerDarkMediumContrast = Color(0xFFC67B93);
  static const onPrimaryContainerDarkMediumContrast = Color(0xFF000000);
  static const secondaryDarkMediumContrast = Color(0xFFE7C1CB);
  static const onSecondaryDarkMediumContrast = Color(0xFF251017);
  static const secondaryContainerDarkMediumContrast = Color(0xFFAA8891);
  static const onSecondaryContainerDarkMediumContrast = Color(0xFF000000);
  static const tertiaryDarkMediumContrast = Color(0xFFF3C198);
  static const onTertiaryDarkMediumContrast = Color(0xFF261100);
  static const tertiaryContainerDarkMediumContrast = Color(0xFFB48862);
  static const onTertiaryContainerDarkMediumContrast = Color(0xFF000000);
  static const errorDarkMediumContrast = Color(0xFFFFBAB1);
  static const onErrorDarkMediumContrast = Color(0xFF370001);
  static const errorContainerDarkMediumContrast = Color(0xFFFF5449);
  static const onErrorContainerDarkMediumContrast = Color(0xFF000000);
  static const backgroundDarkMediumContrast = Color(0xFF191113);
  static const onBackgroundDarkMediumContrast = Color(0xFFEFDFE1);
  static const surfaceDarkMediumContrast = Color(0xFF191113);
  static const onSurfaceDarkMediumContrast = Color(0xFFFFF9F9);
  static const surfaceVariantDarkMediumContrast = Color(0xFF514347);
  static const onSurfaceVariantDarkMediumContrast = Color(0xFFDAC6CA);
  static const outlineDarkMediumContrast = Color(0xFFB19EA2);
  static const outlineVariantDarkMediumContrast = Color(0xFF907F83);
  static const scrimDarkMediumContrast = Color(0xFF000000);
  static const inverseSurfaceDarkMediumContrast = Color(0xFFEFDFE1);
  static const inverseOnSurfaceDarkMediumContrast = Color(0xFF31282A);
  static const inversePrimaryDarkMediumContrast = Color(0xFF71344A);
  static const surfaceDimDarkMediumContrast = Color(0xFF191113);
  static const surfaceBrightDarkMediumContrast = Color(0xFF413739);
  static const surfaceContainerLowestDarkMediumContrast = Color(0xFF140C0E);
  static const surfaceContainerLowDarkMediumContrast = Color(0xFF22191C);
  static const surfaceContainerDarkMediumContrast = Color(0xFF261D20);
  static const surfaceContainerHighDarkMediumContrast = Color(0xFF31282A);
  static const surfaceContainerHighestDarkMediumContrast = Color(0xFF3C3235);
  static const primaryDarkHighContrast = Color(0xFFFFF9F9);
  static const onPrimaryDarkHighContrast = Color(0xFF000000);
  static const primaryContainerDarkHighContrast = Color(0xFFFFB7CC);
  static const onPrimaryContainerDarkHighContrast = Color(0xFF000000);
  static const secondaryDarkHighContrast = Color(0xFFFFF9F9);
  static const onSecondaryDarkHighContrast = Color(0xFF000000);
  static const secondaryContainerDarkHighContrast = Color(0xFFE7C1CB);
  static const onSecondaryContainerDarkHighContrast = Color(0xFF000000);
  static const tertiaryDarkHighContrast = Color(0xFFFFFAF8);
  static const onTertiaryDarkHighContrast = Color(0xFF000000);
  static const tertiaryContainerDarkHighContrast = Color(0xFFF3C198);
  static const onTertiaryContainerDarkHighContrast = Color(0xFF000000);
  static const errorDarkHighContrast = Color(0xFFFFF9F9);
  static const onErrorDarkHighContrast = Color(0xFF000000);
  static const errorContainerDarkHighContrast = Color(0xFFFFBAB1);
  static const onErrorContainerDarkHighContrast = Color(0xFF000000);
  static const backgroundDarkHighContrast = Color(0xFF191113);
  static const onBackgroundDarkHighContrast = Color(0xFFEFDFE1);
  static const surfaceDarkHighContrast = Color(0xFF191113);
  static const onSurfaceDarkHighContrast = Color(0xFFFFFFFF);
  static const surfaceVariantDarkHighContrast = Color(0xFF514347);
  static const onSurfaceVariantDarkHighContrast = Color(0xFFFFF9F9);
  static const outlineDarkHighContrast = Color(0xFFDAC6CA);
  static const outlineVariantDarkHighContrast = Color(0xFFDAC6CA);
  static const scrimDarkHighContrast = Color(0xFF000000);
  static const inverseSurfaceDarkHighContrast = Color(0xFFEFDFE1);
  static const inverseOnSurfaceDarkHighContrast = Color(0xFF000000);
  static const inversePrimaryDarkHighContrast = Color(0xFF4C162C);
  static const surfaceDimDarkHighContrast = Color(0xFF191113);
  static const surfaceBrightDarkHighContrast = Color(0xFF413739);
  static const surfaceContainerLowestDarkHighContrast = Color(0xFF140C0E);
  static const surfaceContainerLowDarkHighContrast = Color(0xFF22191C);
  static const surfaceContainerDarkHighContrast = Color(0xFF261D20);
  static const surfaceContainerHighDarkHighContrast = Color(0xFF31282A);
  static const surfaceContainerHighestDarkHighContrast = Color(0xFF3C3235);

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
