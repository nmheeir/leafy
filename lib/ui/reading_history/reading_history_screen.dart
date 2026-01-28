import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/domain/reading_session/repositories/reading_session_repository.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/reading_history/reading_history_cubit.dart';
import 'package:leafy/logic/cubit/reading_history/reading_history_state.dart';
import 'package:leafy/ui/reading_history/widgets/reading_summary_header.dart';
import 'package:leafy/ui/reading_history/widgets/session_list_item.dart';

class ReadingHistoryScreen extends StatelessWidget {
  final int bookId;
  final String bookTitle;

  const ReadingHistoryScreen({
    super.key,
    required this.bookId,
    required this.bookTitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReadingHistoryCubit>()..loadData(bookId),
      child: Scaffold(
        appBar: AppBar(title: Text(bookTitle), centerTitle: true),
        body: BlocBuilder<ReadingHistoryCubit, ReadingHistoryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text('Error: $msg')),
              empty: () => _buildEmptyState(context),
              loaded: (summary, sessions, groupBy, selectedFormat) {
                // Filter sessions
                var filteredSessions = sessions;
                if (selectedFormat != null) {
                  filteredSessions = sessions
                      .where((s) => s.resourceFormat == selectedFormat)
                      .toList();
                }

                if (filteredSessions.isEmpty) {
                  return Column(
                    children: [
                      ReadingSummaryHeader(summary: summary),
                      _buildFilterBar(context, sessions, selectedFormat),
                      Expanded(child: _buildEmptyState(context)),
                    ],
                  );
                }

                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: ReadingSummaryHeader(summary: summary),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _FilterHeaderDelegate(
                        child: _buildFilterBar(
                          context,
                          sessions,
                          selectedFormat,
                        ),
                      ),
                    ),
                    _buildSessionList(context, filteredSessions),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterBar(
    BuildContext context,
    List<SessionWithResource> allSessions,
    String? selectedFormat,
  ) {
    // Get unique formats
    final formats = allSessions.map((s) => s.resourceFormat).toSet().toList();
    if (formats.length <= 1) return const SizedBox.shrink();

    return Container(
      height: 65, // Explicit height matching delegate extent
      color: context.colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.centerLeft,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip(
            context,
            label: 'All',
            isSelected: selectedFormat == null,
            onTap: () =>
                context.read<ReadingHistoryCubit>().filterByResource(null),
          ),
          ...formats.map(
            (format) => Padding(
              padding: const EdgeInsets.only(left: 8),
              child: _buildFilterChip(
                context,
                label: format.toUpperCase(),
                isSelected: selectedFormat == format,
                onTap: () => context
                    .read<ReadingHistoryCubit>()
                    .filterByResource(format),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      labelStyle: context.textTheme.labelMedium?.copyWith(
        color: isSelected
            ? context.colorScheme.onSecondaryContainer
            : context.colorScheme.onSurfaceVariant,
      ),
      selectedColor: context.colorScheme.secondaryContainer,
      backgroundColor: context.colorScheme.surfaceContainer,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_toggle_off,
            size: 64,
            color: context.colorScheme.outlineVariant,
          ),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.reading_history_empty.tr(),
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionList(
    BuildContext context,
    List<SessionWithResource> sessions,
  ) {
    // Group by date (ignoring time)
    final grouped = groupBy(sessions, (s) {
      final date = s.session.startTime;
      return DateTime(date.year, date.month, date.day);
    });

    // Sort dates descending
    final sortedDates = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final date = sortedDates[index];
        final dateSessions = grouped[date]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateHeader(context, date),
            ...dateSessions.map((s) => SessionListItem(sessionWithResource: s)),
            const SizedBox(height: 16),
          ],
        );
      }, childCount: sortedDates.length),
    );
  }

  Widget _buildDateHeader(BuildContext context, DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    String label;
    if (date == today) {
      label = LocaleKeys.reading_history_today.tr();
    } else if (date == yesterday) {
      label = LocaleKeys.reading_history_yesterday.tr();
    } else {
      label = DateFormat('MMMM d, y').format(date);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        label,
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _FilterHeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => 65;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(covariant _FilterHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
