import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:material_symbols_icons/symbols.dart';

class AddBookSheet extends StatefulWidget {
  const AddBookSheet({
    super.key,
    required this.addManually,
    required this.searchInOpenLibrary,
    required this.searchInGutendex,
    required this.scanBarcode,
  });

  final VoidCallback addManually;
  final VoidCallback searchInOpenLibrary;
  final VoidCallback searchInGutendex;
  final VoidCallback scanBarcode;

  static Future<void> show(
    BuildContext context, {
    required VoidCallback addManually,
    required VoidCallback searchInOpenLibrary,
    required VoidCallback searchInGutendex,
    required VoidCallback scanBarcode,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddBookSheet(
        addManually: addManually,
        searchInOpenLibrary: searchInOpenLibrary,
        searchInGutendex: searchInGutendex,
        scanBarcode: scanBarcode,
      ),
    );
  }

  @override
  State<AddBookSheet> createState() => _AddBookSheetState();
}

class _AddBookSheetState extends State<AddBookSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.4,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            ListTile(
              title: Text(LocaleKeys.add_manually.tr()),
              leading: Icon(
                Symbols.keyboard,
                color: context.colorScheme.primary,
              ),
              onTap: widget.addManually,
            ),
            ListTile(
              title: Text(LocaleKeys.add_search.tr()),
              leading: Icon(Symbols.search, color: context.colorScheme.primary),
              onTap: widget.searchInOpenLibrary,
            ),
            ListTile(
              title: Text(LocaleKeys.search_in_gutendex.tr()),
              leading: Icon(Symbols.search, color: context.colorScheme.primary),
              onTap: widget.searchInGutendex,
            ),
            ListTile(
              title: Text(LocaleKeys.add_scan.tr()),
              leading: Icon(
                Symbols.barcode,
                color: context.colorScheme.primary,
              ),
              onTap: widget.scanBarcode,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
