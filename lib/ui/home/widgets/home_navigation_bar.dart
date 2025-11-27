import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        widget.onTap(index);
      },
      indicatorColor: context.colorScheme.primaryContainer,
      selectedIndex: widget.currentIndex,
      destinations: <Widget>[
        NavigationDestination(
          icon: Icon(
            Symbols.book,
            color: widget.currentIndex == 0
                ? context.colorScheme.onPrimaryContainer
                : context.colorScheme.onSurface,
          ),
          label: LocaleKeys.books_settings.tr(),
        ),
        NavigationDestination(
          icon: FaIcon(
            FontAwesomeIcons.chartSimple,
            color: widget.currentIndex == 1
                ? context.colorScheme.onPrimaryContainer
                : context.colorScheme.onSurface,
          ),
          label: LocaleKeys.statistics.tr(),
        ),
        // ..._addHubDestination(useHub),
      ],
    );
  }
}
