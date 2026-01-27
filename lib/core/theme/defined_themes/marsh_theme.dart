import 'package:flutter/material.dart';
import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

class MarshTheme extends AppTheme {
  @override
  String get id => 'marsh';

  @override
  String get name => 'Marsh';

  @override
  List<ThemeContrast> get supportedContrasts => ThemeContrast.values;

  // Light Scheme Colors
  static const primaryLight = Color(0xFF006A65);
  static const onPrimaryLight = Color(0xFFFFFFFF);
  static const primaryContainerLight = Color(0xFF9DF2EA);
  static const onPrimaryContainerLight = Color(0xFF00201E);
  static const secondaryLight = Color(0xFF4A6361);
  static const onSecondaryLight = Color(0xFFFFFFFF);
  static const secondaryContainerLight = Color(0xFFCCE8E5);
  static const onSecondaryContainerLight = Color(0xFF051F1E);
  static const tertiaryLight = Color(0xFF48607B);
  static const onTertiaryLight = Color(0xFFFFFFFF);
  static const tertiaryContainerLight = Color(0xFFD0E4FF);
  static const onTertiaryContainerLight = Color(0xFF001D34);
  static const errorLight = Color(0xFFBA1A1A);
  static const onErrorLight = Color(0xFFFFFFFF);
  static const errorContainerLight = Color(0xFFFFDAD6);
  static const onErrorContainerLight = Color(0xFF410002);
  static const backgroundLight = Color(0xFFF4FBF9);
  static const onBackgroundLight = Color(0xFF161D1C);
  static const surfaceLight = Color(0xFFF4FBF9);
  static const onSurfaceLight = Color(0xFF161D1C);
  static const surfaceVariantLight = Color(0xFFDAE5E3);
  static const onSurfaceVariantLight = Color(0xFF3F4947);
  static const outlineLight = Color(0xFF6F7978);
  static const outlineVariantLight = Color(0xFFBEC9C7);
  static const scrimLight = Color(0xFF000000);
  static const inverseSurfaceLight = Color(0xFF2B3231);
  static const inverseOnSurfaceLight = Color(0xFFECF2F0);
  static const inversePrimaryLight = Color(0xFF81D5CE);
  static const surfaceDimLight = Color(0xFFD5DBDA);
  static const surfaceBrightLight = Color(0xFFF4FBF9);
  static const surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const surfaceContainerLowLight = Color(0xFFEFF5F3);
  static const surfaceContainerLight = Color(0xFFE9EFED);
  static const surfaceContainerHighLight = Color(0xFFE3E9E8);
  static const surfaceContainerHighestLight = Color(0xFFDDE4E2);

  // Light Medium Contrast
  static const primaryLightMediumContrast = Color(0xFF004B48);
  static const onPrimaryLightMediumContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightMediumContrast = Color(0xFF25817C);
  static const onPrimaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryLightMediumContrast = Color(0xFF2E4745);
  static const onSecondaryLightMediumContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightMediumContrast = Color(0xFF607A77);
  static const onSecondaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryLightMediumContrast = Color(0xFF2C455E);
  static const onTertiaryLightMediumContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightMediumContrast = Color(0xFF5E7792);
  static const onTertiaryContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const errorLightMediumContrast = Color(0xFF8C0009);
  static const onErrorLightMediumContrast = Color(0xFFFFFFFF);
  static const errorContainerLightMediumContrast = Color(0xFFDA342E);
  static const onErrorContainerLightMediumContrast = Color(0xFFFFFFFF);
  static const backgroundLightMediumContrast = Color(0xFFF4FBF9);
  static const onBackgroundLightMediumContrast = Color(0xFF161D1C);
  static const surfaceLightMediumContrast = Color(0xFFF4FBF9);
  static const onSurfaceLightMediumContrast = Color(0xFF161D1C);
  static const surfaceVariantLightMediumContrast = Color(0xFFDAE5E3);
  static const onSurfaceVariantLightMediumContrast = Color(0xFF3B4544);
  static const outlineLightMediumContrast = Color(0xFF576160);
  static const outlineVariantLightMediumContrast = Color(0xFF737D7B);
  static const scrimLightMediumContrast = Color(0xFF000000);
  static const inverseSurfaceLightMediumContrast = Color(0xFF2B3231);
  static const inverseOnSurfaceLightMediumContrast = Color(0xFFECF2F0);
  static const inversePrimaryLightMediumContrast = Color(0xFF81D5CE);
  static const surfaceDimLightMediumContrast = Color(0xFFD5DBDA);
  static const surfaceBrightLightMediumContrast = Color(0xFFF4FBF9);
  static const surfaceContainerLowestLightMediumContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightMediumContrast = Color(0xFFEFF5F3);
  static const surfaceContainerLightMediumContrast = Color(0xFFE9EFED);
  static const surfaceContainerHighLightMediumContrast = Color(0xFFE3E9E8);
  static const surfaceContainerHighestLightMediumContrast = Color(0xFFDDE4E2);

