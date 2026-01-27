import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class AquaTheme extends AppTheme {
  @override
  String get id => 'aqua';

  @override
  String get name => 'Aqua';

  @override
  List<ThemeContrast> get supportedContrasts => ThemeContrast.values;

  // Light Scheme Colors
  static const primaryLight = Color(0xFF116682);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFBDE9FF);
  static const onPrimaryContainerLight = Color(0xFF001F2A);
  static const secondaryLight = Color(0xFF4D616C);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFD0E4F2);
  static const _secondaryContainerLight = Color(0xFFD0E6F2);
  static const onSecondaryContainerLight = Color(0xFF081E27);
  static const tertiaryLight = Color(0xFF5D5B7D);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFE3DFFF);
  static const onTertiaryContainerLight = Color(0xFF191836);
  static const errorLight = Color(0xFFBA1A1A);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFFFDAD6);
  static const onErrorContainerLight = Color(0xFF410002);
  static const backgroundLight = Color(0xFFF6FAFD);
  static const onBackgroundLight = Color(0xFF171C1F);
  static const surfaceLight = Color(0xFFF6FAFD);
  static const onSurfaceLight = Color(0xFF171C1F);
  static const surfaceVariantLight = Color(0xFFDCE4E9);
  static const onSurfaceVariantLight = Color(0xFF40484C);
  static const outlineLight = Color(0xFF70787D);
  static const outlineVariantLight = Color(0xFFC0C8CD);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF2C3134);
  static const inverseOnSurfaceLight = Color(0xFFEDF1F5);
  static const inversePrimaryLight = Color(0xFF8BD0EF);
  static const surfaceDimLight = Color(0xFFD6DBDE);
  static const surfaceBrightLight = Color(0xFFF6FAFD);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF0F4F8);
  static const surfaceContainerLight = Color(0xFFEAEEF2);
  static const surfaceContainerHighLight = Color(0xFFE4E9EC);
  static const surfaceContainerHighestLight = Color(0xFFDFE3E7);

  // Light Medium Contrast
  static const primaryLightMediumContrast = Color(0xFF00495F);
  static const onPrimaryLightMediumContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightMediumContrast = Color(0xFF337D99);
  static const onPrimaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryLightMediumContrast = Color(0xFF31464F);
  static const onSecondaryLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightMediumContrast = Color(0xFF637882);
  static const onSecondaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryLightMediumContrast = Color(0xFF413F60);
  static const onTertiaryLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightMediumContrast = Color(0xFF737195);
  static const onTertiaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const errorLightMediumContrast = Color(0xFF8C0009);
  static const onErrorLightMediumContrast = Color(0xFFFFFFFF);
  static const errorContainerLightMediumContrast = Color(0xFFDA342E);
  static const onErrorContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const backgroundLightMediumContrast = Color(0xFFF6FAFD);
  static const onBackgroundLightMediumContrast = Color(0xFF171C1F);
  static const surfaceLightMediumContrast = Color(0xFFF6FAFD);
  static const onSurfaceLightMediumContrast = Color(0xFF171C1F);
  static const surfaceVariantLightMediumContrast = Color(0xFFDCE4E9);
  static const onSurfaceVariantLightMediumContrast = Color(0xFF3C4448);
  static const outlineLightMediumContrast = Color(0xFF586065);
  static const outlineVariantLightMediumContrast = Color(0xFF747C80);
  static const scrimLightMediumContrast = Color(0xFF000000);
  static const inverseSurfaceLightMediumContrast = Color(0xFF2C3134);
  static const inverseOnSurfaceLightMediumContrast = Color(0xFFEDF1F5);
  static const inversePrimaryLightMediumContrast = Color(0xFF8BD0EF);
  static const surfaceDimLightMediumContrast = Color(0xFFD6DBDE);
  static const surfaceBrightLightMediumContrast = Color(0xFFF6FAFD);
  static const surfaceContainerLowestLightMediumContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightMediumContrast = Color(0xFFF0F4F8);
  static const surfaceContainerLightMediumContrast = Color(0xFFEAEEF2);
  static const surfaceContainerHighLightMediumContrast = Color(0xFFE4E9EC);
  static const surfaceContainerHighestLightMediumContrast = Color(0xFFDFE3E7);

  // Light High Contrast
  static const primaryLightHighContrast = Color(0xFF002633);
  static const onPrimaryLightHighContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightHighContrast = Color(0xFF00495F);
  static const onPrimaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryLightHighContrast = Color(0xFF10252E);
  static const onSecondaryLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightHighContrast = Color(0xFF31464F);
  static const onSecondaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryLightHighContrast = Color(0xFF201F3D);
  static const onTertiaryLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightHighContrast = Color(0xFF413F60);
  static const onTertiaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const errorLightHighContrast = Color(0xFF4E0002);
  static const onErrorLightHighContrast = Color(0xFFFFFFFF);
  static const errorContainerLightHighContrast = Color(0xFF8C0009);
  static const onErrorContainerLightHighContrast = Color(0xFFFFFFFF);
  static const backgroundLightHighContrast = Color(0xFFF6FAFD);
  static const onBackgroundLightHighContrast = Color(0xFF171C1F);
  static const surfaceLightHighContrast = Color(0xFFF6FAFD);
  static const onSurfaceLightHighContrast = Color(0xFF000000);
  static const surfaceVariantLightHighContrast = Color(0xFFDCE4E9);
  static const onSurfaceVariantLightHighContrast = Color(0xFF1D2529);
  static const outlineLightHighContrast = Color(0xFF3C4448);
  static const outlineVariantLightHighContrast = Color(0xFF3C4448);
  static const scrimLightHighContrast = Color(0xFF000000);
  static const inverseSurfaceLightHighContrast = Color(0xFF2C3134);
  static const inverseOnSurfaceLightHighContrast = Color(0xFFFFFFFF);
  static const inversePrimaryLightHighContrast = Color(0xFFD5F0FF);
  static const surfaceDimLightHighContrast = Color(0xFFD6DBDE);
  static const surfaceBrightLightHighContrast = Color(0xFFF6FAFD);
  static const surfaceContainerLowestLightHighContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightHighContrast = Color(0xFFF0F4F8);
  static const surfaceContainerLightHighContrast = Color(0xFFEAEEF2);
  static const surfaceContainerHighLightHighContrast = Color(0xFFE4E9EC);
  static const surfaceContainerHighestLightHighContrast = Color(0xFFDFE3E7);

  // Dark Colors
  static const primaryDark = Color(0xFF8BD0EF);
  static const onPrimaryDark = Color(0xFF003546);
  static const primaryContainerDark = Color(0xFF004D64);
  static const onPrimaryContainerDark = Color(0xFFBDE9FF);
  static const secondaryDark = Color(0xFFB4CAD6);
  static const onSecondaryDark = Color(0xFF1F333C);
  static const secondaryContainerDark = Color(0xFF354A53);
  static const onSecondaryContainerDark = Color(0xFFD0E6F2);
  static const tertiaryDark = Color(0xFFC6C2EA);
  static const onTertiaryDark = Color(0xFF2E2D4D);
  static const tertiaryContainerDark = Color(0xFF454364);
  static const onTertiaryContainerDark = Color(0xFFE3DFFF);
  static const errorDark = Color(0xFFFFB4AB);
  static const onErrorDark = Color(0xFF690005);
  static const errorContainerDark = Color(0xFF93000A);
  static const onErrorContainerDark = Color(0xFFFFDAD6);
  static const backgroundDark = Color(0xFF0F1417);
  static const onBackgroundDark = Color(0xFFDFE3E7);
  static const surfaceDark = Color(0xFF0F1417);
  static const onSurfaceDark = Color(0xFFDFE3E7);
  static const surfaceVariantDark = Color(0xFF40484C);
  static const onSurfaceVariantDark = Color(0xFFC0C8CD);
  static const outlineDark = Color(0xFF8A9297);
  static const outlineVariantDark = Color(0xFF40484C);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFDFE3E7);
  static const inverseOnSurfaceDark = Color(0xFF2C3134);
  static const inversePrimaryDark = Color(0xFF116682);
  static const surfaceDimDark = Color(0xFF0F1417);
  static const surfaceBrightDark = Color(0xFF353A3D);
  static const surfaceContainerLowestDark = Color(0xFF0A0F11);
  static const surfaceContainerLowDark = Color(0xFF171C1F);
  static const surfaceContainerDark = Color(0xFF1B2023);
  static const surfaceContainerHighDark = Color(0xFF262B2D);
  static const surfaceContainerHighestDark = Color(0xFF303538);

  // Dark Medium Contrast
  static const primaryDarkMediumContrast = Color(0xFF8FD4F4);
  static const onPrimaryDarkMediumContrast = Color(0xFF001923);
  static const primaryContainerDarkMediumContrast = Color(0xFF5399B7);
  static const onPrimaryContainerDarkMediumContrast = Color(0xFF000000);
  static const secondaryDarkMediumContrast = Color(0xFFB8CEDA);
  static const onSecondaryDarkMediumContrast = Color(0xFF031921);
  static const secondaryContainerDarkMediumContrast = Color(0xFF7F949F);
  static const onSecondaryContainerDarkMediumContrast = Color(0xFF000000);
  static const tertiaryDarkMediumContrast = Color(0xFFCAC7EF);
  static const onTertiaryDarkMediumContrast = Color(0xFF141231);
  static const tertiaryContainerDarkMediumContrast = Color(0xFF908DB2);
  static const onTertiaryContainerDarkMediumContrast = Color(0xFF000000);
  static const errorDarkMediumContrast = Color(0xFFFFBAB1);
  static const onErrorDarkMediumContrast = Color(0xFF370001);
  static const errorContainerDarkMediumContrast = Color(0xFFFF5449);
  static const onErrorContainerDarkMediumContrast = Color(0xFF000000);
  static const backgroundDarkMediumContrast = Color(0xFF0F1417);
  static const onBackgroundDarkMediumContrast = Color(0xFFDFE3E7);
  static const surfaceDarkMediumContrast = Color(0xFF0F1417);
  static const onSurfaceDarkMediumContrast = Color(0xFFF7FBFF);
  static const surfaceVariantDarkMediumContrast = Color(0xFF40484C);
  static const onSurfaceVariantDarkMediumContrast = Color(0xFFC4CCD1);
  static const outlineDarkMediumContrast = Color(0xFF9CA4A9);
  static const outlineVariantDarkMediumContrast = Color(0xFF7C8489);
  static const scrimDarkMediumContrast = Color(0xFF000000);
  static const inverseSurfaceDarkMediumContrast = Color(0xFFDFE3E7);
  static const inverseOnSurfaceDarkMediumContrast = Color(0xFF262B2E);
  static const inversePrimaryDarkMediumContrast = Color(0xFF004E66);
  static const surfaceDimDarkMediumContrast = Color(0xFF0F1417);
  static const surfaceBrightDarkMediumContrast = Color(0xFF353A3D);
  static const surfaceContainerLowestDarkMediumContrast = Color(0xFF0A0F11);
  static const surfaceContainerLowDarkMediumContrast = Color(0xFF171C1F);
  static const surfaceContainerDarkMediumContrast = Color(0xFF1B2023);
  static const surfaceContainerHighDarkMediumContrast = Color(0xFF262B2D);
  static const surfaceContainerHighestDarkMediumContrast = Color(0xFF303538);

  // Dark High Contrast
  static const primaryDarkHighContrast = Color(0xFFF7FBFF);
  static const onPrimaryDarkHighContrast = Color(0xFF000000);
  static const primaryContainerDarkHighContrast = Color(0xFF8FD4F4);
  static const onPrimaryContainerDarkHighContrast = Color(0xFF000000);
  static const secondaryDarkHighContrast = Color(0xFFF7FBFF);
  static const onSecondaryDarkHighContrast = Color(0xFF000000);
  static const secondaryContainerDarkHighContrast = Color(0xFFB8CEDA);
  static const onSecondaryContainerDarkHighContrast = Color(0xFF000000);
  static const tertiaryDarkHighContrast = Color(0xFFFEF9FF);
  static const onTertiaryDarkHighContrast = Color(0xFF000000);
  static const tertiaryContainerDarkHighContrast = Color(0xFFCAC7EF);
  static const onTertiaryContainerDarkHighContrast = Color(0xFF000000);
  static const errorDarkHighContrast = Color(0xFFFFF9F9);
  static const onErrorDarkHighContrast = Color(0xFF000000);
  static const errorContainerDarkHighContrast = Color(0xFFFFBAB1);
  static const onErrorContainerDarkHighContrast = Color(0xFF000000);
  static const backgroundDarkHighContrast = Color(0xFF0F1417);
  static const onBackgroundDarkHighContrast = Color(0xFFDFE3E7);
  static const surfaceDarkHighContrast = Color(0xFF0F1417);
  static const onSurfaceDarkHighContrast = Color(0xFFFFFFFF);
  static const surfaceVariantDarkHighContrast = Color(0xFF40484C);
  static const onSurfaceVariantDarkHighContrast = Color(0xFFF7FBFF);
  static const outlineDarkHighContrast = Color(0xFFC4CCD1);
  static const outlineVariantDarkHighContrast = Color(0xFFC4CCD1);
  static const scrimDarkHighContrast = Color(0xFF000000);
  static const inverseSurfaceDarkHighContrast = Color(0xFFDFE3E7);
  static const inverseOnSurfaceDarkHighContrast = Color(0xFF000000);
  static const inversePrimaryDarkHighContrast = Color(0xFF002E3D);
  static const surfaceDimDarkHighContrast = Color(0xFF0F1417);
  static const surfaceBrightDarkHighContrast = Color(0xFF353A3D);
  static const surfaceContainerLowestDarkHighContrast = Color(0xFF0A0F11);
  static const surfaceContainerLowDarkHighContrast = Color(0xFF171C1F);
  static const surfaceContainerDarkHighContrast = Color(0xFF1B2023);
  static const surfaceContainerHighDarkHighContrast = Color(0xFF262B2D);
  static const surfaceContainerHighestDarkHighContrast = Color(0xFF303538);

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
          secondaryContainer: _secondaryContainerLight,
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
