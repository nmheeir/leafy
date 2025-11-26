import 'package:flutter/material.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/ui/book_editor/widgets/animated_status_button.dart';

class BookStatusRow extends StatelessWidget {
  const BookStatusRow({
    super.key,
    required this.animDuration,
    required this.defaultHeight,
    // --- Các tham số mới thay thế cho BLoC ---
    required this.status,
    required this.onStatusChanged,
  });

  final Duration animDuration;
  final double defaultHeight;
  // --- Dữ liệu và callback được truyền từ widget cha ---
  final BookStatus status;
  final ValueChanged<BookStatus> onStatusChanged;

  @override
  Widget build(BuildContext context) {
    // Loại bỏ BlocBuilder
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          AnimatedStatusButton(
            duration: animDuration,
            height: defaultHeight,
            icon: Icons.done,
            // Thay thế .tr() bằng chuỗi hardcoded
            text: 'Finished',
            // Sử dụng tham số `status` thay vì `state.status`
            isSelected: status == BookStatus.read,
            currentStatus: status,
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              // Gọi callback `onStatusChanged` thay vì gọi BLoC
              onStatusChanged(BookStatus.read);
            },
          ),
          const SizedBox(width: 10),
          AnimatedStatusButton(
            duration: animDuration,
            height: defaultHeight,
            icon: Icons.autorenew,
            // Thay thế .tr() bằng chuỗi hardcoded
            text: 'In Progress',
            // Sử dụng tham số `status` thay vì `state.status`
            isSelected: status == BookStatus.inProgress,
            currentStatus: status,
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              // Gọi callback `onStatusChanged` thay vì gọi BLoC
              onStatusChanged(BookStatus.inProgress);
            },
          ),
          const SizedBox(width: 10),
          AnimatedStatusButton(
            duration: animDuration,
            height: defaultHeight,
            icon: Icons.timelapse,
            // Thay thế .tr() bằng chuỗi hardcoded
            text: 'For Later',
            // Sử dụng tham số `status` thay vì `state.status`
            isSelected: status == BookStatus.forLater,
            currentStatus: status,
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              // Gọi callback `onStatusChanged` thay vì gọi BLoC
              onStatusChanged(BookStatus.forLater);
            },
          ),
          const SizedBox(width: 10),
          AnimatedStatusButton(
            duration: animDuration,
            height: defaultHeight,
            icon: Icons.not_interested,
            // Thay thế .tr() bằng chuỗi hardcoded
            text: 'Unfinished',
            // Sử dụng tham số `status` thay vì `state.status`
            isSelected: status == BookStatus.unfinished,
            currentStatus: status,
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              // Gọi callback `onStatusChanged` thay vì gọi BLoC
              onStatusChanged(BookStatus.unfinished);
            },
          ),
        ],
      ),
    );
  }
}