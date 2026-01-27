import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class LavenderTheme extends AppTheme {
  @override
  String get id => 'lavender';

  @override
  String get name => 'Lavender';

  @override
  List<ThemeContrast> get supportedContrasts => ThemeContrast.values;

  // Colors
  static const primaryLight = Color(0xFF824C76);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFFFD7F1);
  static const onPrimaryContainerLight = Color(0xFF35082F);
  static const secondaryLight = Color(0xFF6F5867);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFF9DAED);
  static const onSecondaryContainerLight = Color(0xFF271623);
  static const tertiaryLight = Color(0xFF815342);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFFFDBCF);
  static const onTertiaryContainerLight = Color(0xFF321206);
  static const errorLight = Color(0xFFBA1A1A);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFFFDAD6);
  static const onErrorContainerLight = Color(0xFF410002);
  static const backgroundLight = Color(0xFFFFF7F9);
  static const onBackgroundLight = Color(0xFF201A1E);
  static const surfaceLight = Color(0xFFFFF7F9);
  static const onSurfaceLight = Color(0xFF201A1E);
  static const surfaceVariantLight = Color(0xFFEFDEE6);
  static const onSurfaceVariantLight = Color(0xFF4E444A);
  static const outlineLight = Color(0xFF80747B);
  static const outlineVariantLight = Color(0xFFD2C2CA);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF362E33);
  static const inverseOnSurfaceLight = Color(0xFFFBEDF3);
  static const inversePrimaryLight = Color(0xFFF4B2E2);
  static const surfaceDimLight = Color(0xFFE3D7DC);
  static const surfaceBrightLight = Color(0xFFFFF7F9);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFFEF0F6);
  static const surfaceContainerLight = Color(0xFFF8EAF0);
  static const surfaceContainerHighLight = Color(0xFFF2E5EB);
  static const surfaceContainerHighestLight = Color(0xFFECDFE5);
  static const primaryLightMediumContrast = Color(0xFF633159);
  static const onPrimaryLightMediumContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightMediumContrast = Color(0xFF9B628D);
  static const onPrimaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryLightMediumContrast = Color(0xFF523C4B);
  static const onSecondaryLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightMediumContrast = Color(0xFF866D7E);
  static const onSecondaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryLightMediumContrast = Color(0xFF613829);
  static const onTertiaryLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightMediumContrast = Color(0xFF9A6957);
  static const onTertiaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const errorLightMediumContrast = Color(0xFF8C0009);
  static const onErrorLightMediumContrast = Color(0xFFFFFFFF);
  static const errorContainerLightMediumContrast = Color(0xFFDA342E);
  static const onErrorContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const backgroundLightMediumContrast = Color(0xFFFFF7F9);
  static const onBackgroundLightMediumContrast = Color(0xFF201A1E);
  static const surfaceLightMediumContrast = Color(0xFFFFF7F9);
  static const onSurfaceLightMediumContrast = Color(0xFF201A1E);
  static const surfaceVariantLightMediumContrast = Color(0xFFEFDEE6);
  static const onSurfaceVariantLightMediumContrast = Color(0xFF4A4046);
  static const outlineLightMediumContrast = Color(0xFF685C63);
  static const outlineVariantLightMediumContrast = Color(0xFF84777F);
  static const scrimLightMediumContrast = Color(0xFF000000);
  static const inverseSurfaceLightMediumContrast = Color(0xFF362E33);
  static const inverseOnSurfaceLightMediumContrast = Color(0xFFFBEDF3);
  static const inversePrimaryLightMediumContrast = Color(0xFFF4B2E2);
  static const surfaceDimLightMediumContrast = Color(0xFFE3D7DC);
  static const surfaceBrightLightMediumContrast = Color(0xFFFFF7F9);
  static const surfaceContainerLowestLightMediumContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightMediumContrast = Color(0xFFFEF0F6);
  static const surfaceContainerLightMediumContrast = Color(0xFFF8EAF0);
  static const surfaceContainerHighLightMediumContrast = Color(0xFFF2E5EB);
  static const surfaceContainerHighestLightMediumContrast = Color(0xFFECDFE5);
  static const primaryLightHighContrast = Color(0xFF3D0F36);
  static const onPrimaryLightHighContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightHighContrast = Color(0xFF633159);
  static const onPrimaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryLightHighContrast = Color(0xFF2F1C2A);
  static const onSecondaryLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightHighContrast = Color(0xFF523C4B);
  static const onSecondaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryLightHighContrast = Color(0xFF3A190B);
  static const onTertiaryLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightHighContrast = Color(0xFF613829);
  static const onTertiaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const errorLightHighContrast = Color(0xFF4E0002);
  static const onErrorLightHighContrast = Color(0xFFFFFFFF);
  static const errorContainerLightHighContrast = Color(0xFF8C0009);
  static const onErrorContainerLightHighContrast = Color(0xFFFFFFFF);
  static const backgroundLightHighContrast = Color(0xFFFFF7F9);
  static const onBackgroundLightHighContrast = Color(0xFF201A1E);
  static const surfaceLightHighContrast = Color(0xFFFFF7F9);
  static const onSurfaceLightHighContrast = Color(0xFF000000);
  static const surfaceVariantLightHighContrast = Color(0xFFEFDEE6);
  static const onSurfaceVariantLightHighContrast = Color(0xFF2A2127);
  static const outlineLightHighContrast = Color(0xFF4A4046);
  static const outlineVariantLightHighContrast = Color(0xFF4A4046);
  static const scrimLightHighContrast = Color(0xFF000000);
  static const inverseSurfaceLightHighContrast = Color(0xFF362E33);
  static const inverseOnSurfaceLightHighContrast = Color(0xFFFFFFFF);
  static const inversePrimaryLightHighContrast = Color(0xFFFFE5F4);
  static const surfaceDimLightHighContrast = Color(0xFFE3D7DC);
  static const surfaceBrightLightHighContrast = Color(0xFFFFF7F9);
  static const surfaceContainerLowestLightHighContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightHighContrast = Color(0xFFFEF0F6);
  static const surfaceContainerLightHighContrast = Color(0xFFF8EAF0);
  static const surfaceContainerHighLightHighContrast = Color(0xFFF2E5EB);
  static const surfaceContainerHighestLightHighContrast = Color(0xFFECDFE5);
  static const primaryDark = Color(0xFFF4B2E2);
  static const onPrimaryDark = Color(0xFF4E1E46);
  static const primaryContainerDark = Color(0xFF67355D);
  static const onPrimaryContainerDark = Color(0xFFFFD7F1);
  static const secondaryDark = Color(0xFFDCBED1);
  static const onSecondaryDark = Color(0xFF3E2A39);
  static const secondaryContainerDark = Color(0xFF56404F);
  static const onSecondaryContainerDark = Color(0xFFF9DAED);
  static const tertiaryDark = Color(0xFFF5B9A4);
  static const onTertiaryDark = Color(0xFF4C2618);
  static const tertiaryContainerDark = Color(0xFF663C2C);
  static const onTertiaryContainerDark = Color(0xFFFFDBCF);
  static const errorDark = Color(0xFFFFB4AB);
  static const onErrorDark = Color(0xFF690005);
  static const errorContainerDark = Color(0xFF93000A);
  static const onErrorContainerDark = Color(0xFFFFDAD6);
  static const backgroundDark = Color(0xFF181216);
  static const onBackgroundDark = Color(0xFFECDFE5);
  static const surfaceDark = Color(0xFF181216);
  static const onSurfaceDark = Color(0xFFECDFE5);
  static const surfaceVariantDark = Color(0xFF4E444A);
  static const onSurfaceVariantDark = Color(0xFFD2C2CA);
  static const outlineDark = Color(0xFF9B8D95);
  static const outlineVariantDark = Color(0xFF4E444A);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFECDFE5);
  static const inverseOnSurfaceDark = Color(0xFF362E33);
  static const inversePrimaryDark = Color(0xFF824C76);
  static const surfaceDimDark = Color(0xFF181216);
  static const surfaceBrightDark = Color(0xFF3F373C);
  static const surfaceContainerLowestDark = Color(0xFF120C10);
  static const surfaceContainerLowDark = Color(0xFF201A1E);
  static const surfaceContainerDark = Color(0xFF241E22);
  static const surfaceContainerHighDark = Color(0xFF2F282C);
  static const surfaceContainerHighestDark = Color(0xFF3A3337);
  static const primaryDarkMediumContrast = Color(0xFFF9B6E7);
  static const onPrimaryDarkMediumContrast = Color(0xFF2E032A);
  static const primaryContainerDarkMediumContrast = Color(0xFFBA7EAB);
  static const onPrimaryContainerDarkMediumContrast = Color(0xFF000000);
  static const secondaryDarkMediumContrast = Color(0xFFE0C2D5);
  static const onSecondaryDarkMediumContrast = Color(0xFF22111E);
  static const secondaryContainerDarkMediumContrast = Color(0xFFA3899A);
  static const onSecondaryContainerDarkMediumContrast = Color(0xFF000000);
  static const tertiaryDarkMediumContrast = Color(0xFFFABDA8);
  static const onTertiaryDarkMediumContrast = Color(0xFF2B0D03);
  static const tertiaryContainerDarkMediumContrast = Color(0xFFBA8471);
  static const onTertiaryContainerDarkMediumContrast = Color(0xFF000000);
  static const errorDarkMediumContrast = Color(0xFFFFBAB1);
  static const onErrorDarkMediumContrast = Color(0xFF370001);
  static const errorContainerDarkMediumContrast = Color(0xFFFF5449);
  static const onErrorContainerDarkMediumContrast = Color(0xFF000000);
  static const backgroundDarkMediumContrast = Color(0xFF181216);
  static const onBackgroundDarkMediumContrast = Color(0xFFECDFE5);
  static const surfaceDarkMediumContrast = Color(0xFF181216);
  static const onSurfaceDarkMediumContrast = Color(0xFFFFF9FA);
  static const surfaceVariantDarkMediumContrast = Color(0xFF4E444A);
  static const onSurfaceVariantDarkMediumContrast = Color(0xFFD6C7CF);
  static const outlineDarkMediumContrast = Color(0xFFAD9FA7);
  static const outlineVariantDarkMediumContrast = Color(0xFF8D7F87);
  static const scrimDarkMediumContrast = Color(0xFF000000);
  static const inverseSurfaceDarkMediumContrast = Color(0xFFECDFE5);
  static const inverseOnSurfaceDarkMediumContrast = Color(0xFF2F282C);
  static const inversePrimaryDarkMediumContrast = Color(0xFF69365F);
  static const surfaceDimDarkMediumContrast = Color(0xFF181216);
  static const surfaceBrightDarkMediumContrast = Color(0xFF3F373C);
  static const surfaceContainerLowestDarkMediumContrast = Color(0xFF120C10);
  static const surfaceContainerLowDarkMediumContrast = Color(0xFF201A1E);
  static const surfaceContainerDarkMediumContrast = Color(0xFF241E22);
  static const surfaceContainerHighDarkMediumContrast = Color(0xFF2F282C);
  static const surfaceContainerHighestDarkMediumContrast = Color(0xFF3A3337);
  static const primaryDarkHighContrast = Color(0xFFFFF9FA);
  static const onPrimaryDarkHighContrast = Color(0xFF000000);
  static const primaryContainerDarkHighContrast = Color(0xFFF9B6E7);
  static const onPrimaryContainerDarkHighContrast = Color(0xFF000000);
  static const secondaryDarkHighContrast = Color(0xFFFFF9FA);
  static const onSecondaryDarkHighContrast = Color(0xFF000000);
  static const secondaryContainerDarkHighContrast = Color(0xFFE0C2D5);
  static const onSecondaryContainerDarkHighContrast = Color(0xFF000000);
  static const tertiaryDarkHighContrast = Color(0xFFFFF9F8);
  static const onTertiaryDarkHighContrast = Color(0xFF000000);
  static const tertiaryContainerDarkHighContrast = Color(0xFFFABDA8);
  static const onTertiaryContainerDarkHighContrast = Color(0xFF000000);
  static const errorDarkHighContrast = Color(0xFFFFF9F9);
  static const onErrorDarkHighContrast = Color(0xFF000000);
  static const errorContainerDarkHighContrast = Color(0xFFFFBAB1);
  static const onErrorContainerDarkHighContrast = Color(0xFF000000);
  static const backgroundDarkHighContrast = Color(0xFF181216);
  static const onBackgroundDarkHighContrast = Color(0xFFECDFE5);
  static const surfaceDarkHighContrast = Color(0xFF181216);
  static const onSurfaceDarkHighContrast = Color(0xFFFFFFFF);
  static const surfaceVariantDarkHighContrast = Color(0xFF4E444A);
  static const onSurfaceVariantDarkHighContrast = Color(0xFFFFF9FA);
  static const outlineDarkHighContrast = Color(0xFFD6C7CF);
  static const outlineVariantDarkHighContrast = Color(0xFFD6C7CF);
  static const scrimDarkHighContrast = Color(0xFF000000);
  static const inverseSurfaceDarkHighContrast = Color(0xFFECDFE5);
  static const inverseOnSurfaceDarkHighContrast = Color(0xFF000000);
  static const inversePrimaryDarkHighContrast = Color(0xFF46183F);
  static const surfaceDimDarkHighContrast = Color(0xFF181216);
  static const surfaceBrightDarkHighContrast = Color(0xFF3F373C);
  static const surfaceContainerLowestDarkHighContrast = Color(0xFF120C10);
  static const surfaceContainerLowDarkHighContrast = Color(0xFF201A1E);
  static const surfaceContainerDarkHighContrast = Color(0xFF241E22);
  static const surfaceContainerHighDarkHighContrast = Color(0xFF2F282C);
  static const surfaceContainerHighestDarkHighContrast = Color(0xFF3A3337);

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
