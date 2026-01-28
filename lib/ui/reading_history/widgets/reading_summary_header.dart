import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/datetime_helper.dart';
import 'package:leafy/domain/reading_session/repositories/reading_session_repository.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class ReadingSummaryHeader extends StatelessWidget {
  final ReadingHistorySummary summary;

  const ReadingSummaryHeader({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(
              context,
              LocaleKeys.reading_history_total_time.tr(),
              DatetimeHelper.formatDuration(summary.totalDuration),
              Icons.timer,
            ),
            Container(
              height: 30,
              width: 1,
              color: context.colorScheme.outlineVariant,
            ),
            _buildItem(
              context,
              LocaleKeys.reading_history_sessions.tr(),
              summary.sessionCount.toString(),
              Icons.bookmark,
            ),
            Container(
              height: 30,
              width: 1,
              color: context.colorScheme.outlineVariant,
            ),
            _buildItem(
              context,
              LocaleKeys.reading_history_avg_session.tr(),
              DatetimeHelper.formatDuration(summary.averageDuration),
              Icons.bar_chart,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, size: 20, color: context.colorScheme.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
