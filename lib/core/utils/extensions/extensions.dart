import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;
  ColorScheme get colorScheme => _theme.colorScheme;
  Size get deviceSize => MediaQuery.sizeOf(this);
  EdgeInsets get padding => MediaQuery.of(this).padding;
}

extension StringExtension on String {
  String take(int n) => length > n ? substring(0, n) : this;
  bool get isNotBlank => trim().isNotEmpty;
}
