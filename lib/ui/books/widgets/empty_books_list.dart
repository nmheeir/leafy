import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class EmptyBooksList extends StatelessWidget {
  const EmptyBooksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Text(
          '${LocaleKeys.this_list_is_empty_1.tr()}\n${LocaleKeys.this_list_is_empty_2.tr()}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            letterSpacing: 1.5,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
