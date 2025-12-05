import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/book_list_order_cubit.dart';

class SettingBookListOrderScreen extends StatelessWidget {
  const SettingBookListOrderScreen({super.key});

  String _getBookStatusTranslation(BookStatus status) {
    switch (status) {
      case BookStatus.finished:
        return LocaleKeys.books_finished.tr();
      case BookStatus.inProgress:
        return LocaleKeys.books_in_progress.tr();
      case BookStatus.forLater:
        return LocaleKeys.books_for_later.tr();
      case BookStatus.unfinished:
        return LocaleKeys.books_unfinished.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget proxyDecorator(
      Widget child,
      int index,
      Animation<double> animation,
    ) {
      return Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: animation.drive(
            Tween<double>(
              begin: 1,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.decelerate)),
          ),
          child: child,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.tabs_order.tr(),
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: BlocBuilder<BookListsOrderCubit, List<BookStatus>>(
              builder: (context, bookListsOrder) {
                return ReorderableListView(
                  proxyDecorator: proxyDecorator,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  children: [
                    for (
                      int index = 0;
                      index < bookListsOrder.length;
                      index += 1
                    )
                      InkWell(
                        key: Key('$index'),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: ListTile(
                            title: Text(
                              _getBookStatusTranslation(bookListsOrder[index]),
                            ),
                            trailing: const Icon(Icons.drag_handle),
                          ),
                        ),
                      ),
                  ],
                  onReorder: (int oldIndex, int newIndex) => context
                      .read<BookListsOrderCubit>()
                      .updateOrder(oldIndex, newIndex),
                  onReorderStart: (_) {
                    HapticFeedback.heavyImpact();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
