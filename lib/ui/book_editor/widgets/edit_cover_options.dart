import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class EditCoverOptions extends StatelessWidget {
  const EditCoverOptions({
    super.key,
    required this.loadCoverFromStorage,
    required this.searchForCoverOnline,
    required this.loadCoverFromOpenLibrary,
    required this.editCurrentCover,
  });

  final void Function() loadCoverFromStorage;
  final void Function() searchForCoverOnline;
  final void Function() loadCoverFromOpenLibrary;
  final void Function() editCurrentCover;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (Platform.isAndroid)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.4,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ListTile(
              title: Text(LocaleKeys.load_cover_from_phone.tr()),
              leading: FaIcon(
                FontAwesomeIcons.mobile,
                color: context.colorScheme.primary,
              ),
              onTap: loadCoverFromStorage,
            ),
            ListTile(
              title: Text(LocaleKeys.search.tr()),
              leading: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: context.colorScheme.primary,
              ),
              onTap: searchForCoverOnline,
            ),
            ListTile(
              title: Text(LocaleKeys.get_cover_from_open_library.tr()),
              leading: FaIcon(
                FontAwesomeIcons.globe,
                color: context.colorScheme.primary,
              ),
              onTap: loadCoverFromOpenLibrary,
            ),
            // ListTile(
            //   title: Text(LocaleKeys.edit_current_cover.tr()),
            //   leading: FaIcon(
            //     FontAwesomeIcons.image,
            //     color: context.colorScheme.primary,
            //   ),
            //   onTap: editCurrentCover,
            // ),
          ],
        ),
      ),
    );
  }
}
