import 'package:flutter/material.dart';
import 'package:leafy/core/theme/theme_contrast.dart';

abstract class AppTheme {
  String get id;
  String get name;
  List<ThemeContrast> get supportedContrasts => [ThemeContrast.standard];

  ColorScheme lightColorScheme(ThemeContrast contrast);
  ColorScheme darkColorScheme(ThemeContrast contrast);
}
