import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class ThemeGetters {
  static Color getSelectionColor(BuildContext context) =>
      context.colorScheme.primary.withValues(alpha: 0.4);
}
