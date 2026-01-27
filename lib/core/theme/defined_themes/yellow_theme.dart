import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class YellowTheme extends AppTheme {
  @override
  String get id => 'yellow';

  @override
  String get name => 'Yellow';

  @override
  List<ThemeContrast> get supportedContrasts => ThemeContrast.values;

  // Colors
  static const primaryLight = Color(0xFF845415);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFFFDDBB);
  static const onPrimaryContainerLight = Color(0xFF2B1700);
  static const secondaryLight = Color(0xFF725A41);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFFDDDBD);
  static const onSecondaryContainerLight = Color(0xFF281805);
  static const tertiaryLight = Color(0xFF56633B);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFD9E9B6);
  static const onTertiaryContainerLight = Color(0xFF141F01);
  static const errorLight = Color(0xFFBA1A1A);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFFFDAD6);
  static const onErrorContainerLight = Color(0xFF410002);
  static const backgroundLight = Color(0xFFFFF8F4);
  static const onBackgroundLight = Color(0xFF211A14);
  static const surfaceLight = Color(0xFFFFF8F4);
  static const onSurfaceLight = Color(0xFF211A14);
  static const surfaceVariantLight = Color(0xFFF1DFD0);
  static const onSurfaceVariantLight = Color(0xFF50453A);
  static const outlineLight = Color(0xFF827568);
  static const outlineVariantLight = Color(0xFFD4C4B5);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF372F27);
  static const inverseOnSurfaceLight = Color(0xFFFDEEE3);
  static const inversePrimaryLight = Color(0xFFFABA73);
  static const surfaceDimLight = Color(0xFFE5D8CC);
  static const surfaceBrightLight = Color(0xFFFFF8F4);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFFFF1E6);
  static const surfaceContainerLight = Color(0xFFFAEBE0);
  static const surfaceContainerHighLight = Color(0xFFF4E6DA);
  static const surfaceContainerHighestLight = Color(0xFFEEE0D5);
  static const primaryLightMediumContrast = Color(0xFF623A00);
  static const onPrimaryLightMediumContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightMediumContrast = Color(0xFF9D6A2A);
  static const onPrimaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryLightMediumContrast = Color(0xFF543F28);
  static const onSecondaryLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightMediumContrast = Color(0xFF897056);
  static const onSecondaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryLightMediumContrast = Color(0xFF3B4722);
  static const onTertiaryLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightMediumContrast = Color(0xFF6C7A50);
  static const onTertiaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const errorLightMediumContrast = Color(0xFF8C0009);
  static const onErrorLightMediumContrast = Color(0xFFFFFFFF);
  static const errorContainerLightMediumContrast = Color(0xFFDA342E);
  static const onErrorContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const backgroundLightMediumContrast = Color(0xFFFFF8F4);
  static const onBackgroundLightMediumContrast = Color(0xFF211A14);
  static const surfaceLightMediumContrast = Color(0xFFFFF8F4);
  static const onSurfaceLightMediumContrast = Color(0xFF211A14);
  static const surfaceVariantLightMediumContrast = Color(0xFFF1DFD0);
  static const onSurfaceVariantLightMediumContrast = Color(0xFF4C4136);
  static const outlineLightMediumContrast = Color(0xFF695D51);
  static const outlineVariantLightMediumContrast = Color(0xFF86786C);
  static const scrimLightMediumContrast = Color(0xFF000000);
  static const inverseSurfaceLightMediumContrast = Color(0xFF372F27);
  static const inverseOnSurfaceLightMediumContrast = Color(0xFFFDEEE3);
  static const inversePrimaryLightMediumContrast = Color(0xFFFABA73);
  static const surfaceDimLightMediumContrast = Color(0xFFE5D8CC);
  static const surfaceBrightLightMediumContrast = Color(0xFFFFF8F4);
  static const surfaceContainerLowestLightMediumContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightMediumContrast = Color(0xFFFFF1E6);
  static const surfaceContainerLightMediumContrast = Color(0xFFFAEBE0);
  static const surfaceContainerHighLightMediumContrast = Color(0xFFF4E6DA);
  static const surfaceContainerHighestLightMediumContrast = Color(0xFFEEE0D5);
  static const primaryLightHighContrast = Color(0xFF351D00);
  static const onPrimaryLightHighContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightHighContrast = Color(0xFF623A00);
  static const onPrimaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryLightHighContrast = Color(0xFF301F0A);
  static const onSecondaryLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightHighContrast = Color(0xFF543F28);
  static const onSecondaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryLightHighContrast = Color(0xFF1B2605);
  static const onTertiaryLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightHighContrast = Color(0xFF3B4722);
  static const onTertiaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const errorLightHighContrast = Color(0xFF4E0002);
  static const onErrorLightHighContrast = Color(0xFFFFFFFF);
  static const errorContainerLightHighContrast = Color(0xFF8C0009);
  static const onErrorContainerLightHighContrast = Color(0xFFFFFFFF);
  static const backgroundLightHighContrast = Color(0xFFFFF8F4);
  static const onBackgroundLightHighContrast = Color(0xFF211A14);
  static const surfaceLightHighContrast = Color(0xFFFFF8F4);
  static const onSurfaceLightHighContrast = Color(0xFF000000);
  static const surfaceVariantLightHighContrast = Color(0xFFF1DFD0);
  static const onSurfaceVariantLightHighContrast = Color(0xFF2C2219);
  static const outlineLightHighContrast = Color(0xFF4C4136);
  static const outlineVariantLightHighContrast = Color(0xFF4C4136);
  static const scrimLightHighContrast = Color(0xFF000000);
  static const inverseSurfaceLightHighContrast = Color(0xFF372F27);
  static const inverseOnSurfaceLightHighContrast = Color(0xFFFFFFFF);
  static const inversePrimaryLightHighContrast = Color(0xFFFFE8D4);
  static const surfaceDimLightHighContrast = Color(0xFFE5D8CC);
  static const surfaceBrightLightHighContrast = Color(0xFFFFF8F4);
  static const surfaceContainerLowestLightHighContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightHighContrast = Color(0xFFFFF1E6);
  static const surfaceContainerLightHighContrast = Color(0xFFFAEBE0);
  static const surfaceContainerHighLightHighContrast = Color(0xFFF4E6DA);
  static const surfaceContainerHighestLightHighContrast = Color(0xFFEEE0D5);
  static const primaryDark = Color(0xFFFABA73);
  static const onPrimaryDark = Color(0xFF482900);
  static const primaryContainerDark = Color(0xFF673D00);
  static const onPrimaryContainerDark = Color(0xFFFFDDBB);
  static const secondaryDark = Color(0xFFE0C1A3);
  static const onSecondaryDark = Color(0xFF402D17);
  static const secondaryContainerDark = Color(0xFF58432C);
  static const onSecondaryContainerDark = Color(0xFFFDDDBD);
  static const tertiaryDark = Color(0xFFBDCC9C);
  static const onTertiaryDark = Color(0xFF293412);
  static const tertiaryContainerDark = Color(0xFF3F4B26);
  static const onTertiaryContainerDark = Color(0xFFD9E9B6);
  static const errorDark = Color(0xFFFFB4AB);
  static const onErrorDark = Color(0xFF690005);
  static const errorContainerDark = Color(0xFF93000A);
  static const onErrorContainerDark = Color(0xFFFFDAD6);
  static const backgroundDark = Color(0xFF18120C);
  static const onBackgroundDark = Color(0xFFEEE0D5);
  static const surfaceDark = Color(0xFF18120C);
  static const onSurfaceDark = Color(0xFFEEE0D5);
  static const surfaceVariantDark = Color(0xFF50453A);
  static const onSurfaceVariantDark = Color(0xFFD4C4B5);
  static const outlineDark = Color(0xFF9D8E81);
  static const outlineVariantDark = Color(0xFF50453A);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFEEE0D5);
  static const inverseOnSurfaceDark = Color(0xFF372F27);
  static const inversePrimaryDark = Color(0xFF845415);
  static const surfaceDimDark = Color(0xFF18120C);
  static const surfaceBrightDark = Color(0xFF403830);
  static const surfaceContainerLowestDark = Color(0xFF130D07);
  static const surfaceContainerLowDark = Color(0xFF211A14);
  static const surfaceContainerDark = Color(0xFF251E17);
  static const surfaceContainerHighDark = Color(0xFF302921);
  static const surfaceContainerHighestDark = Color(0xFF3B332C);
  static const primaryDarkMediumContrast = Color(0xFFFFBE76);
  static const onPrimaryDarkMediumContrast = Color(0xFF241200);
  static const primaryContainerDarkMediumContrast = Color(0xFFBE8543);
  static const onPrimaryContainerDarkMediumContrast = Color(0xFF000000);
  static const secondaryDarkMediumContrast = Color(0xFFE4C5A7);
  static const onSecondaryDarkMediumContrast = Color(0xFF221302);
  static const secondaryContainerDarkMediumContrast = Color(0xFFA78C70);
  static const onSecondaryContainerDarkMediumContrast = Color(0xFF000000);
  static const tertiaryDarkMediumContrast = Color(0xFFC2D1A0);
  static const onTertiaryDarkMediumContrast = Color(0xFF0F1900);
  static const tertiaryContainerDarkMediumContrast = Color(0xFF88966A);
  static const onTertiaryContainerDarkMediumContrast = Color(0xFF000000);
  static const errorDarkMediumContrast = Color(0xFFFFBAB1);
  static const onErrorDarkMediumContrast = Color(0xFF370001);
  static const errorContainerDarkMediumContrast = Color(0xFFFF5449);
  static const onErrorContainerDarkMediumContrast = Color(0xFF000000);
  static const backgroundDarkMediumContrast = Color(0xFF18120C);
  static const onBackgroundDarkMediumContrast = Color(0xFFEEE0D5);
  static const surfaceDarkMediumContrast = Color(0xFF18120C);
  static const onSurfaceDarkMediumContrast = Color(0xFFFFFAF8);
  static const surfaceVariantDarkMediumContrast = Color(0xFF50453A);
  static const onSurfaceVariantDarkMediumContrast = Color(0xFFD9C8B9);
  static const outlineDarkMediumContrast = Color(0xFFB0A092);
  static const outlineVariantDarkMediumContrast = Color(0xFF8F8174);
  static const scrimDarkMediumContrast = Color(0xFF000000);
  static const inverseSurfaceDarkMediumContrast = Color(0xFFEEE0D5);
  static const inverseOnSurfaceDarkMediumContrast = Color(0xFF302921);
  static const inversePrimaryDarkMediumContrast = Color(0xFF693E00);
  static const surfaceDimDarkMediumContrast = Color(0xFF18120C);
  static const surfaceBrightDarkMediumContrast = Color(0xFF403830);
  static const surfaceContainerLowestDarkMediumContrast = Color(0xFF130D07);
  static const surfaceContainerLowDarkMediumContrast = Color(0xFF211A14);
  static const surfaceContainerDarkMediumContrast = Color(0xFF251E17);
  static const surfaceContainerHighDarkMediumContrast = Color(0xFF302921);
  static const surfaceContainerHighestDarkMediumContrast = Color(0xFF3B332C);
  static const primaryDarkHighContrast = Color(0xFFFFFAF8);
  static const onPrimaryDarkHighContrast = Color(0xFF000000);
  static const primaryContainerDarkHighContrast = Color(0xFFFFBE76);
  static const onPrimaryContainerDarkHighContrast = Color(0xFF000000);
  static const secondaryDarkHighContrast = Color(0xFFFFFAF8);
  static const onSecondaryDarkHighContrast = Color(0xFF000000);
  static const secondaryContainerDarkHighContrast = Color(0xFFE4C5A7);
  static const onSecondaryContainerDarkHighContrast = Color(0xFF000000);
  static const tertiaryDarkHighContrast = Color(0xFFF5FFDB);
  static const onTertiaryDarkHighContrast = Color(0xFF000000);
  static const tertiaryContainerDarkHighContrast = Color(0xFFC2D1A0);
  static const onTertiaryContainerDarkHighContrast = Color(0xFF000000);
  static const errorDarkHighContrast = Color(0xFFFFF9F9);
  static const onErrorDarkHighContrast = Color(0xFF000000);
  static const errorContainerDarkHighContrast = Color(0xFFFFBAB1);
  static const onErrorContainerDarkHighContrast = Color(0xFF000000);
  static const backgroundDarkHighContrast = Color(0xFF18120C);
  static const onBackgroundDarkHighContrast = Color(0xFFEEE0D5);
  static const surfaceDarkHighContrast = Color(0xFF18120C);
  static const onSurfaceDarkHighContrast = Color(0xFFFFFFFF);
  static const surfaceVariantDarkHighContrast = Color(0xFF50453A);
  static const onSurfaceVariantDarkHighContrast = Color(0xFFFFFAF8);
  static const outlineDarkHighContrast = Color(0xFFD9C8B9);
  static const outlineVariantDarkHighContrast = Color(0xFFD9C8B9);
  static const scrimDarkHighContrast = Color(0xFF000000);
  static const inverseSurfaceDarkHighContrast = Color(0xFFEEE0D5);
  static const inverseOnSurfaceDarkHighContrast = Color(0xFF000000);
  static const inversePrimaryDarkHighContrast = Color(0xFF3F2400);
  static const surfaceDimDarkHighContrast = Color(0xFF18120C);
  static const surfaceBrightDarkHighContrast = Color(0xFF403830);
  static const surfaceContainerLowestDarkHighContrast = Color(0xFF130D07);
  static const surfaceContainerLowDarkHighContrast = Color(0xFF211A14);
  static const surfaceContainerDarkHighContrast = Color(0xFF251E17);
  static const surfaceContainerHighDarkHighContrast = Color(0xFF302921);
  static const surfaceContainerHighestDarkHighContrast = Color(0xFF3B332C);

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