  // Light High Contrast
  static const primaryLightHighContrast = Color(0xFF002725);
  static const onPrimaryLightHighContrast = Color(0xFFFFFFFF);
  static const primaryContainerLightHighContrast = Color(0xFF004B48);
  static const onPrimaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryLightHighContrast = Color(0xFF0C2624);
  static const onSecondaryLightHighContrast = Color(0xFFFFFFFF);
  static const secondaryContainerLightHighContrast = Color(0xFF2E4745);
  static const onSecondaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryLightHighContrast = Color(0xFF07243B);
  static const onTertiaryLightHighContrast = Color(0xFFFFFFFF);
  static const tertiaryContainerLightHighContrast = Color(0xFF2C455E);
  static const onTertiaryContainerLightHighContrast = Color(0xFFFFFFFF);
  static const errorLightHighContrast = Color(0xFF4E0002);
  static const onErrorLightHighContrast = Color(0xFFFFFFFF);
  static const errorContainerLightHighContrast = Color(0xFF8C0009);
  static const onErrorContainerLightHighContrast = Color(0xFFFFFFFF);
  static const backgroundLightHighContrast = Color(0xFFF4FBF9);
  static const onBackgroundLightHighContrast = Color(0xFF161D1C);
  static const surfaceLightHighContrast = Color(0xFFF4FBF9);
  static const onSurfaceLightHighContrast = Color(0xFF000000);
  static const surfaceVariantLightHighContrast = Color(0xFFDAE5E3);
  static const onSurfaceVariantLightHighContrast = Color(0xFF1C2625);
  static const outlineLightHighContrast = Color(0xFF3B4544);
  static const outlineVariantLightHighContrast = Color(0xFF3B4544);
  static const scrimLightHighContrast = Color(0xFF000000);
  static const inverseSurfaceLightHighContrast = Color(0xFF2B3231);
  static const inverseOnSurfaceLightHighContrast = Color(0xFFFFFFFF);
  static const inversePrimaryLightHighContrast = Color(0xFFA6FBF4);
  static const surfaceDimLightHighContrast = Color(0xFFD5DBDA);
  static const surfaceBrightLightHighContrast = Color(0xFFF4FBF9);
  static const surfaceContainerLowestLightHighContrast = Color(0xFFFFFFFF);
  static const surfaceContainerLowLightHighContrast = Color(0xFFEFF5F3);
  static const surfaceContainerLightHighContrast = Color(0xFFE9EFED);
  static const surfaceContainerHighLightHighContrast = Color(0xFFE3E9E8);
  static const surfaceContainerHighestLightHighContrast = Color(0xFFDDE4E2);

