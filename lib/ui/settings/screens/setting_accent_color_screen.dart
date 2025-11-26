import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class SettingAccentColorScreen extends StatefulWidget {
  const SettingAccentColorScreen({super.key});

  @override
  State<SettingAccentColorScreen> createState() => _SettingAccentColorScreenState();
}

class _SettingAccentColorScreenState extends State<SettingAccentColorScreen> {
  late Color pickerColor;

  /// Hàm placeholder, không thực hiện logic.
  void _setMaterialYou(BuildContext context) {
    // Không làm gì cả
  }

  /// Hàm placeholder, không thực hiện logic.
  void _setCustomColor(BuildContext context) {
    // Không làm gì cả
  }

  @override
  void initState() {
    super.initState();
    // Khởi tạo màu mặc định, không phụ thuộc vào BLoC.
    pickerColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.select_accent_color.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Platform.isAndroid
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () => _setMaterialYou(context),
                              style: FilledButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: Text(LocaleKeys.use_material_you.tr()),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              Card(
                child: ColorPicker(
                  color: pickerColor,
                  showColorCode: true,
                  colorCodeReadOnly: false,
                  enableShadesSelection: false,
                  borderRadius: 50,
                  columnSpacing: 12,
                  wheelSquarePadding: 16,
                  onColorChanged: (Color color) => setState(
                    () => pickerColor = color,
                  ),
                  heading: Text(
                    LocaleKeys.select_color.tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  pickerTypeLabels: <ColorPickerType, String>{
                    ColorPickerType.primary: LocaleKeys.standard_color.tr(),
                    ColorPickerType.wheel: LocaleKeys.custom_color.tr(),
                  },
                  pickersEnabled: const <ColorPickerType, bool>{
                    ColorPickerType.both: false,
                    ColorPickerType.primary: true,
                    ColorPickerType.accent: false,
                    ColorPickerType.wheel: true,
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: pickerColor,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () => _setCustomColor(context),
                        child: Text(LocaleKeys.save.tr()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}