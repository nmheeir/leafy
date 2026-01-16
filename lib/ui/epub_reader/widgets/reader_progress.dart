import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class ReaderProgressWidget extends StatelessWidget {
  final double progress; // Giá trị từ 0.0 đến 1.0
  final int currentChapterIndex;
  final int totalChapters;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;

  const ReaderProgressWidget({
    super.key,
    required this.progress,
    required this.currentChapterIndex,
    required this.totalChapters,
    this.onNext,
    this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dòng 1: Thông tin text + %
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chương ${currentChapterIndex + 1} / $totalChapters",
                style: TextStyle(
                  fontSize: 12,
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${(progress * 100).toInt()}%",
                style: TextStyle(
                  fontSize: 12,
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Dòng 2: Thanh Progress Bar + Nút điều hướng nhỏ
          Row(
            children: [
              // Nút lùi chương nhỏ gọn
              IconButton(
                onPressed: onPrev,
                icon: const Icon(Icons.skip_previous_rounded),
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: context.colorScheme.primary,
              ),

              const SizedBox(width: 12),

              // Thanh Progress Bar
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Nút tiến chương nhỏ gọn
              IconButton(
                onPressed: onNext,
                icon: const Icon(Icons.skip_next_rounded),
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: context.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
