import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class GreenTheme extends AppTheme {
  @override
  String get id => 'green';

  @override
  String get name => 'Green';

  @override
  List<ThemeContrast> get supportedContrasts => ThemeContrast.values;

  // Colors
  static const primaryLight = Color(0xFF306A42);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFFB3F1BF);
  static const onPrimaryContainerLight = Color(0xFF00210D);
  static const secondaryLight = Color(0xFF506353);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFD2E8D3);
  static const onSecondaryContainerLight = Color(0xFF0D1F12);
  static const tertiaryLight = Color(0xFF3A656F);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFBEEAF6);
  static const onTertiaryContainerLight = Color(0xFF001F25);
  static const errorLight = Color(0xFFBA1A1A);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFFFDAD6);
  static const onErrorContainerLight = Color(0xFF410002);
  static const backgroundLight = Color(0xFFF6FBF3);
  static const onBackgroundLight = Color(0xFF181D18);
  static const surfaceLight = Color(0xFFF6FBF3);
  static const onSurfaceLight = Color(0xFF181D18);
  static const surfaceVariantLight = Color(0xFFDDE5DA);
  static const onSurfaceVariantLight = Color(0xFF414941);
  static const outlineLight = Color(0xFF717971);
  static const outlineVariantLight = Color(0xFFC1C9BF);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF2D322D);
  static const inverseOnSurfaceLight = Color(0xFFEEF2EA);
  static const inversePrimaryLight = Color(0xFF97D5A5);
  static const surfaceDimLight = Color(0xFFD7DBD4);
  static const surfaceBrightLight = Color(0xFFF6FBF3);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFF0F5ED);
  static const surfaceContainerLight = Color(0xFFEBEFE7);
  static const surfaceContainerHighLight = Color(0xFFE5EAE2);
  static const surfaceContainerHighestLight = Color(0xFFDFE4DC);
  static const primaryLightMediumContrast = Color(0xFF0F4D29);
  static const onPrimaryLightMediumContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightMediumContrast = Color(0xFF478157);
  static const onPrimaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryLightMediumContrast = Color(0xFF344738);
  static const onSecondaryLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightMediumContrast = Color(0xFF657A68);
  static const onSecondaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryLightMediumContrast = Color(0xFF1C4952);
  static const onTertiaryLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightMediumContrast = Color(0xFF517B85);
  static const onTertiaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const errorLightMediumContrast = Color(0xFF8C0009);
  static const onErrorLightMediumContrast = Color(0xFFFFFFFF);
  static const errorContainerLightMediumContrast = Color(0xFFDA342E);
  static const onErrorContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const backgroundLightMediumContrast = Color(0xFFF6FBF3);
  static const onBackgroundLightMediumContrast = Color(0xFF181D18);
  static const surfaceLightMediumContrast = Color(0xFFF6FBF3);
  static const onSurfaceLightMediumContrast = Color(0xFF181D18);
  static const surfaceVariantLightMediumContrast = Color(0xFFDDE5DA);
  static const onSurfaceVariantLightMediumContrast = Color(0xFF3D453D);
  static const outlineLightMediumContrast = Color(0xFF596159);
  static const outlineVariantLightMediumContrast = Color(0xFF757D74);
  static const scrimLightMediumContrast = Color(0xFF000000);
  static const inverseSurfaceLightMediumContrast = Color(0xFF2D322D);
  static const inverseOnSurfaceLightMediumContrast = Color(0xFFEEF2EA);
  static const inversePrimaryLightMediumContrast = Color(0xFF97D5A5);
  static const surfaceDimLightMediumContrast = Color(0xFFD7DBD4);
  static const surfaceBrightLightMediumContrast = Color(0xFFF6FBF3);
  static const surfaceContainerLowestLightMediumContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightMediumContrast = Color(0xFFF0F5ED);
  static const surfaceContainerLightMediumContrast = Color(0xFFEBEFE7);
  static const surfaceContainerHighLightMediumContrast = Color(0xFFE5EAE2);
  static const surfaceContainerHighestLightMediumContrast = Color(0xFFDFE4DC);
  static const primaryLightHighContrast = Color(0xFF002911);
  static const onPrimaryLightHighContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightHighContrast = Color(0xFF0F4D29);
  static const onPrimaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryLightHighContrast = Color(0xFF142619);
  static const onSecondaryLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightHighContrast = Color(0xFF344738);
  static const onSecondaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryLightHighContrast = Color(0xFF00262E);
  static const onTertiaryLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightHighContrast = Color(0xFF1C4952);
  static const onTertiaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const errorLightHighContrast = Color(0xFF4E0002);
  static const onErrorLightHighContrast = Color(0xFFFFFFFF);
  static const errorContainerLightHighContrast = Color(0xFF8C0009);
  static const onErrorContainerLightHighContrast = Color(0xFFFFFFFF);
  static const backgroundLightHighContrast = Color(0xFFF6FBF3);
  static const onBackgroundLightHighContrast = Color(0xFF181D18);
  static const surfaceLightHighContrast = Color(0xFFF6FBF3);
  static const onSurfaceLightHighContrast = Color(0xFF000000);
  static const surfaceVariantLightHighContrast = Color(0xFFDDE5DA);
  static const onSurfaceVariantLightHighContrast = Color(0xFF1E261F);
  static const outlineLightHighContrast = Color(0xFF3D453D);
  static const outlineVariantLightHighContrast = Color(0xFF3D453D);
  static const scrimLightHighContrast = Color(0xFF000000);
  static const inverseSurfaceLightHighContrast = Color(0xFF2D322D);
  static const inverseOnSurfaceLightHighContrast = Color(0xFFFFFFFF);
  static const inversePrimaryLightHighContrast = Color(0xFFBCFBC8);
  static const surfaceDimLightHighContrast = Color(0xFFD7DBD4);
  static const surfaceBrightLightHighContrast = Color(0xFFF6FBF3);
  static const surfaceContainerLowestLightHighContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightHighContrast = Color(0xFFF0F5ED);
  static const surfaceContainerLightHighContrast = Color(0xFFEBEFE7);
  static const surfaceContainerHighLightHighContrast = Color(0xFFE5EAE2);
  static const surfaceContainerHighestLightHighContrast = Color(0xFFDFE4DC);
  static const primaryDark = Color(0xFF97D5A5);
  static const onPrimaryDark = Color(0xFF00391A);
  static const primaryContainerDark = Color(0xFF15512D);
  static const onPrimaryContainerDark = Color(0xFFB3F1BF);
  static const secondaryDark = Color(0xFFB6CCB8);
  static const onSecondaryDark = Color(0xFF223526);
  static const secondaryContainerDark = Color(0xFF384B3C);
  static const onSecondaryContainerDark = Color(0xFFD2E8D3);
  static const tertiaryDark = Color(0xFFA2CED9);
  static const onTertiaryDark = Color(0xFF01363F);
  static const tertiaryContainerDark = Color(0xFF204D56);
  static const onTertiaryContainerDark = Color(0xFFBEEAF6);
  static const errorDark = Color(0xFFFFB4AB);
  static const onErrorDark = Color(0xFF690005);
  static const errorContainerDark = Color(0xFF93000A);
  static const onErrorContainerDark = Color(0xFFFFDAD6);
  static const backgroundDark = Color(0xFF101510);
  static const onBackgroundDark = Color(0xFFDFE4DC);
  static const surfaceDark = Color(0xFF101510);
  static const onSurfaceDark = Color(0xFFDFE4DC);
  static const surfaceVariantDark = Color(0xFF414941);
  static const onSurfaceVariantDark = Color(0xFFC1C9BF);
  static const outlineDark = Color(0xFF8B938A);
  static const outlineVariantDark = Color(0xFF414941);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFDFE4DC);
  static const inverseOnSurfaceDark = Color(0xFF2D322D);
  static const inversePrimaryDark = Color(0xFF306A42);
  static const surfaceDimDark = Color(0xFF101510);
  static const surfaceBrightDark = Color(0xFF353A35);
  static const surfaceContainerLowestDark = Color(0xFF0A0F0B);
  static const surfaceContainerLowDark = Color(0xFF181D18);
  static const surfaceContainerDark = Color(0xFF1C211C);
  static const surfaceContainerHighDark = Color(0xFF262B26);
  static const surfaceContainerHighestDark = Color(0xFF313631);
  static const primaryDarkMediumContrast = Color(0xFF9BD9A9);
  static const onPrimaryDarkMediumContrast = Color(0xFF001B09);
  static const primaryContainerDarkMediumContrast = Color(0xFF639E72);
  static const onPrimaryContainerDarkMediumContrast = Color(0xFF000000);
  static const secondaryDarkMediumContrast = Color(0xFFBBD0BC);
  static const onSecondaryDarkMediumContrast = Color(0xFF081A0D);
  static const secondaryContainerDarkMediumContrast = Color(0xFF819683);
  static const onSecondaryContainerDarkMediumContrast = Color(0xFF000000);
  static const tertiaryDarkMediumContrast = Color(0xFFA6D2DD);
  static const onTertiaryDarkMediumContrast = Color(0xFF00191F);
  static const tertiaryContainerDarkMediumContrast = Color(0xFF6D97A2);
  static const onTertiaryContainerDarkMediumContrast = Color(0xFF000000);
  static const errorDarkMediumContrast = Color(0xFFFFBAB1);
  static const onErrorDarkMediumContrast = Color(0xFF370001);
  static const errorContainerDarkMediumContrast = Color(0xFFFF5449);
  static const onErrorContainerDarkMediumContrast = Color(0xFF000000);
  static const backgroundDarkMediumContrast = Color(0xFF101510);
  static const onBackgroundDarkMediumContrast = Color(0xFFDFE4DC);
  static const surfaceDarkMediumContrast = Color(0xFF101510);
  static const onSurfaceDarkMediumContrast = Color(0xFFF8FCF4);
  static const surfaceVariantDarkMediumContrast = Color(0xFF414941);
  static const onSurfaceVariantDarkMediumContrast = Color(0xFFC5CDC3);
  static const outlineDarkMediumContrast = Color(0xFF9DA59C);
  static const outlineVariantDarkMediumContrast = Color(0xFF7D857D);
  static const scrimDarkMediumContrast = Color(0xFF000000);
  static const inverseSurfaceDarkMediumContrast = Color(0xFFDFE4DC);
  static const inverseOnSurfaceDarkMediumContrast = Color(0xFF262B26);
  static const inversePrimaryDarkMediumContrast = Color(0xFF16522E);
  static const surfaceDimDarkMediumContrast = Color(0xFF101510);
  static const surfaceBrightDarkMediumContrast = Color(0xFF353A35);
  static const surfaceContainerLowestDarkMediumContrast = Color(0xFF0A0F0B);
  static const surfaceContainerLowDarkMediumContrast = Color(0xFF181D18);
  static const surfaceContainerDarkMediumContrast = Color(0xFF1C211C);
  static const surfaceContainerHighDarkMediumContrast = Color(0xFF262B26);
  static const surfaceContainerHighestDarkMediumContrast = Color(0xFF313631);
  static const primaryDarkHighContrast = Color(0xFFEFFFEE);
  static const onPrimaryDarkHighContrast = Color(0xFF000000);
  static const primaryContainerDarkHighContrast = Color(0xFF9BD9A9);
  static const onPrimaryContainerDarkHighContrast = Color(0xFF000000);
  static const secondaryDarkHighContrast = Color(0xFFEFFFEE);
  static const onSecondaryDarkHighContrast = Color(0xFF000000);
  static const secondaryContainerDarkHighContrast = Color(0xFFBBD0BC);
  static const onSecondaryContainerDarkHighContrast = Color(0xFF000000);
  static const tertiaryDarkHighContrast = Color(0xFFF3FCFF);
  static const onTertiaryDarkHighContrast = Color(0xFF000000);
  static const tertiaryContainerDarkHighContrast = Color(0xFFA6D2DD);
  static const onTertiaryContainerDarkHighContrast = Color(0xFF000000);
  static const errorDarkHighContrast = Color(0xFFFFF9F9);
  static const onErrorDarkHighContrast = Color(0xFF000000);
  static const errorContainerDarkHighContrast = Color(0xFFFFBAB1);
  static const onErrorContainerDarkHighContrast = Color(0xFF000000);
  static const backgroundDarkHighContrast = Color(0xFF101510);
  static const onBackgroundDarkHighContrast = Color(0xFFDFE4DC);
  static const surfaceDarkHighContrast = Color(0xFF101510);
  static const onSurfaceDarkHighContrast = Color(0xFFFFFFFF);
  static const surfaceVariantDarkHighContrast = Color(0xFF414941);
  static const onSurfaceVariantDarkHighContrast = Color(0xFFF5FDF2);
  static const outlineDarkHighContrast = Color(0xFFC5CDC3);
  static const outlineVariantDarkHighContrast = Color(0xFFC5CDC3);
  static const scrimDarkHighContrast = Color(0xFF000000);
  static const inverseSurfaceDarkHighContrast = Color(0xFFDFE4DC);
  static const inverseOnSurfaceDarkHighContrast = Color(0xFF000000);
  static const inversePrimaryDarkHighContrast = Color(0xFF003216);
  static const surfaceDimDarkHighContrast = Color(0xFF101510);
  static const surfaceBrightDarkHighContrast = Color(0xFF353A35);
  static const surfaceContainerLowestDarkHighContrast = Color(0xFF0A0F0B);
  static const surfaceContainerLowDarkHighContrast = Color(0xFF181D18);
  static const surfaceContainerDarkHighContrast = Color(0xFF1C211C);
  static const surfaceContainerHighDarkHighContrast = Color(0xFF262B26);
  static const surfaceContainerHighestDarkHighContrast = Color(0xFF313631);

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
