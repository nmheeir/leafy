import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';

class BookRatingBar extends StatelessWidget {
  const BookRatingBar({super.key, required this.animDuration});

  final Duration animDuration;

  @override
  Widget build(BuildContext context) {
    // Loại bỏ BlocBuilder
    return BlocBuilder<EditBookCubit, Book>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AnimatedContainer(
                duration: animDuration,
                height: (state.status == BookStatus.finished)
                    ? Constants.formHeight
                    : 0,
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                  child: Center(
                    child: RatingBar.builder(
                      unratedColor: context.colorScheme.surfaceContainerHighest,
                      initialRating: (state.rating == null)
                          ? 0.0
                          : state.rating! / 10,
                      allowHalfRating: true,
                      glow: false,
                      glowRadius: 1,
                      itemSize: 42,
                      itemPadding: const EdgeInsets.all(5),
                      wrapAlignment: WrapAlignment.center,
                      itemBuilder: (_, _) => Icon(
                        Icons.star_rounded,
                        color: context.colorScheme.primary.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      onRatingUpdate: (newRating) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<EditBookCubit>().setRating(newRating);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
