import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/main.dart';

class BookDetailDateAddedUpdated extends StatelessWidget {
  const BookDetailDateAddedUpdated({
    super.key,
    required this.dateAdded,
    required this.dateModified,
  });

  final DateTime dateAdded;
  final DateTime dateModified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                LocaleKeys.added_on.tr(),
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                '${dateFormat.format(dateAdded)} ${dateAdded.hour}:${dateAdded.minute.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: context.colorScheme.onSurface.withAlpha(150),
                ),
              ),
            ],
          ),
          dateAdded.millisecondsSinceEpoch !=
                  dateModified.millisecondsSinceEpoch
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      LocaleKeys.modified_on.tr(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      '${dateFormat.format(dateModified)} ${dateModified.hour}:${dateModified.minute}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: context.colorScheme.onSurface.withAlpha(150),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
