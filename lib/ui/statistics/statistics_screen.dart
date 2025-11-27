import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/bloc/stats_bloc/stats_bloc.dart';
import 'package:leafy/ui/statistics/widgets/statistics.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatsBloc()..add(StatsLoad(List.empty())),
      child: SelectableRegion(
        selectionControls: materialTextSelectionControls,
        child: BlocBuilder<StatsBloc, StatsState>(
          builder: (context, state) {
            return switch (state) {
              StatsLoading() => Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: context.colorScheme.primary,
                  size: 42,
                ),
              ),
              StatsLoaded() => Statistics(
                state: state,
                setChallenge: (books, pages, year) {},
              ),
              StatsError() => Center(child: Text(state.msg)),
            };
          },
        ),
      ),
    );
  }
}
