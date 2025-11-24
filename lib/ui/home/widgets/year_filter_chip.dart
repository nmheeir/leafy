import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class YearFilterChip extends StatelessWidget {
  const YearFilterChip({
    super.key,
    required this.dbYear,
    required this.selected,
    required this.onYearChipPressed,
  });

  final int? dbYear;
  final bool selected;
  final Function(bool) onYearChipPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FilterChip(
        backgroundColor: context.colorScheme.surface,
        label: Text(
          dbYear != null ? dbYear.toString() : LocaleKeys.select_all.tr(),
          style: TextStyle(
            color: selected
                ? context.colorScheme.onPrimary
                : context.colorScheme.onSurface,
          ),
        ),
        checkmarkColor: context.colorScheme.onPrimary,
        selected: selected,
        selectedColor: context.colorScheme.primary,
        onSelected: onYearChipPressed,
      ),
    );
  }
}
