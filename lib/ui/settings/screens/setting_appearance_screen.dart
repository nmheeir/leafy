import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/theme/app_theme_provider.dart';
import 'package:leafy/core/theme/theme_contrast.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/rating_type/rating_type_bloc.dart';
import 'package:leafy/logic/bloc/theme/theme_bloc.dart';
import 'package:leafy/ui/settings/widgets/setting_dialog_button.dart';
import 'package:leafy/ui/settings/widgets/themes/app_theme_option_item.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingAppearanceScreen extends StatelessWidget {
  const SettingAppearanceScreen({super.key});

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
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: context.colorScheme.surface,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                if (state is! SetThemeState) return const SizedBox();

                final currentFont = state.fontFamily;

                return Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      LocaleKeys.select_font.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        itemCount: Constants.fonts.length + 1,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1, indent: 16, endIndent: 16),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            final isSelected = currentFont == null;
                            return ListTile(
                              title: Text(LocaleKeys.font_default.tr()),
                              trailing: isSelected
                                  ? Icon(
                                      Icons.check,
                                      color: context.colorScheme.primary,
                                    )
                                  : null,
                              onTap: () {
                                _setFont(context, state, null);
                              },
                            );
                          }

                          final fontData = Constants.fonts[index - 1];
                          final fontFamily = fontData['family'] as String;
                          final fontText = fontData['text'] as String;
                          final isSelected = currentFont == fontFamily;

                          return ListTile(
                            title: Text(
                              fontText,
                              style: TextStyle(
                                fontFamily: fontFamily,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              'The quick brown fox jumps over the lazy dog',
                              style: TextStyle(
                                fontFamily: fontFamily,
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            trailing: isSelected
                                ? Icon(
                                    Icons.check,
                                    color: context.colorScheme.primary,
                                  )
                                : null,
                            onTap: () {
                              _setFont(context, state, fontFamily);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
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
        themeId: state.themeId,
        themeContrast: state.themeContrast,
        supportedContrasts: state.supportedContrasts,
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
        themeId: state.themeId,
        themeContrast: state.themeContrast,
        supportedContrasts: state.supportedContrasts,
      ),
    );

    context.pop();
  }

  void _setFont(BuildContext context, SetThemeState state, String? fontFamily) {
    BlocProvider.of<ThemeBloc>(context).add(
      ChangeThemeEvent(
        themeMode: state.themeMode,
        primaryColor: state.primaryColor,
        fontFamily: fontFamily,
        useMaterialYou: state.useMaterialYou,
        amoledDark: state.amoledDark,
        themeId: state.themeId,
        themeContrast: state.themeContrast,
        supportedContrasts: state.supportedContrasts,
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
                  CustomSettingsTile(
                    child: _buildVisualThemeSelector(context, state),
                  ),
                  // _buildAccentColorSetting(context),
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

  Widget _buildVisualThemeSelector(BuildContext context, ThemeState state) {
    if (state is! SetThemeState) return const SizedBox();

    // Only use defined themes from registry
    final definedThemes = AppThemes.allThemes;
    // +1 for Dynamic
    final totalCount = definedThemes.length + 1;

    // Show selector if current state supports more than 1 contrast
    final showContrastSelector = state.supportedContrasts.length > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
          child: Text(
            LocaleKeys.theme_mode.tr(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            itemCount: totalCount,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              String label;
              Color seedColor;
              String? themeId;
              bool isSelected;
              bool isDynamic = false;
              List<ThemeContrast> supportedContrasts;

              if (index == 0) {
                // Dynamic Option
                label = 'Dynamic';
                if (state.useMaterialYou) {
                  seedColor = context.colorScheme.primary;
                } else {
                  seedColor = Colors.blue; // Fallback for preview
                }
                themeId = null;
                isSelected = state.useMaterialYou;
                isDynamic = true;
                supportedContrasts = [ThemeContrast.standard];
              } else {
                // Defined Themes
                final theme = definedThemes[index - 1];
                label = theme.name;
                seedColor = theme
                    .lightColorScheme(ThemeContrast.standard)
                    .primary;
                themeId = theme.id;
                isSelected = !state.useMaterialYou && state.themeId == theme.id;
                supportedContrasts = theme.supportedContrasts;
              }

              return AppThemeOptionItem(
                seedColor: seedColor,
                themeMode: state.themeMode,
                isSelected: isSelected,
                label: label,
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(
                    ChangeThemeEvent(
                      themeMode: state.themeMode,
                      primaryColor: isDynamic ? state.primaryColor : seedColor,
                      fontFamily: state.fontFamily,
                      useMaterialYou: isDynamic,
                      amoledDark: state.amoledDark,
                      themeId: themeId,
                      // Pass the supported contrasts of the SELECTED theme
                      supportedContrasts: supportedContrasts,
                      // Default to standard when switching theme
                      themeContrast: ThemeContrast.standard,
                    ),
                  );
                },
              );
            },
          ),
        ),
        if (showContrastSelector) ...[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              'Contrast Level',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<ThemeContrast>(
                segments: state.supportedContrasts.map((contrast) {
                  return ButtonSegment<ThemeContrast>(
                    value: contrast,
                    label: Text(
                      contrast.name[0].toUpperCase() +
                          contrast.name.substring(1).toLowerCase(),
                    ),
                  );
                }).toList(),
                selected: {state.themeContrast},
                onSelectionChanged: (Set<ThemeContrast> newSelection) {
                  BlocProvider.of<ThemeBloc>(context).add(
                    ChangeThemeEvent(
                      themeMode: state.themeMode,
                      primaryColor: state.primaryColor,
                      fontFamily: state.fontFamily,
                      useMaterialYou: state.useMaterialYou,
                      amoledDark: state.amoledDark,
                      themeId: state.themeId,
                      themeContrast: newSelection.first,
                      supportedContrasts: state.supportedContrasts,
                    ),
                  );
                },
                showSelectedIcon: false,
              ),
            ),
          ),
        ],
        const SizedBox(height: 10),
      ],
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
      title: Text(LocaleKeys.font_default.tr(), style: TextStyle(fontSize: 16)),
      leading: const Icon(Icons.font_download, size: 22),
      description: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SetThemeState) {
            return Text(
              state.fontFamily != null
                  ? state.fontFamily!
                  : LocaleKeys.font_default.tr(),
              style: const TextStyle(),
            );
          } else {
            return const SizedBox();
          }
        },
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
}
