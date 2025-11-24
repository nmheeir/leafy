import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/main.dart';
import 'package:material_symbols_icons/symbols.dart';

class MultiSelectFAB extends StatelessWidget {
  MultiSelectFAB({super.key});

  final bookTypes = [
    LocaleKeys.book_format_paperback.tr(),
    LocaleKeys.book_format_hardcover.tr(),
    LocaleKeys.book_format_ebook.tr(),
    LocaleKeys.book_format_audiobook.tr(),
  ];

  String _getLabel(BulkEditOption bulkEditOption) {
    String label = '';
    switch (bulkEditOption) {
      case BulkEditOption.format:
        label = LocaleKeys.change_book_format.tr();
        break;
      case BulkEditOption.author:
        label = LocaleKeys.change_books_author.tr();
        break;
      default:
        label = '';
    }

    return label;
  }

  Material _buildBottomSheet(
    BuildContext context,
    BulkEditOption bulkEditOption,
  ) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (Platform.isAndroid)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
              const SizedBox(height: 10),
              _buildHeader(bulkEditOption),
              const SizedBox(height: 30),
              // bulkEditOption == BulkEditOption.format
              //     ? _buildEditFormat(selectedList, context)
              //     : bulkEditOption == BulkEditOption.author
              //     ? _buildEditAuthor(selectedList, context)
              //     : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteBooksDialog(
    BuildContext context, [
    List<int> selectedList = const [],
  ]) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog.adaptive(
          shape: Platform.isAndroid
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                )
              : null,
          title: Text(
            LocaleKeys.delete_books_question.tr(),
            style: const TextStyle(fontSize: 18),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            Platform.isIOS
                ? CupertinoDialogAction(
                    child: Text(LocaleKeys.no.tr()),
                    onPressed: () {
                      context.pop();
                    },
                  )
                : FilledButton.tonal(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(LocaleKeys.no.tr()),
                    ),
                  ),
            Platform.isIOS
                ? CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(LocaleKeys.yes.tr()),
                    onPressed: () => _bulkDeleteBooks(context, selectedList),
                  )
                : FilledButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(cornerRadius),
                        ),
                      ),
                    ),
                    onPressed: () => _bulkDeleteBooks(context, selectedList),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(LocaleKeys.yes.tr()),
                    ),
                  ),
          ],
        );
      },
    );
  }

  Future<void> _bulkDeleteBooks(
    BuildContext context,
    List<int> selectedList,
  ) async {
    List<Book> booksToSync = List.empty(growable: true);

    for (final bookId in selectedList) {
      Book? book = await bookCubit.getBook(bookId);

      if (book == null) continue;
      book = book.copyWith(deleted: true);
      booksToSync.add(book);

      await bookCubit.updateBook(book);
    }

    bookCubit.getDeletedBooks();

    if (!context.mounted) return;
    // context.read<PbSyncBloc>().add(TriggerSyncEvent(booksToSync: booksToSync));

    // context.read<SelectedBooksCubit>().resetSelection();

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 00),
      child: SpeedDial(
        spacing: 20,
        dialRoot: (ctx, open, toggleChildren) {
          return FloatingActionButton(
            onPressed: toggleChildren,
            child: const Icon(Symbols.edit_square),
          );
        },
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.menu_book,
              color: context.colorScheme.onSecondary,
              size: 18,
            ),
            backgroundColor: context.colorScheme.secondary,
            labelBackgroundColor: context.colorScheme.surfaceContainerHighest,
            foregroundColor: context.colorScheme.onSurfaceVariant,
            label: LocaleKeys.change_book_format.tr(),
            onTap: () {
              if (Platform.isIOS) {
                // showCupertinoModalBottomSheet(
                //   context: context,
                //   expand: false,
                //   builder: (_) {
                //     return _buildBottomSheet(
                //       context,
                //       BulkEditOption.format,
                //       selectedList,
                //     );
                //   },
                // );
              } else if (Platform.isAndroid) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return _buildBottomSheet(
                      context,
                      BulkEditOption.format,
                      // selectedList,
                    );
                  },
                );
              }
            },
          ),
          SpeedDialChild(
            child: Icon(
              Symbols.person,
              color: context.colorScheme.onSecondary,
              size: 18,
            ),
            backgroundColor: context.colorScheme.secondary,
            labelBackgroundColor: context.colorScheme.surfaceContainerHighest,
            foregroundColor: context.colorScheme.onSurfaceVariant,
            label: LocaleKeys.change_books_author.tr(),
            onTap: () {
              if (Platform.isIOS) {
                // showCupertinoModalBottomSheet(
                //   context: context,
                //   expand: false,
                //   builder: (_) {
                //     return _buildBottomSheet(
                //       context,
                //       BulkEditOption.author,
                //       selectedList,
                //     );
                //   },
                // );
              } else if (Platform.isAndroid) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return _buildBottomSheet(
                      context,
                      BulkEditOption.author,
                      // selectedList,
                    );
                  },
                );
              }
            },
          ),
          SpeedDialChild(
            child: Icon(
              Icons.delete,
              color: context.colorScheme.onTertiary,
              size: 18,
            ),
            backgroundColor: context.colorScheme.tertiary,
            labelBackgroundColor: context.colorScheme.surfaceContainerHighest,
            foregroundColor: context.colorScheme.onSurfaceVariant,
            label: LocaleKeys.delete_books.tr(),
            onTap: () => _showDeleteBooksDialog(context),
          ),
        ],
      ),
    );
  }

  Row _buildHeader(BulkEditOption bulkEditOption) {
    return Row(
      children: [
        Expanded(
          child: Text(
            _getLabel(bulkEditOption),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
