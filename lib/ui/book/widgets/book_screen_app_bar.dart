import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/data/models/book/utils/utils.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/theme/theme_bloc.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cover_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/book_editor/book_editor_screen.dart';

class BookScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookScreenAppBar({super.key});

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;

  void _showDeleteRestoreDialog(
    BuildContext context,
    bool deleted,
    bool? deletePermanently,
    Book book,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // shape: Platform.isAndroid
          //     ? RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(cornerRadius),
          //       )
          //     : null,
          title: Text(
            deleted
                ? deletePermanently == true
                      ? LocaleKeys.delete_perm_question.tr()
                      : LocaleKeys.delete_book_question.tr()
                : LocaleKeys.restore_book_question.tr(),
            style: const TextStyle(fontSize: 18),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
              ),
              onPressed: () => _deleteAction(
                deletePermanently: deletePermanently,
                book: book,
                context: context,
                deleted: deleted,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(LocaleKeys.yes.tr()),
              ),
            ),
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(LocaleKeys.no.tr()),
              ),
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
    if (deletePermanently == true) {
      _deleteBookPermanently(context, book);
    } else {
      _changeDeleteStatus(context, deleted, book);
    }

    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  Future<void> _changeDeleteStatus(
    BuildContext context,
    bool deleted,
    Book book,
  ) async {
    book = book.copyWith(deleted: deleted);

    await context.bookActorCubit.updateBook(book, null);
    // bookCubit.getDeletedBooks();
  }

  Future<void> _deleteBookPermanently(BuildContext context, Book book) async {
    if (book.id != null) {
      await context.bookActorCubit.deleteBook(book.id!);
    }

    // bookCubit.getDeletedBooks();
  }

  @override
  Widget build(BuildContext context) {
    final moreButtonOptions = [
      LocaleKeys.edit_book.tr(),
      LocaleKeys.duplicate_book.tr(),
    ];

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final themeMode = (state as SetThemeState).themeMode;
        return AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: themeMode == ThemeMode.system
                ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark
                : themeMode == ThemeMode.dark
                ? Brightness.light
                : Brightness.dark,
          ),
          actions: [
            BlocBuilder<CurrentBookCubit, Book>(
              builder: (context, state) {
                if (moreButtonOptions.length == 2) {
                  if (state.deleted == true) {
                    moreButtonOptions.add(LocaleKeys.restore_book.tr());
                    moreButtonOptions.add(LocaleKeys.delete_permanently.tr());
                  } else {
                    moreButtonOptions.add(LocaleKeys.delete_book.tr());
                  }
                }

                return PopupMenuButton<String>(
                  onSelected: (_) {},
                  itemBuilder: (_) {
                    return moreButtonOptions.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                        onTap: () async {
                          context.read<EditBookCubit>().setBook(state);

                          await Future.delayed(const Duration(milliseconds: 0));
                          if (!context.mounted) return;

                          if (choice == moreButtonOptions[0]) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const BookEditorScreen(
                                  editingExistingBook: true,
                                ),
                              ),
                            );
                          } else if (choice == moreButtonOptions[1]) {
                            final cover = await getCoverBytes(state.id);

                            context.read<EditBookCoverCubit>().setCover(cover);

                            final newBook = state.copyWith(
                              title:
                                  '${state.title} ${LocaleKeys.copy_book.tr()}',
                              readings: [],
                              rating: 0,
                              id: null,
                            );

                            context.read<EditBookCubit>().setBook(newBook);
                            context.read<EditBookCubit>().setHasCover(true);

                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (_) => const BookEditorScreen(
                            //       duplicatingBook: true,
                            //     ),
                            //   ),
                            // );
                          } else if (choice == moreButtonOptions[2]) {
                            if (state.deleted == false) {
                              _showDeleteRestoreDialog(
                                context,
                                true,
                                null,
                                state,
                              );
                            } else {
                              _showDeleteRestoreDialog(
                                context,
                                false,
                                null,
                                state,
                              );
                            }
                          } else if (choice == moreButtonOptions[3]) {
                            _showDeleteRestoreDialog(
                              context,
                              true,
                              true,
                              state,
                            );
                          }
                        },
                      );
                    }).toList();
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
