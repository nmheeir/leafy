import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/datetime_helper.dart';
import 'package:leafy/domain/reading_session/repositories/reading_session_repository.dart';

class SessionListItem extends StatelessWidget {
  final SessionWithResource sessionWithResource;

  const SessionListItem({super.key, required this.sessionWithResource});

  @override
  Widget build(BuildContext context) {
    final session = sessionWithResource.session;
    final format = sessionWithResource.resourceFormat.toUpperCase();

    // Determine icon based on format
    IconData iconData = Icons.book;
    if (format == 'PDF') {
      iconData = Icons.picture_as_pdf;
    } else if (format == 'AUDIO') {
      iconData = Icons.headphones;
    } else if (format == 'EPUB') {
      iconData = Icons.tablet_mac;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline connector style
          Column(
            children: [
              Container(
                width: 2,
                height: 10,
                color: context.colorScheme.outlineVariant.withValues(
                  alpha: 0.5,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  size: 16,
                  color: context.colorScheme.primary,
                ),
              ),
              Container(
                width: 2,
                height: 40, // Connect to next item visually
                color: context.colorScheme.outlineVariant.withValues(
                  alpha: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DatetimeHelper.formatTimeRange(
                        session.startTime,
                        session.endTime,
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        DatetimeHelper.formatMs(session.durationMs),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.colorScheme.outlineVariant,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        format,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    if (session.chapterIndex != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        'Chapter ${session.chapterIndex! + 1}',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
