import 'package:flutter/material.dart';
import 'package:leafy/logic/bloc/stats_bloc/stats_bloc.dart';
import 'package:leafy/ui/statistics/widgets/genre_breakdown.dart';
import 'package:leafy/ui/statistics/widgets/reading_heatmap.dart';
import 'package:leafy/ui/statistics/widgets/summary_grid.dart';
import 'package:leafy/ui/statistics/widgets/weekly_activity_chart.dart';

class Statistics extends StatelessWidget {
  final StatsLoaded state;

  const Statistics({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    // Determine context for charts
    final dailyReadings = state.dailyReadingActivity;
    final endDate = DateTime.now();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          SummaryGrid(
            dailyReadings: dailyReadings,
            totalBooks: state.result.finishedBooksAll,
            totalPages: state.result.finishedPagesAll,
          ),
          const SizedBox(height: 16),
          ReadingHeatmap(dailyReadings: dailyReadings, endDate: endDate),
          const SizedBox(height: 16),
          WeeklyActivityChart(dailyReadings: dailyReadings),
          const SizedBox(height: 16),
          GenreBreakdown(genreStats: state.genreStats),
        ],
      ),
    );
  }
}