  // Dark Colors
  static const primaryDark = Color(0xFF81D5CE);
  static const onPrimaryDark = Color(0xFF003734);
  static const primaryContainerDark = Color(0xFF00504C);
  static const onPrimaryContainerDark = Color(0xFF9DF2EA);
  static const secondaryDark = Color(0xFFB0CCC9);
  static const onSecondaryDark = Color(0xFF1C3533);
  static const secondaryContainerDark = Color(0xFF324B49);
  static const onSecondaryContainerDark = Color(0xFFCCE8E5);
  static const tertiaryDark = Color(0xFFB0C9E7);
  static const onTertiaryDark = Color(0xFF19324A);
  static const tertiaryContainerDark = Color(0xFF304962);
  static const onTertiaryContainerDark = Color(0xFFD0E4FF);
  static const errorDark = Color(0xFFFFB4AB);
  static const onErrorDark = Color(0xFF690005);
  static const errorContainerDark = Color(0xFF93000A);
  static const onErrorContainerDark = Color(0xFFFFDAD6);
  static const backgroundDark = Color(0xFF0E1514);
  static const onBackgroundDark = Color(0xFFDDE4E2);
  static const surfaceDark = Color(0xFF0E1514);
  static const onSurfaceDark = Color(0xFFDDE4E2);
  static const surfaceVariantDark = Color(0xFF3F4947);
  static const onSurfaceVariantDark = Color(0xFFBEC9C7);
  static const outlineDark = Color(0xFF889391);
  static const outlineVariantDark = Color(0xFF3F4947);
  static const scrimDark = Color(0xFF000000);
  static const inverseSurfaceDark = Color(0xFFDDE4E2);
  static const inverseOnSurfaceDark = Color(0xFF2B3231);
  static const inversePrimaryDark = Color(0xFF006A65);
  static const surfaceDimDark = Color(0xFF0E1514);
  static const surfaceBrightDark = Color(0xFF343A3A);
  static const surfaceContainerLowestDark = Color(0xFF090F0F);
  static const surfaceContainerLowDark = Color(0xFF161D1C);
  static const surfaceContainerDark = Color(0xFF1A2120);
  static const surfaceContainerHighDark = Color(0xFF252B2A);
  static const surfaceContainerHighestDark = Color(0xFF2F3635);

  // Dark Medium Contrast
  static const primaryDarkMediumContrast = Color(0xFF85D9D3);
  static const onPrimaryDarkMediumContrast = Color(0xFF001A18);
  static const primaryContainerDarkMediumContrast = Color(0xFF489E98);
  static const onPrimaryContainerDarkMediumContrast = Color(0xFF000000);
  static const secondaryDarkMediumContrast = Color(0xFFB5D0CD);
  static const onSecondaryDarkMediumContrast = Color(0xFF011A18);
  static const secondaryContainerDarkMediumContrast = Color(0xFF7B9693);
  static const onSecondaryContainerDarkMediumContrast = Color(0xFF000000);
  static const tertiaryDarkMediumContrast = Color(0xFFB4CDEC);
  static const onTertiaryDarkMediumContrast = Color(0xFF00172C);
  static const tertiaryContainerDarkMediumContrast = Color(0xFF7A93AF);
  static const onTertiaryContainerDarkMediumContrast = Color(0xFF000000);
  static const errorDarkMediumContrast = Color(0xFFFFBAB1);
  static const onErrorDarkMediumContrast = Color(0xFF370001);
  static const errorContainerDarkMediumContrast = Color(0xFFFF5449);
  static const onErrorContainerDarkMediumContrast = Color(0xFF000000);
  static const backgroundDarkMediumContrast = Color(0xFF0E1514);
  static const onBackgroundDarkMediumContrast = Color(0xFFDDE4E2);
  static const surfaceDarkMediumContrast = Color(0xFF0E1514);
  static const onSurfaceDarkMediumContrast = Color(0xFFF6FCFA);
  static const surfaceVariantDarkMediumContrast = Color(0xFF3F4947);
  static const onSurfaceVariantDarkMediumContrast = Color(0xFFC2CDCB);
  static const outlineDarkMediumContrast = Color(0xFF9BA5A3);
  static const outlineVariantDarkMediumContrast = Color(0xFF7B8584);
  static const scrimDarkMediumContrast = Color(0xFF000000);
  static const inverseSurfaceDarkMediumContrast = Color(0xFFDDE4E2);
  static const inverseOnSurfaceDarkMediumContrast = Color(0xFF252B2A);
  static const inversePrimaryDarkMediumContrast = Color(0xFF00514D);
  static const surfaceDimDarkMediumContrast = Color(0xFF0E1514);
  static const surfaceBrightDarkMediumContrast = Color(0xFF343A3A);
  static const surfaceContainerLowestDarkMediumContrast = Color(0xFF090F0F);
  static const surfaceContainerLowDarkMediumContrast = Color(0xFF161D1C);
  static const surfaceContainerDarkMediumContrast = Color(0xFF1A2120);
  static const surfaceContainerHighDarkMediumContrast = Color(0xFF252B2A);
  static const surfaceContainerHighestDarkMediumContrast = Color(0xFF2F3635);

