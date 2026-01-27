part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

final class ChangingThemeState extends ThemeState {
  const ChangingThemeState();

  @override
  List<Object?> get props => [];
}

final class SetThemeState extends ThemeState {
  final ThemeMode themeMode;
  final Color primaryColor;
  final String? fontFamily;
  final bool useMaterialYou;
  final bool amoledDark;
  final ThemeContrast themeContrast;
  final List<ThemeContrast> supportedContrasts;
  final String? themeId;

  const SetThemeState({
    required this.themeMode,
    required this.primaryColor,
    required this.fontFamily,
    required this.useMaterialYou,
    required this.amoledDark,
    this.themeContrast = ThemeContrast.standard,
    required this.supportedContrasts,
    this.themeId,
  });

  SetThemeState copyWith({
    ThemeMode? themeMode,
    Color? primaryColor,
    String? fontFamily,
    bool? useMaterialYou,
    bool? amoledDark,
    ThemeContrast? themeContrast,
    List<ThemeContrast>? supportedContrasts,
    String? themeId,
  }) {
    return SetThemeState(
      themeMode: themeMode ?? this.themeMode,
      primaryColor: primaryColor ?? this.primaryColor,
      fontFamily: fontFamily ?? this.fontFamily,
      useMaterialYou: useMaterialYou ?? this.useMaterialYou,
      amoledDark: amoledDark ?? this.amoledDark,
      themeContrast: themeContrast ?? this.themeContrast,
      supportedContrasts: supportedContrasts ?? this.supportedContrasts,
      themeId: themeId ?? this.themeId,
    );
  }

  @override
  List<Object?> get props => [
    themeMode,
    primaryColor,
    fontFamily,
    useMaterialYou,
    amoledDark,
    themeContrast,
    themeId,
    supportedContrasts,
  ];
}
