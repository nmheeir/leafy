import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/reading_history/reading_history_cubit.dart';
import 'package:leafy/logic/cubit/reading_history/reading_history_state.dart';
import 'package:leafy/router/routes.dart';

// Fallback exports if specific files don't exist
import 'package:easy_localization/easy_localization.dart';

class ReadingStatsCard extends StatelessWidget {
  final int bookId;
  final String bookTitle;

  const ReadingStatsCard({
    super.key,
    required this.bookId,
    required this.bookTitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReadingHistoryCubit>()..loadData(bookId),
      child: BlocBuilder<ReadingHistoryCubit, ReadingHistoryState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (summary, sessions, _, _) {
              final totalDuration = summary.totalDuration;
              final hours = totalDuration.inHours;
              final minutes = totalDuration.inMinutes.remainder(60);

              String timeText;
              if (hours > 0) {
                timeText = '${hours}h ${minutes}m';
              } else {
                timeText = '${minutes}m';
              }

              return Card(
                elevation: 0,
                color: context.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    // Navigate to history screen
                    context.push(
                      Routes.readingHistory,
                      extra: {'bookId': bookId, 'bookTitle': bookTitle},
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.history_edu,
                                  size: 20,
                                  color: context.colorScheme.primary,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  LocaleKeys.book_reading_activity.tr(),
                                  style: context.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: context.colorScheme.onSurfaceVariant,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildStatItem(
                              context,
                              icon: Icons.timer_outlined,
                              label: LocaleKeys.book_total_time.tr(),
                              value: timeText,
                            ),
                            _buildStatItem(
                              context,
                              icon: Icons.bookmark_added_outlined,
                              label: LocaleKeys.book_sessions.tr(),
                              value: summary.sessionCount.toString(),
                            ),
                            _buildStatItem(
                              context,
                              icon: Icons.calendar_today_outlined,
                              label: LocaleKeys.book_last_read.tr(),
                              value: summary.lastReadAt != null
                                  ? DateFormat(
                                      'MMM d',
                                    ).format(summary.lastReadAt!)
                                  : '-',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            empty: () => const SizedBox(), // Don't show if no history
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: context.colorScheme.onSurfaceVariant),
            const SizedBox(width: 4),
            Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
