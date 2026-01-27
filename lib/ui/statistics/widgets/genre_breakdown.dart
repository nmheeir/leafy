import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:leafy/domain/statistics/entities/genre_stats.dart';

class GenreBreakdown extends StatelessWidget {
  final List<GenreStats> genreStats;

  const GenreBreakdown({super.key, required this.genreStats});

  @override
  Widget build(BuildContext context) {
    if (genreStats.isEmpty) return const SizedBox();

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Read Formats',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: genreStats.asMap().entries.map((e) {
                    final index = e.key;
                    final stat = e.value;
                    final total = genreStats.fold(
                      0,
                      (sum, item) => sum + item.bookCount,
                    );
                    final percentage = (stat.bookCount / total * 100)
                        .toStringAsFixed(1);
                    final isLarge =
                        stat.bookCount / total > 0.2; // Highlight big ones?

                    return PieChartSectionData(
                      color: Colors.primaries[index % Colors.primaries.length],
                      value: stat.bookCount.toDouble(),
                      title: '$percentage%',
                      radius: isLarge ? 60 : 50,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: genreStats.asMap().entries.map((e) {
                final index = e.key;
                final stat = e.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color:
                              Colors.primaries[index % Colors.primaries.length],
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(stat.genre),
                      const Spacer(),
                      Text('${stat.bookCount} books'),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
