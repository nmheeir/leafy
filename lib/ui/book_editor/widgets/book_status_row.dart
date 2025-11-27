import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/ui/book_editor/widgets/animated_status_button.dart';

class BookStatusRow extends StatelessWidget {
  const BookStatusRow({
    super.key,
    required this.animDuration,
    required this.defaultHeight,
  });

  final Duration animDuration;
  final double defaultHeight;
  // --- Dữ liệu và callback được truyền từ widget cha ---

  void _onStatusChanged(BuildContext context, BookStatus newStatus) {
    final cubit = context.read<EditBookCubit>();
    if (newStatus != cubit.state.status) {
      cubit.setStatus(newStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Loại bỏ BlocBuilder
    return BlocBuilder<EditBookCubit, Book>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              AnimatedStatusButton(
                duration: animDuration,
                height: defaultHeight,
                icon: Icons.done,
                text: LocaleKeys.books_finished.tr(),
                isSelected: state.status == BookStatus.finished,
                currentStatus: state.status,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _onStatusChanged(context, BookStatus.finished);
                },
              ),
              const SizedBox(width: 10),
              AnimatedStatusButton(
                duration: animDuration,
                height: defaultHeight,
                icon: Icons.autorenew,
                text: LocaleKeys.books_in_progress.tr(),
                isSelected: state.status == BookStatus.inProgress,
                currentStatus: state.status,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _onStatusChanged(context, BookStatus.inProgress);
                },
              ),
              const SizedBox(width: 10),
              AnimatedStatusButton(
                duration: animDuration,
                height: defaultHeight,
                icon: Icons.timelapse,
                text: LocaleKeys.books_for_later.tr(),
                isSelected: state.status == BookStatus.forLater,
                currentStatus: state.status,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _onStatusChanged(context, BookStatus.forLater);
                },
              ),
              const SizedBox(width: 10),
              AnimatedStatusButton(
                duration: animDuration,
                height: defaultHeight,
                icon: Icons.not_interested,
                text: LocaleKeys.books_unfinished.tr(),
                isSelected: state.status == BookStatus.unfinished,
                currentStatus: state.status,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _onStatusChanged(context, BookStatus.unfinished);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
