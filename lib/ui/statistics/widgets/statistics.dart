import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/data/models/yearly_challenge.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/challenge_bloc/challenge_bloc.dart';
import 'package:leafy/logic/bloc/stats_bloc/stats_bloc.dart';
import 'package:leafy/ui/statistics/widgets/book_by_status.dart';
import 'package:leafy/ui/statistics/widgets/read_stats.dart';
import 'package:leafy/ui/statistics/widgets/read_stats_by_month.dart';
import 'package:leafy/ui/statistics/widgets/reading_challenge.dart';
import 'package:leafy/ui/statistics/widgets/set_challenge_box.dart';

class Statistics extends StatelessWidget {
  final StatsLoaded state;
  final void Function(int books, int pages, int year) setChallenge;

  const Statistics({
    super.key,
    required this.state,
    required this.setChallenge,
  });

  @override
  Widget build(BuildContext context) {
    final result = state.result;
    return DefaultTabController(
      length: result.years.length + 1,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: _buildYearsTabBars(context, result.years),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(children: _buildYearsTabBarViews(context, state)),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildYearsTabBars(BuildContext context, List<int> years) {
    final tabs = List<Widget>.empty(growable: true);

    tabs.add(Tab(child: Text(LocaleKeys.all_years.tr())));

    for (var year in years) {
      tabs.add(Tab(child: Text('$year')));
    }

    return tabs;
  }

  List<Widget> _buildYearsTabBarViews(BuildContext context, StatsLoaded state) {
    final tabs = List<Widget>.empty(growable: true);

    tabs.add(
      Tab(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildBooksChallenge(context, state, null),
                _buildAllBooksStat(context),
                _buildFinishedBooksByMonth(context, state, null),
                _buildFinishedPagesByMonth(context, state, null),
                _buildNumberOfFinishedBooks(context, state, null),
                _buildNumberOfFinishedPages(context, state, null),
                _buildAverageRating(context, state, null),
                _buildAveragePages(context, state, null),
                _buildAverageReadingTime(context, state, null),
                _buildLongestBook(context, state, null),
                _buildShortestBook(context, state, null),
                _buildFastestRead(context, state, null),
                _buildSlowestRead(context, state, null),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );

    for (var year in state.result.years) {
      tabs.add(
        Tab(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildBooksChallenge(context, state, year),
                        _buildFinishedBooksByMonth(context, state, year),
                        _buildFinishedPagesByMonth(context, state, year),
                        _buildNumberOfFinishedBooks(context, state, year),
                        _buildNumberOfFinishedPages(context, state, year),
                        _buildAverageRating(context, state, year),
                        _buildAveragePages(context, state, year),
                        _buildAverageReadingTime(context, state, year),
                        _buildLongestBook(context, state, year),
                        _buildShortestBook(context, state, year),
                        _buildFastestRead(context, state, year),
                        _buildSlowestRead(context, state, year),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return tabs;
  }

  BlocBuilder<dynamic, dynamic> _buildBooksChallenge(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    return BlocBuilder<ChallengeBloc, ChallengeState>(
      builder: (context, challengeState) {
        if (challengeState is SetChallengeState &&
            challengeState.yearlyChallenges != null) {
          final yearlyChallenges = List<YearlyChallenge>.empty(growable: true);

          final jsons = challengeState.yearlyChallenges!.split('|||||');
          for (var json in jsons) {
            final decodedJson = jsonDecode(json);
            final yearlyChallenge = YearlyChallenge.fromJSON(decodedJson);
            yearlyChallenges.add(yearlyChallenge);
          }

          final selectedTarget = yearlyChallenges.where((element) {
            return (year == null)
                ? element.year == DateTime.now().year
                : element.year == year;
          });

          final selectedValue = state.result.finishedBooksByMonthAllTypes.where(
            (element) {
              return (year == null)
                  ? element.year == DateTime.now().year
                  : element.year == year;
            },
          );

          final value = selectedValue.isNotEmpty
              ? selectedValue.first.values.reduce((a, b) => a + b)
              : 0;

          if (selectedTarget.isEmpty || selectedTarget.first.books == null) {
            return (year == null)
                ? SetChallengeBox(
                    setChallenge: setChallenge,
                    year: year ?? DateTime.now().year,
                  )
                : const SizedBox();
          } else {
            return ReadingChallenge(
              title: LocaleKeys.books_challenge.tr(),
              value: value,
              target: selectedTarget.first.books ?? 0,
              setChallenge: setChallenge,
              booksTarget: selectedTarget.first.books,
              pagesTarget: selectedTarget.first.pages,
              year: year ?? DateTime.now().year,
            );
          }
        } else {
          return (year == null)
              ? SetChallengeBox(
                  setChallenge: setChallenge,
                  year: year ?? DateTime.now().year,
                )
              : const SizedBox();
        }
      },
    );
  }

  Widget _buildAllBooksStat(BuildContext context) {
    return BooksByStatus(
      title: LocaleKeys.all_books_by_status.tr(),
      list: [
        state.result.finishedBooks.length,
        state.result.inProgressBooks.length,
        state.result.forLaterBooks.length,
        state.result.unfinishedBooks.length,
      ],
    );
  }

  Widget _buildFinishedBooksByMonth(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    final emptyList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    List<int> finishedBooksByMonthPaperbackBooks = emptyList;
    List<int> finishedBooksByMonthHardcoverBooks = emptyList;
    List<int> finishedBooksByMonthEbooks = emptyList;
    List<int> finishedBooksByMonthAudiobooks = emptyList;

    for (var bookReadStat in state.result.finishedBooksByMonthPaperbackBooks) {
      if (bookReadStat.year == year) {
        finishedBooksByMonthPaperbackBooks = bookReadStat.values;
      }
    }

    for (var bookReadStat in state.result.finishedBooksByMonthHardcoverBooks) {
      if (bookReadStat.year == year) {
        finishedBooksByMonthHardcoverBooks = bookReadStat.values;
      }
    }

    for (var bookReadStat in state.result.finishedBooksByMonthEbooks) {
      if (bookReadStat.year == year) {
        finishedBooksByMonthEbooks = bookReadStat.values;
      }
    }

    for (var bookReadStat in state.result.finishedBooksByMonthAudiobooks) {
      if (bookReadStat.year == year) {
        finishedBooksByMonthAudiobooks = bookReadStat.values;
      }
    }

    if (state.result.finishedBooksByMonthAllTypes.isEmpty) {
      return const SizedBox();
    }

    return ReadStatsByMonth(
      title: LocaleKeys.finished_books_by_month.tr(),
      listPaperbackBooks: finishedBooksByMonthPaperbackBooks,
      listHardcoverBooks: finishedBooksByMonthHardcoverBooks,
      listEbooks: finishedBooksByMonthEbooks,
      listAudiobooks: finishedBooksByMonthAudiobooks,
      theme: Theme.of(context),
    );
  }

  Widget _buildFinishedPagesByMonth(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    final emptyList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    List<int> finishedPagesByMonthPaperbackBooks = emptyList;
    List<int> finishedPagesByMonthHardcoverBooks = emptyList;
    List<int> finishedPagesByMonthEbooks = emptyList;
    List<int> finishedPagesByMonthAudiobooks = emptyList;

    for (var bookReadStat in state.result.finishedPagesByMonthPaperbackBooks) {
      if (bookReadStat.year == year) {
        finishedPagesByMonthPaperbackBooks = bookReadStat.values;
      }
    }
    for (var bookReadStat in state.result.finishedPagesByMonthHardcoverBooks) {
      if (bookReadStat.year == year) {
        finishedPagesByMonthHardcoverBooks = bookReadStat.values;
      }
    }
    for (var bookReadStat in state.result.finishedPagesByMonthEbooks) {
      if (bookReadStat.year == year) {
        finishedPagesByMonthEbooks = bookReadStat.values;
      }
    }
    for (var bookReadStat in state.result.finishedPagesByMonthAudiobooks) {
      if (bookReadStat.year == year) {
        finishedPagesByMonthAudiobooks = bookReadStat.values;
      }
    }

    if (state.result.finishedPagesByMonthAllTypes.isEmpty) {
      return const SizedBox();
    }

    return ReadStatsByMonth(
      title: LocaleKeys.finished_pages_by_month.tr(),
      listPaperbackBooks: finishedPagesByMonthPaperbackBooks,
      listHardcoverBooks: finishedPagesByMonthHardcoverBooks,
      listEbooks: finishedPagesByMonthEbooks,
      listAudiobooks: finishedPagesByMonthAudiobooks,
      theme: Theme.of(context),
    );
  }

  Widget _buildNumberOfFinishedBooks(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    if (year == null) {
      return ReadStats(
        title: LocaleKeys.finished_books.tr(),
        value: state.result.finishedBooksAll.toString(),
      );
    }

    for (var bookReadStat in state.result.finishedBooksByMonthAllTypes) {
      if (bookReadStat.year == year) {
        return ReadStats(
          title: LocaleKeys.finished_books.tr(),
          value: bookReadStat.values.reduce((a, b) => a + b).toString(),
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildNumberOfFinishedPages(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    if (year == null) {
      return ReadStats(
        title: LocaleKeys.finished_pages.tr(),
        value: state.result.finishedPagesAll.toString(),
      );
    }

    for (var bookReadStat in state.result.finishedPagesByMonthAllTypes) {
      if (bookReadStat.year == year) {
        return ReadStats(
          title: LocaleKeys.finished_pages.tr(),
          value: bookReadStat.values.reduce((a, b) => a + b).toString(),
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildAverageRating(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    for (var bookYearlyStat in state.result.averageRating) {
      if (bookYearlyStat.year == year) {
        return ReadStats(
          title: LocaleKeys.average_rating.tr(),
          value: bookYearlyStat.value,
          iconData: Icons.star_rounded,
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildAveragePages(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    for (var bookYearlyStat in state.result.averagePages) {
      if (bookYearlyStat.year == year) {
        return ReadStats(
          title: LocaleKeys.average_pages.tr(),
          value: (bookYearlyStat.value != '')
              ? '${bookYearlyStat.value} ${LocaleKeys.pages_lowercase.tr()}'
              : '0',
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildAverageReadingTime(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    for (var bookYearlyStat in state.result.averageReadingTime) {
      if (bookYearlyStat.year == year) {
        return ReadStats(
          title: LocaleKeys.average_reading_time.tr(),
          value: (bookYearlyStat.value != '') ? bookYearlyStat.value : '0',
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildLongestBook(BuildContext context, StatsLoaded state, int? year) {
    for (var bookYearlyStat in state.result.longestBook) {
      if (bookYearlyStat.year == year) {
        return ReadStats(
          title: LocaleKeys.longest_book.tr(),
          value: bookYearlyStat.title.toString(),
          secondValue:
              '${bookYearlyStat.value} ${LocaleKeys.pages_lowercase.tr()}',
          book: bookYearlyStat.book,
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildShortestBook(
    BuildContext context,
    StatsLoaded state,
    int? year,
  ) {
    for (var bookYearlyStat in state.result.shortestBook) {
      if (bookYearlyStat.year == year) {
        return ReadStats(
          title: LocaleKeys.shortest_book.tr(),
          value: bookYearlyStat.title.toString(),
          secondValue: (bookYearlyStat.value != '')
              ? '${bookYearlyStat.value} ${LocaleKeys.pages_lowercase.tr()}'
              : '',
          book: bookYearlyStat.book,
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildFastestRead(BuildContext context, StatsLoaded state, int? year) {
    for (var bookYearlyStat in state.result.fastestBook) {
      if (bookYearlyStat.year == year) {
        return ReadStats(
          title: LocaleKeys.fastest_book.tr(),
          value: bookYearlyStat.title.toString(),
          secondValue: bookYearlyStat.value,
          book: bookYearlyStat.book,
        );
      }
    }

    return const SizedBox();
  }

  Widget _buildSlowestRead(BuildContext context, StatsLoaded state, int? year) {
    for (var bookYearlyStat in state.result.slowestBook) {
      if (bookYearlyStat.year == year) {
        return ReadStats(
          title: LocaleKeys.slowest_book.tr(),
          value: bookYearlyStat.title.toString(),
          secondValue: bookYearlyStat.value,
          book: bookYearlyStat.book,
        );
      }
    }

    return const SizedBox();
  }
}
