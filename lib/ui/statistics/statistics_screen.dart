import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/logic/bloc/challenge_bloc/challenge_bloc.dart';
import 'package:leafy/logic/bloc/stats_bloc/stats_bloc.dart';
import 'package:leafy/main.dart';
import 'package:leafy/ui/statistics/widgets/statistics.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  void _setChallenge(int books, int pages, int year) {
    BlocProvider.of<ChallengeBloc>(context).add(
      ChangeChallengeEvent(
        books: (books == 0) ? null : books,
        pages: (pages == 0) ? null : pages,
        year: year,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: bookCubit.allBooks,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return BlocProvider(
              create: (context) =>
                 getIt<StatsBloc>()..add(StatsLoad(asyncSnapshot.data!)),
              child: SelectableRegion(
                selectionControls: materialTextSelectionControls,
                focusNode: _focusNode,
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
                        setChallenge: _setChallenge,
                      ),
                      StatsError() => Center(child: Text(state.msg)),
                    };
                  },
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
