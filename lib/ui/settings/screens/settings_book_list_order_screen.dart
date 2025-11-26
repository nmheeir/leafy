import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class SettingsBookListOrderScreen extends StatelessWidget {
  const SettingsBookListOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.tabs_order.tr()
        ),
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}