import 'package:leafy/core/theme/app_theme.dart';
import 'package:leafy/core/theme/defined_themes/gray_theme.dart';
import 'package:leafy/core/theme/defined_themes/green2_theme.dart';
import 'package:leafy/core/theme/defined_themes/green_gray_theme.dart';
import 'package:leafy/core/theme/defined_themes/green_theme.dart';
import 'package:leafy/core/theme/defined_themes/lavender_theme.dart';
import 'package:leafy/core/theme/defined_themes/marsh_theme.dart';
import 'package:leafy/core/theme/defined_themes/aqua_theme.dart';
import 'package:leafy/core/theme/defined_themes/pink2_theme.dart';
import 'package:leafy/core/theme/defined_themes/pink_theme.dart';
import 'package:leafy/core/theme/defined_themes/purple_gray_theme.dart';
import 'package:leafy/core/theme/defined_themes/purple_theme.dart';
import 'package:leafy/core/theme/defined_themes/red_gray_theme.dart';
import 'package:leafy/core/theme/defined_themes/red_theme.dart';
import 'package:leafy/core/theme/defined_themes/yellow2_theme.dart';
import 'package:leafy/core/theme/defined_themes/yellow_theme.dart';

class AppThemes {
  static final List<AppTheme> _themes = [
    AquaTheme(),
    GrayTheme(),
    GreenTheme(),
    GreenGrayTheme(),
    Green2Theme(),
    LavenderTheme(),
    MarshTheme(),
    PinkTheme(),
    Pink2Theme(),
    PurpleTheme(),
    PurpleGrayTheme(),
    RedGrayTheme(),
    RedTheme(),
    YellowTheme(),
    Yellow2Theme(),
  ];

  static List<AppTheme> get allThemes => List.unmodifiable(_themes);

  static AppTheme? getThemeById(String? id) {
    if (id == null) return null;
    try {
      return _themes.firstWhere((theme) => theme.id == id);
    } catch (_) {
      return null;
    }
  }
}
