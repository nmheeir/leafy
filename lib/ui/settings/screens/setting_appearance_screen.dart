import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/rating_type/rating_type_bloc.dart';
import 'package:leafy/logic/bloc/theme/theme_bloc.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/settings/widgets/setting_dialog_button.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingAppearanceScreen extends StatelessWidget {
  const SettingAppearanceScreen({
    super.key,
    this.currentThemeMode = ThemeMode.system,
    this.isAmoledDark = false,
    this.currentFontFamily,
    this.isMaterialYou = false,
    this.currentAccentColor = Colors.blue,

    // --- Callbacks mặc định là hàm rỗng ---
    this.onThemeModeSelected = _emptyValueChanged,
    this.onAmoledDarkSelected = _emptyValueChanged,
    this.onFontSelected = _emptyValueChanged,
    this.onAccentColorTapped = _emptyVoidCallback,
  });

  // --- State ---
  final ThemeMode currentThemeMode;
  final bool isAmoledDark;
  final String? currentFontFamily;
  final bool isMaterialYou;
  final Color currentAccentColor;

  // --- Callbacks ---
  final ValueChanged<ThemeMode> onThemeModeSelected;
  final ValueChanged<bool> onAmoledDarkSelected;
  final ValueChanged<String?> onFontSelected;
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
          backgroundColor: context.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                if (state is SetThemeState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          LocaleKeys.select_theme_mode.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SettingDialogButton(
                        text: LocaleKeys.theme_mode_system.tr(),
                        onPressed: () {
                          _setThemeMode(context, ThemeMode.system, state);
                          context.pop();
                        },
                      ),
                      const SizedBox(height: 5),
                      SettingDialogButton(
                        text: LocaleKeys.theme_mode_light.tr(),
                        onPressed: () {
                          _setThemeMode(context, ThemeMode.light, state);
                          context.pop();
                        },
                      ),
                      const SizedBox(height: 5),
                      SettingDialogButton(
                        text: LocaleKeys.theme_mode_dark.tr(),
                        onPressed: () {
                          _setThemeMode(context, ThemeMode.dark, state);
                          context.pop();
                        },
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
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
          backgroundColor: context.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                if (state is SetThemeState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          LocaleKeys.dark_mode_style.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SettingDialogButton(
                        text: LocaleKeys.dark_mode_natural.tr(),
                        onPressed: () {
                          _setDarkMode(context, state, false);
                        },
                      ),
                      const SizedBox(height: 5),
                      SettingDialogButton(
                        text: LocaleKeys.dark_mode_amoled.tr(),
                        onPressed: () {
                          _setDarkMode(context, state, true);
                        },
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
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
          backgroundColor: context.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    LocaleKeys.select_font.tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          SettingDialogButton(
                            text: LocaleKeys.default_locale.tr(),
                            onPressed: () {
                              onFontSelected(null);
                              context.pop();
                            },
                          ),
                          // TODO: add fonts
                          // for (var font in Constants.fonts) ...[
                          //   const SizedBox(height: 5),
                          //   SettingsDialogButton(
                          //     text: font['text'] as String,
                          //     fontFamily: font['family'] as String,
                          //     onPressed: () {
                          //       onFontSelected(font['family'] as String);
                          //       context.pop();
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
          backgroundColor: context.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    LocaleKeys.seletct_rating_type.tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                SettingDialogButton(
                  text: LocaleKeys.rating_as_bar.tr(),
                  onPressed: () {
                    _onRatingTypeSelected(context, RatingType.bar);
                    context.pop();
                  },
                ),
                const SizedBox(height: 5),
                SettingDialogButton(
                  text: LocaleKeys.rating_as_number.tr(),
                  onPressed: () {
                    _onRatingTypeSelected(context, RatingType.number);
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onRatingTypeSelected(BuildContext context, RatingType ratingType) {
    BlocProvider.of<RatingTypeBloc>(
      context,
    ).add(RatingTypeChange(ratingType: ratingType));
  }

  void _setThemeMode(
    BuildContext context,
    ThemeMode themeMode,
    SetThemeState state,
  ) {
    BlocProvider.of<ThemeBloc>(context).add(
      ChangeThemeEvent(
        themeMode: themeMode,
        primaryColor: state.primaryColor,
        fontFamily: state.fontFamily,
        useMaterialYou: state.useMaterialYou,
        amoledDark: state.amoledDark,
      ),
    );
  }

  void _setDarkMode(
    BuildContext context,
    SetThemeState state,
    bool amoledDark,
  ) {
    BlocProvider.of<ThemeBloc>(context).add(
      ChangeThemeEvent(
        themeMode: ThemeMode.dark,
        primaryColor: state.primaryColor,
        fontFamily: state.fontFamily,
        useMaterialYou: state.useMaterialYou,
        amoledDark: amoledDark,
      ),
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.apperance.tr(), style: TextStyle(fontSize: 18)),
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          late final bool amoledDark;
          if (state is SetThemeState) {
            amoledDark = state.amoledDark;
          } else {
            amoledDark = false;
          }

          return SettingsList(
            contentPadding: const EdgeInsets.only(top: 10),
            darkTheme: SettingsThemeData(
              settingsListBackground: amoledDark
                  ? Colors.black
                  : context.colorScheme.surfaceContainerLowest,
            ),
            lightTheme: SettingsThemeData(
              settingsListBackground:
                  context.colorScheme.surfaceContainerLowest,
            ),
            sections: [
              SettingsSection(
                tiles: [
                  _buildAccentColorSetting(context),
                  _buildThemeModeSetting(context),
                  _buildDarkModeSetting(context),
                  _buildFontSetting(context),
                  _buildRatingTypeSetting(context),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  SettingsTile _buildThemeModeSetting(BuildContext context) {
    return SettingsTile(
      title: Text(LocaleKeys.theme_mode.tr(), style: TextStyle(fontSize: 16)),
      leading: const Icon(Icons.sunny),
      description: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SetThemeState) {
            return Text(switch (state.themeMode) {
              ThemeMode.system => LocaleKeys.theme_mode_system.tr(),
              ThemeMode.light => LocaleKeys.theme_mode_light.tr(),
              ThemeMode.dark => LocaleKeys.theme_mode_dark.tr(),
            });
          } else {
            return const SizedBox();
          }
        },
      ),
      onPressed: (context) => _showThemeModeDialog(context),
    );
  }

  SettingsTile _buildDarkModeSetting(BuildContext context) {
    return SettingsTile(
      title: Text(
        LocaleKeys.dark_mode_style.tr(),
        style: TextStyle(fontSize: 16),
      ),
      leading: const Icon(Icons.contrast),
      description: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SetThemeState) {
            if (state.amoledDark) {
              return Text(LocaleKeys.dark_mode_amoled.tr());
            } else {
              return Text(LocaleKeys.dark_mode_natural.tr());
            }
          } else {
            return const SizedBox();
          }
        },
      ),
      onPressed: (context) => _showDarkModeDialog(context),
    );
  }

  SettingsTile _buildFontSetting(BuildContext context) {
    return SettingsTile(
      title: const Text('Font', style: TextStyle(fontSize: 16)),
      leading: const Icon(Icons.font_download, size: 22),
      description: Text(
        currentFontFamily ?? 'Default',
        style: const TextStyle(),
      ),
      onPressed: (context) => _showFontDialog(context),
    );
  }

  SettingsTile _buildRatingTypeSetting(BuildContext context) {
    return SettingsTile(
      title: Text(LocaleKeys.rating_type.tr(), style: TextStyle(fontSize: 16)),
      leading: const Icon(Icons.star_rounded),
      description: BlocBuilder<RatingTypeBloc, RatingTypeState>(
        builder: (_, state) {
          return Text(switch (state) {
            RatingTypeBar() => LocaleKeys.rating_as_bar.tr(),
            RatingTypeNumber() => LocaleKeys.rating_as_number.tr(),
          });
        },
      ),
      onPressed: (context) => _showRatingBarDialog(context),
    );
  }

  //TODO: apply ThemeBloc
  SettingsTile _buildAccentColorSetting(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(LocaleKeys.accent_color.tr(), style: TextStyle(fontSize: 16)),
      leading: const Icon(Icons.color_lens),
      description: Text(
        isMaterialYou
            ? 'Material You'
            // Chuyển đổi Color thành chuỗi Hex
            : '#${currentAccentColor.value.toRadixString(16).substring(2).toUpperCase()}',
        style: const TextStyle(),
      ),
      onPressed: (context) => context.push(Routes.settingAccentColor),
    );
  }
}
