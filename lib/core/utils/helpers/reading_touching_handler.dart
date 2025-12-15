import 'package:flutter/material.dart';

class ReadingTouchHandler {
  final double centerZoneScale;
  
  // Các biên (tính theo tỉ lệ 0.0 -> 1.0)
  late final double _minBound;
  late final double _maxBound;

  ReadingTouchHandler({this.centerZoneScale = 0.5}) {
    final double margin = (1.0 - centerZoneScale) / 2;
    _minBound = margin;
    _maxBound = 1.0 - margin;
  }

  bool shouldToggleMenu({
    required double x, 
    required double y,
    GlobalKey<ScaffoldState>? scaffoldKey,
  }) {
    // 1. Kiểm tra Drawer (nếu có key)
    if (scaffoldKey?.currentState?.isDrawerOpen ?? false) {
      debugPrint("⛔ Drawer is open -> Ignore touch");
      return false;
    }

    bool isInsideX = x >= _minBound && x <= _maxBound;
    bool isInsideY = y >= _minBound && y <= _maxBound;

    bool isCenter = isInsideX && isInsideY;

    if (isCenter) {
      debugPrint("✅ TOUCH CENTER (Normalized: ${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)}) -> Toggle Menu");
    } else {
      debugPrint("❌ TOUCH OUTSIDE (Normalized: ${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)}) -> Page Turn");
    }

    return isCenter;
  }
}