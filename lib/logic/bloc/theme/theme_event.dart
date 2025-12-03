part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;
  final Color primaryColor;
  final String fontFamily;
  final bool useMaterialYou;
  final bool amoledDark;

  const ChangeThemeEvent({
    required this.themeMode,
    required this.primaryColor,
    required this.fontFamily,
    required this.useMaterialYou,
    required this.amoledDark,
  });

  @override
  List<Object?> get props => [
    themeMode,
    primaryColor,
    fontFamily,
    useMaterialYou,
    amoledDark,
  ];
}

final class ChangeAccentEvent extends ThemeEvent {
  final Color primaryColor;
  final bool useMaterialYou;

  const ChangeAccentEvent({
    required this.primaryColor,
    required this.useMaterialYou,
  });

  @override
  List<Object> get props => [primaryColor, useMaterialYou];
}
