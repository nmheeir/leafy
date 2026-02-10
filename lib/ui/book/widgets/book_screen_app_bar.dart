import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/data/models/book/utils/utils.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/bloc/theme/theme_bloc.dart';
import 'package:leafy/logic/cubit/book_actor/book_actor_cubit.dart';
import 'package:leafy/logic/cubit/book_detail/book_detail_cubit.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
// import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/book_editor/book_editor_args.dart';
import 'package:leafy/ui/book_editor/book_editor_screen.dart';
import 'package:leafy/ui/book_resource/book_resource_screen.dart';

class BookScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _showDeleteRestoreDialog(
    BuildContext context,
    bool deleted,
    bool? deletePermanently,
    Book book,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final isPermanentDelete = deleted && deletePermanently == true;
        final isRestore = !deleted;

        return AlertDialog(
          icon: Icon(
            isPermanentDelete
                ? Icons.delete_forever_rounded
                : isRestore
                ? Icons.restore_from_trash_rounded
                : Icons.delete_outline_rounded,
            color: context.colorScheme.primary,
          ),
          title: Text(
            isPermanentDelete
                ? LocaleKeys.delete_perm_question.tr()
                : isRestore
                ? LocaleKeys.restore_book_question.tr()
                : LocaleKeys.delete_book_question.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          content: Text(
            isPermanentDelete
                ? 'This action cannot be undone.'
                : isRestore
                ? 'The book will be moved back to your library.'
                : 'The book will be moved to the trash bin.',
            textAlign: TextAlign.center,
            style: TextStyle(color: context.colorScheme.onSurfaceVariant),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(LocaleKeys.no.tr()),
            ),
            FilledButton.tonal(
              onPressed: () {
                _deleteAction(
                  deletePermanently: deletePermanently,
                  book: book,
                  context: context,
                  deleted: deleted,
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: isPermanentDelete
                    ? context.colorScheme.errorContainer
                    : context.colorScheme.primaryContainer,
                foregroundColor: isPermanentDelete
                    ? context.colorScheme.onErrorContainer
                    : context.colorScheme.onPrimaryContainer,
              ),
              child: Text(LocaleKeys.yes.tr()),
            ),
          ],
        );
      },
    );
  }

  void _deleteAction({
    required bool? deletePermanently,
    required Book book,
    required BuildContext context,
    required bool deleted,
  }) {
    // Perform deletion/restoration
    if (deletePermanently == true) {
      context.read<BookActorCubit>().deleteBook(book.id!);
    } else {
      final updatedBook = book.copyWith(deleted: deleted);
      context.read<BookActorCubit>().updateBook(updatedBook, null);
    }
    Navigator.of(context).pop(); // Close dialog
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final themeMode = (state as SetThemeState).themeMode;
        final isDark =
            themeMode == ThemeMode.dark ||
            (themeMode == ThemeMode.system &&
                MediaQuery.platformBrightnessOf(context) == Brightness.dark);

        return AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: isDark
                ? Brightness.light
                : Brightness.dark,
            statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: context.colorScheme.surface.withValues(
                alpha: 0.8,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 20),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CircleAvatar(
                backgroundColor: context.colorScheme.surface.withValues(
                  alpha: 0.8,
                ),
                child: BlocBuilder<BookDetailCubit, BookDetailState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loaded: (bookWithDetails) {
                        final book = bookWithDetails.book;
                        return MenuAnchor(
                          builder:
                              (
                                BuildContext context,
                                MenuController controller,
                                Widget? child,
                              ) {
                                return IconButton(
                                  onPressed: () {
                                    if (controller.isOpen) {
                                      controller.close();
                                    } else {
                                      controller.open();
                                    }
                                  },
                                  icon: const Icon(Icons.more_vert, size: 20),
                                  tooltip: 'More options',
                                );
                              },
                          menuChildren: _buildMenuItems(context, book),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildMenuItems(BuildContext context, Book book) {
    final List<Widget> items = [];

    // Edit Item
    items.add(
      MenuItemButton(
        leadingIcon: const Icon(Icons.edit_outlined),
        onPressed: () => _editBook(context, book),
        child: Text(LocaleKeys.edit_book.tr()),
      ),
    );

    // Resource Folder Item
    if (book.id != null) {
      items.add(
        MenuItemButton(
          leadingIcon: const Icon(Icons.folder_open_outlined),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<BookResourceCubit>(),
                  child: BookResourceScreen(bookId: book.id!),
                ),
              ),
            );
          },
          child: const Text('Resources'),
        ),
      );
    }

    // Delete / Restore Options
    if (book.deleted == true) {
      items.add(
        MenuItemButton(
          leadingIcon: const Icon(Icons.restore_from_trash_outlined),
          onPressed: () => _showDeleteRestoreDialog(
            context,
            false, // deleted => false (Restore)
            null,
            book,
          ),
          child: Text(LocaleKeys.restore_book.tr()),
        ),
      );
      items.add(
        MenuItemButton(
          leadingIcon: Icon(
            Icons.delete_forever_outlined,
            color: context.colorScheme.error,
          ),
          onPressed: () => _showDeleteRestoreDialog(
            context,
            true, // deleted => true
            true, // permanently => true
            book,
          ),
          child: Text(
            LocaleKeys.delete_permanently.tr(),
            style: TextStyle(color: context.colorScheme.error),
          ),
        ),
      );
    } else {
      items.add(
        MenuItemButton(
          leadingIcon: Icon(
            Icons.delete_outline,
            color: context.colorScheme.error,
          ),
          onPressed: () => _showDeleteRestoreDialog(
            context,
            true, // deleted => true (Move to trash)
            null,
            book,
          ),
          child: Text(
            LocaleKeys.delete_book.tr(),
            style: TextStyle(color: context.colorScheme.error),
          ),
        ),
      );
    }

    return items;
  }

  Future<void> _editBook(BuildContext context, Book book) async {
    context.read<EditBookCubit>().setBook(book);
    final cover = await getCoverBytes(book.id);

    if (!context.mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            BookEditorScreen(args: BookEditorArgs.fromLocal(book, cover)),
      ),
    );
  }
}
