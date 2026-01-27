import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:leafy/domain/statistics/entities/daily_reading.dart';

class ReadingHeatmap extends StatelessWidget {
  final List<DailyReading> dailyReadings;
  final DateTime endDate;

  const ReadingHeatmap({
    super.key,
    required this.dailyReadings,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    final Map<DateTime, int> datasets = {};
    final Map<DateTime, int> rawData = {};
    for (var reading in dailyReadings) {
      final date = DateTime(
        reading.date.year,
        reading.date.month,
        reading.date.day,
      );
      rawData.update(
        date,
        (value) => value + reading.duration.inMilliseconds,
        ifAbsent: () => reading.duration.inMilliseconds,
      );
    }

    // Convert to minutes and filter out zero values (which crash the heatmap)
    rawData.forEach((key, value) {
      final minutes = value ~/ 60000; // Convert ms to minutes
      if (minutes > 0) {
        datasets[key] = minutes;
      }
    });

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reading Consistency',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            HeatMap(
              datasets: datasets,
              colorMode: ColorMode.opacity,
              showText: false,
              scrollable: true,
              colorsets: {1: Theme.of(context).colorScheme.primary},
              onClick: (value) {
                // Optionally show details for the day
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Read ${value} minutes')),
                );
              },
              startDate: endDate.subtract(
                const Duration(days: 100),
              ), // Show last ~3 months initially? Or 365
              endDate: endDate,
              size: 20, // Box size
              defaultColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
            ),
          ],
        ),
      ),
    );
  }
}