  // Dark High Contrast
  static const primaryDarkHighContrast = Color(0xFFEAFFFC);
  static const onPrimaryDarkHighContrast = Color(0xFF000000);
  static const primaryContainerDarkHighContrast = Color(0xFF85D9D3);
  static const onPrimaryContainerDarkHighContrast = Color(0xFF000000);
  static const secondaryDarkHighContrast = Color(0xFFEAFFFC);
  static const onSecondaryDarkHighContrast = Color(0xFF000000);
  static const secondaryContainerDarkHighContrast = Color(0xFFB5D0CD);
  static const onSecondaryContainerDarkHighContrast = Color(0xFF000000);
  static const tertiaryDarkHighContrast = Color(0xFFFAFAFF);
  static const onTertiaryDarkHighContrast = Color(0xFF000000);
  static const tertiaryContainerDarkHighContrast = Color(0xFFB4CDEC);
  static const onTertiaryContainerDarkHighContrast = Color(0xFF000000);
  static const errorDarkHighContrast = Color(0xFFFFF9F9);
  static const onErrorDarkHighContrast = Color(0xFF000000);
  static const errorContainerDarkHighContrast = Color(0xFFFFBAB1);
  static const onErrorContainerDarkHighContrast = Color(0xFF000000);
  static const backgroundDarkHighContrast = Color(0xFF0E1514);
  static const onBackgroundDarkHighContrast = Color(0xFFDDE4E2);
  static const surfaceDarkHighContrast = Color(0xFF0E1514);
  static const onSurfaceDarkHighContrast = Color(0xFFFFFFFF);
  static const surfaceVariantDarkHighContrast = Color(0xFF3F4947);
  static const onSurfaceVariantDarkHighContrast = Color(0xFFF3FDFB);
  static const outlineDarkHighContrast = Color(0xFFC2CDCB);
  static const outlineVariantDarkHighContrast = Color(0xFFC2CDCB);
  static const scrimDarkHighContrast = Color(0xFF000000);
  static const inverseSurfaceDarkHighContrast = Color(0xFFDDE4E2);
  static const inverseOnSurfaceDarkHighContrast = Color(0xFF000000);
  static const inversePrimaryDarkHighContrast = Color(0xFF00302D);
  static const surfaceDimDarkHighContrast = Color(0xFF0E1514);
  static const surfaceBrightDarkHighContrast = Color(0xFF343A3A);
  static const surfaceContainerLowestDarkHighContrast = Color(0xFF090F0F);
  static const surfaceContainerLowDarkHighContrast = Color(0xFF161D1C);
  static const surfaceContainerDarkHighContrast = Color(0xFF1A2120);
  static const surfaceContainerHighDarkHighContrast = Color(0xFF252B2A);
  static const surfaceContainerHighestDarkHighContrast = Color(0xFF2F3635);

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
