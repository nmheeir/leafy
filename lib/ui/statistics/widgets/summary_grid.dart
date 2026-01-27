import 'package:flutter/material.dart';
import 'package:leafy/domain/statistics/entities/daily_reading.dart';

class SummaryGrid extends StatelessWidget {
  final List<DailyReading> dailyReadings;
  final int totalBooks;
  final int totalPages;

  const SummaryGrid({
    super.key,
    required this.dailyReadings,
    required this.totalBooks,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final totalDurationData = dailyReadings.fold(
      Duration.zero,
      (prev, element) => prev + element.duration,
    );
    final totalHours = totalDurationData.inHours;
    final avgMinutesPerDay = dailyReadings.isEmpty
        ? 0
        : totalDurationData.inMinutes ~/
              dailyReadings.length; // Use appropriate denom

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: [
          _buildCard(context, 'Total Time', '${totalHours}h', Icons.timer),
          _buildCard(
            context,
            'Avg. Daily',
            '${avgMinutesPerDay}m',
            Icons.speed,
          ),
          _buildCard(context, 'Books Read', '$totalBooks', Icons.book),
          _buildCard(context, 'Pages Read', '$totalPages', Icons.pages),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
