import 'package:flutter/material.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:settings_ui/settings_ui.dart';

/// Một widget chỉ để hiển thị cho màn hình cài đặt Giao diện.
/// Widget này không chứa logic nghiệp vụ và nhận tất cả dữ liệu
/// và callbacks từ một widget cha.
class SettingAppearanceScreen extends StatelessWidget {
  const SettingAppearanceScreen({
    super.key,
    this.currentThemeMode = ThemeMode.system,
    this.isAmoledDark = false,
    this.currentFontFamily,
    this.currentRatingType = RatingType.bar,
    this.isMaterialYou = false,
    this.currentAccentColor = Colors.blue,

    // --- Callbacks mặc định là hàm rỗng ---
    this.onThemeModeSelected = _emptyValueChanged,
    this.onAmoledDarkSelected = _emptyValueChanged,
    this.onFontSelected = _emptyValueChanged,
    this.onRatingTypeSelected = _emptyValueChanged,
    this.onAccentColorTapped = _emptyVoidCallback,
  });

  // --- State ---
  final ThemeMode currentThemeMode;
  final bool isAmoledDark;
  final String? currentFontFamily;
  final RatingType currentRatingType;
  final bool isMaterialYou;
  final Color currentAccentColor;

  // --- Callbacks ---
  final ValueChanged<ThemeMode> onThemeModeSelected;
  final ValueChanged<bool> onAmoledDarkSelected;
  final ValueChanged<String?> onFontSelected;
  final ValueChanged<RatingType> onRatingTypeSelected;
  final VoidCallback onAccentColorTapped;

  // ---- Default empty handlers ----
  static void _emptyValueChanged<T>(T _) {}
  static void _emptyVoidCallback() {}

  void _showThemeModeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Select Theme Mode',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // SettingsDialogButton(
                //   text: 'System',
                //   onPressed: () {
                //     onThemeModeSelected(ThemeMode.system);
                //     Navigator.of(context).pop();
                //   },
                // ),
                // const SizedBox(height: 5),
                // SettingsDialogButton(
                //   text: 'Light',
                //   onPressed: () {
                //     onThemeModeSelected(ThemeMode.light);
                //     Navigator.of(context).pop();
                //   },
                // ),
                // const SizedBox(height: 5),
                // SettingsDialogButton(
                //   text: 'Dark',
                //   onPressed: () {
                //     onThemeModeSelected(ThemeMode.dark);
                //     Navigator.of(context).pop();
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDarkModeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Dark Mode Style',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // SettingsDialogButton(
                //   text: 'Natural',
                //   onPressed: () {
                //     onAmoledDarkSelected(false);
                //     Navigator.of(context).pop();
                //   },
                // ),
                // const SizedBox(height: 5),
                // SettingsDialogButton(
                //   text: 'AMOLED',
                //   onPressed: () {
                //     onAmoledDarkSelected(true);
                //     Navigator.of(context).pop();
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFontDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Select Font',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // SettingsDialogButton(
                          //   text: 'Default',
                          //   onPressed: () {
                          //     onFontSelected(null);
                          //     Navigator.of(context).pop();
                          //   },
                          // ),
                          // for (var font in Constants.fonts) ...[
                          //   const SizedBox(height: 5),
                          //   SettingsDialogButton(
                          //     text: font['text'] as String,
                          //     fontFamily: font['family'] as String,
                          //     onPressed: () {
                          //       onFontSelected(font['family'] as String);
                          //       Navigator.of(context).pop();
                          //     },
                          //   ),
                          // ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRatingBarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Select Rating Type',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // SettingsDialogButton(
                //   text: 'Bar',
                //   onPressed: () {
                //     onRatingTypeSelected(RatingType.bar);
                //     Navigator.of(context).pop();
                //   },
                // ),
                // const SizedBox(height: 5),
                // SettingsDialogButton(
                //   text: 'Number',
                //   onPressed: () {
                //     onRatingTypeSelected(RatingType.number);
                //     Navigator.of(context).pop();
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appearance',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SettingsList(
        contentPadding: const EdgeInsets.only(top: 10),
        darkTheme: SettingsThemeData(
          settingsListBackground: isAmoledDark
              ? Colors.black
              : Theme.of(context).colorScheme.surfaceContainerLowest,
        ),
        lightTheme: SettingsThemeData(
          settingsListBackground:
              Theme.of(context).colorScheme.surfaceContainerLowest,
        ),
        sections: [
          SettingsSection(
            tiles: <SettingsTile>[
              _buildAccentSetting(context),
              _buildThemeModeSetting(context),
              _buildDarkModeSetting(context),
              _buildFontSetting(context),
              _buildRatingTypeSetting(context),
            ],
          ),
        ],
      ),
    );
  }

  SettingsTile _buildThemeModeSetting(BuildContext context) {
    String description;
    switch (currentThemeMode) {
      case ThemeMode.light:
        description = 'Light';
        break;
      case ThemeMode.dark:
        description = 'Dark';
        break;
      default:
        description = 'System';
    }

    return SettingsTile(
      title: const Text(
        'Theme Mode',
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.sunny),
      description: Text(description, style: const TextStyle()),
      onPressed: (context) => _showThemeModeDialog(context),
    );
  }

  SettingsTile _buildDarkModeSetting(BuildContext context) {
    return SettingsTile(
      title: const Text(
        'Dark Mode Style',
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.contrast),
      description: Text(
        isAmoledDark ? 'AMOLED' : 'Natural',
        style: const TextStyle(),
      ),
      onPressed: (context) => _showDarkModeDialog(context),
    );
  }

  SettingsTile _buildFontSetting(BuildContext context) {
    return SettingsTile(
      title: const Text(
        'Font',
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.font_download, size: 22),
      description: Text(
        currentFontFamily ?? 'Default',
        style: const TextStyle(),
      ),
      onPressed: (context) => _showFontDialog(context),
    );
  }

  SettingsTile _buildRatingTypeSetting(BuildContext context) {
    String description;
    switch (currentRatingType) {
      case RatingType.number:
        description = 'Number';
        break;
      case RatingType.bar:
        description = 'Bar';
    }
    return SettingsTile(
      title: const Text(
        'Rating Type',
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.star_rounded),
      description: Text(description, style: const TextStyle()),
      onPressed: (context) => _showRatingBarDialog(context),
    );
  }

  SettingsTile _buildAccentSetting(BuildContext context) {
    return SettingsTile.navigation(
      title: const Text(
        'Accent Color',
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.color_lens),
      description: Text(
        isMaterialYou
            ? 'Material You'
            // Chuyển đổi Color thành chuỗi Hex
            : '#${currentAccentColor.value.toRadixString(16).substring(2).toUpperCase()}',
        style: const TextStyle(),
      ),
      onPressed: (context) => onAccentColorTapped(),
    );
  }
}