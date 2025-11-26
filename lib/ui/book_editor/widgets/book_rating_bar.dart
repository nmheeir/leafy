import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class BookRatingBar extends StatelessWidget {
  const BookRatingBar({
    super.key,
    required this.animDuration,
    // --- Các tham số mới thay thế cho BLoC ---
    required this.status,
    required this.rating,
    required this.onRatingChanged,
  });

  final Duration animDuration;
  // --- Dữ liệu và callback được truyền từ widget cha ---
  final BookStatus status;
  final int? rating;
  final ValueChanged<int> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    // Loại bỏ BlocBuilder
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AnimatedContainer(
            duration: animDuration,
            // Sử dụng tham số `status` thay vì `state.status`
            height: (status == BookStatus.read) ? Constants.formHeight : 0,
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              child: Center(
                child: RatingBar.builder(
                  unratedColor: context.colorScheme.surfaceContainerLow,
                  initialRating: (rating == null) ? 0.0 : rating! / 10,
                  allowHalfRating: true,
                  glow: false,
                  glowRadius: 1,
                  itemSize: 42,
                  itemPadding: const EdgeInsets.all(5),
                  wrapAlignment: WrapAlignment.center,
                  itemBuilder: (_, _) => Icon(
                    Icons.star_rounded,
                    color: context.colorScheme.primaryContainer,
                  ),
                  onRatingUpdate: (newRating) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    // Gọi callback `onRatingChanged` thay vì gọi BLoC
                    onRatingChanged(newRating.toInt());
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
