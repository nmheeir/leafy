import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leafy/router/router.dart';

late Directory appDocumentsDirectory;
late Directory appTempDirectory;
late DateFormat dateFormat;
late GlobalKey<ScaffoldMessengerState> snackbarKey;
final appRouter = router();

class AppColors {
  // Light Mode
  static const Color lightPrimary = Color(0xFF18181B); // Zinc 900
  static const Color lightSecondary = Color(0xFF3F3F46); // Zinc 700
  static const Color lightBackground = Color(0xFFFAFAFA); // Zinc 50
  static const Color lightSurface = Color(0xFFFFFFFF); // White
  static const Color lightAccent = Color(0xFF2563EB); // Blue 600
  static const Color lightBorder = Color(0xFFE4E4E7); // Zinc 200

  // Dark Mode
  static const Color darkPrimary = Color(0xFFFAFAFA); // Zinc 50
  static const Color darkSecondary = Color(0xFFA1A1AA); // Zinc 400
  static const Color darkBackground = Color(0xFF000000); // Black
  static const Color darkSurface = Color(0xFF18181B); // Zinc 900
  static const Color darkAccent = Color(0xFF3B82F6); // Blue 500
  static const Color darkBorder = Color(0xFF27272A); // Zinc 800
}
