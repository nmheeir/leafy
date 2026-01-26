import 'package:diacritic/diacritic.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_bloc.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_event.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_state.dart';
import 'package:leafy/logic/cubit/book_list_order_cubit.dart';
import 'package:leafy/logic/cubit/book_tab_index_cubit.dart';
import 'package:leafy/logic/cubit/library/library_cubit.dart';
import 'package:leafy/ui/home/widgets/tag_filter_chip.dart';
import 'package:leafy/ui/home/widgets/year_filter_chip.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => const SortBottomSheet(),
    );
  }

  @override
  State<SortBottomSheet> createState() => SortBottomSheetState();
}

class SortBottomSheetState extends State<SortBottomSheet> {
  Bloc _getBlocProvider(BookStatus bookStatus) {
    return switch (bookStatus) {
      BookStatus.finished => BlocProvider.of<SortFinishedBooksBloc>(context),
      BookStatus.inProgress => BlocProvider.of<SortInProgressBooksBloc>(
        context,
      ),
      BookStatus.forLater => BlocProvider.of<SortForLaterBooksBloc>(context),
      BookStatus.unfinished => BlocProvider.of<SortUnfinishedBooksBloc>(
        context,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<BookListsOrderCubit, List<BookStatus>>(
            builder: (context, bookStatus) {
              return BlocBuilder<BookTabIndexCubit, int>(
                builder: (context, tabIndex) {
                  switch (bookStatus[tabIndex]) {
                    case BookStatus.finished:
                      return BlocBuilder<SortFinishedBooksBloc, SortState>(
                        builder: (context, state) =>
                            _buildBody(BookStatus.finished, state),
                      );
                    case BookStatus.inProgress:
                      return BlocBuilder<SortInProgressBooksBloc, SortState>(
                        builder: (context, state) =>
                            _buildBody(BookStatus.inProgress, state),
                      );
                    case BookStatus.forLater:
                      return BlocBuilder<SortForLaterBooksBloc, SortState>(
                        builder: (context, state) =>
                            _buildBody(BookStatus.forLater, state),
                      );
                    case BookStatus.unfinished:
                      return BlocBuilder<SortUnfinishedBooksBloc, SortState>(
                        builder: (context, state) =>
                            _buildBody(BookStatus.unfinished, state),
                      );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _getOrderButton(BookStatus bookStatus, SortState sortState) {
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
        icon: sortState.isAsc
            ? const Icon(Icons.arrow_upward, size: 18)
            : const Icon(Icons.arrow_downward, size: 18),
        onPressed: () {
          _getBlocProvider(bookStatus).add(const ToggleOrderEvent());
        },
      ),
    );
  }

  void _onYearChipPressed({
    required BookStatus bookStatus,
    required bool selected,
    required List<String> selectedYearsList,
    required int dbYear,
  }) {
    if (selectedYearsList.isNotEmpty && selectedYearsList[0] == '') {
      selectedYearsList.removeAt(0);
    }

    if (selected) {
      selectedYearsList.add(dbYear.toString());
    } else {
      bool deleteYear = true;
      while (deleteYear) {
        deleteYear = selectedYearsList.remove(dbYear.toString());
      }
    }

    _getBlocProvider(bookStatus).add(
      ChangeYearsEvent(
        selectedYearsList.isEmpty ? null : selectedYearsList.join('|||||'),
      ),
    );
  }

  void _onTagChipPressed({
    required BookStatus bookStatus,
    required bool selected,
    required List<String> selectedTagsList,
    required String dbTag,
  }) {
    if (selectedTagsList.isNotEmpty && selectedTagsList[0] == '') {
      selectedTagsList.removeAt(0);
    }

    if (selected) {
      selectedTagsList.add(dbTag);
    } else {
      bool deleteYear = true;
      while (deleteYear) {
        deleteYear = selectedTagsList.remove(dbTag);
      }
    }

    _getBlocProvider(bookStatus).add(
      ChangeTagsEvent(
        selectedTagsList.isEmpty ? null : selectedTagsList.join('|||||'),
      ),
    );
  }

  List<Widget> _buildYearChips(
    BookStatus bookStatus,
    List<int> dbYears,
    String? selectedYears,
  ) {
    final chips = List<Widget>.empty(growable: true);
    final inactiveChips = List<Widget>.empty(growable: true);

    List<String> selectedYearsList = selectedYears != null
        ? selectedYears.split('|||||')
        : List<String>.empty(growable: true);

    final uniqueDbYears = List<int>.empty(growable: true);

    for (var dbYear in dbYears) {
      if (!uniqueDbYears.contains(dbYear)) {
        uniqueDbYears.add(dbYear);
      }
    }

    for (var selectedYear in selectedYearsList) {
      if (!uniqueDbYears.contains(int.parse(selectedYear))) {
        uniqueDbYears.add(int.parse(selectedYear));
      }
    }

    for (var dbYear in uniqueDbYears) {
      bool isSelected = selectedYearsList.contains(dbYear.toString());
      YearFilterChip chip = YearFilterChip(
        dbYear: dbYear,
        selected: isSelected,
        onYearChipPressed: (bool selected) => _onYearChipPressed(
          bookStatus: bookStatus,
          dbYear: dbYear,
          selected: selected,
          selectedYearsList: selectedYearsList,
        ),
      );

      if (isSelected) {
        chips.add(chip);
      } else {
        inactiveChips.add(chip);
      }
    }

    chips.addAll(inactiveChips);

    // Last chip is to select all/none years
    chips.add(
      YearFilterChip(
        dbYear: null,
        selected: selectedYears == dbYears.join('|||||'),
        onYearChipPressed: (_) => _getBlocProvider(bookStatus).add(
          ChangeYearsEvent(
            selectedYears == dbYears.join('|||||')
                ? null
                : dbYears.join('|||||'),
          ),
        ),
      ),
    );

    return chips;
  }

  List<Widget> _buildTagChips(
    BookStatus bookStatus,
    List<String> dbTags,
    String? selectedTags,
  ) {
    final chips = List<Widget>.empty(growable: true);
    final inactiveChips = List<Widget>.empty(growable: true);

    late List<String> selectedTagsList;

    if (selectedTags != null) {
      selectedTagsList = selectedTags.split('|||||');
    } else {
      selectedTagsList = List<String>.empty(growable: true);
    }

    selectedTagsList.sort(
      (a, b) => removeDiacritics(
        a.toLowerCase(),
      ).compareTo(removeDiacritics(b.toLowerCase())),
    );

    for (var selectedTag in selectedTagsList) {
      if (!dbTags.contains(selectedTag)) {
        dbTags.add(selectedTag);
      }
    }

    dbTags.sort(
      (a, b) => removeDiacritics(
        a.toLowerCase(),
      ).compareTo(removeDiacritics(b.toLowerCase())),
    );

    for (var dbTag in dbTags) {
      bool isSelected = selectedTagsList.contains(dbTag.toString());
      TagFilterChip chip = TagFilterChip(
        tag: dbTag,
        selected: isSelected,
        onTagChipPressed: (bool selected) {
          _onTagChipPressed(
            bookStatus: bookStatus,
            dbTag: dbTag,
            selected: selected,
            selectedTagsList: selectedTagsList,
          );
        },
      );

      if (isSelected) {
        chips.add(chip);
      } else {
        inactiveChips.add(chip);
      }
    }

    chips.addAll(inactiveChips);

    // Last chip is to select all/none tags
    chips.add(
      TagFilterChip(
        tag: null,
        selected: selectedTags == dbTags.join('|||||'),
        onTagChipPressed: (_) => _getBlocProvider(bookStatus).add(
          ChangeTagsEvent(
            selectedTags == dbTags.join('|||||') ? null : dbTags.join('|||||'),
          ),
        ),
      ),
    );

    return chips;
  }

  Widget _buildBody(BookStatus bookStatus, SortState sortState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(LocaleKeys.sort_by.tr(), style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        _buildSortDropdown(bookStatus, sortState),
        const SizedBox(height: 5),
        if (bookStatus == BookStatus.finished)
          _buildOnlyFavoriteSwitch(bookStatus, sortState.onlyFavorite),
        const SizedBox(height: 5),
        Text(
          LocaleKeys.filter_by_book_format.tr(),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        _buildBookTypeFilter(bookStatus, sortState.bookType),
        if (bookStatus == BookStatus.finished)
          _buildFilterByFinishYears(bookStatus, sortState.years),
        _buildFilterByTags(bookStatus, sortState.tags),
        _buildFilterTagsAsAnd(bookStatus, sortState.filterTagsAsAnd),
        _buildFilterOutTags(bookStatus, sortState.filterOutTags),
      ],
    );
  }

  Row _buildFilterOutTags(BookStatus bookStatus, bool filterOutTags) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _getBlocProvider(
              bookStatus,
            ).add(ChangeFilterOutTags(!filterOutTags)),
            child: _buildBooksExceptTags(bookStatus, filterOutTags),
          ),
        ),
      ],
    );
  }

  Row _buildFilterTagsAsAnd(BookStatus bookStatus, bool filterTagsAsAnd) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _getBlocProvider(
              bookStatus,
            ).add(ChangeFilterTagsAsAnd(!filterTagsAsAnd)),
            child: _buildOnlyBooksWithAllTags(bookStatus, filterTagsAsAnd),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterByTags(
    BookStatus bookStatus,
    String? currentSelectedTags,
  ) {
    return BlocSelector<LibraryCubit, LibraryState, List<String>>(
      selector: (state) => state.allTags,
      builder: (context, allTagsInLibrary) {
        if (allTagsInLibrary.isEmpty && currentSelectedTags == null) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              LocaleKeys.filter_by_tags.tr(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 2.5,
                        ),
                        child: Row(
                          children: _buildTagChips(
                            bookStatus,
                            allTagsInLibrary,
                            currentSelectedTags,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilterByFinishYears(BookStatus bookStatus, String? years) {
    return BlocSelector<LibraryCubit, LibraryState, List<int>>(
      selector: (state) => state.finishedYears,
      builder: (context, finishedYears) {
        if (finishedYears.isEmpty && years == null) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              LocaleKeys.filter_by_finish_year.tr(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(cornerRadius),
                      // border: Border.all(color: dividerColor),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 2.5,
                        ),
                        child: Row(
                          children: _buildYearChips(
                            bookStatus,
                            finishedYears,
                            years,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Row _buildOnlyFavoriteSwitch(BookStatus bookStatus, bool onlyFavourite) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _getBlocProvider(
              bookStatus,
            ).add(ChangeOnlyFavouriteEvent(!onlyFavourite)),
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(cornerRadius),
                // border: Border.all(color: dividerColor),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                    child: Switch.adaptive(
                      value: onlyFavourite,
                      onChanged: (value) => _getBlocProvider(
                        bookStatus,
                      ).add(ChangeOnlyFavouriteEvent(value)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    LocaleKeys.only_favourite.tr(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildSortDropdown(BookStatus bookStatus, SortState sortState) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<SortType>(
              isExpanded: true,
              buttonStyleData: ButtonStyleData(
                height: 42,
                decoration: BoxDecoration(
                  // border: Border.all(color: dividerColor),
                  color: context.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
              ),
              items: _getValidSortOptions(bookStatus)
                  .map(
                    (item) => DropdownMenuItem<SortType>(
                      value: item,
                      child: Text(
                        _getSortDropdownText(item),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              value: sortState.sortType,
              onChanged: (value) => _getBlocProvider(
                bookStatus,
              ).add(ChangeSortTypeEvent(value ?? SortType.byTitle)),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(cornerRadius),
            // border: Border.all(color: dividerColor),
          ),
          child: _getOrderButton(bookStatus, sortState),
        ),
      ],
    );
  }

  Widget _buildBookTypeFilter(BookStatus bookStatus, BookFormat? bookFormat) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<BookFormat?>(
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          height: 42,
          decoration: BoxDecoration(
            // border: Border.all(color: dividerColor),
            color: context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
        ),
        items: [
          DropdownMenuItem<BookFormat?>(
            value: null,
            child: Text(
              _getBookTypeDropdownText(null),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ...BookFormat.values.map(
            (item) => DropdownMenuItem<BookFormat>(
              value: item,
              child: Text(
                _getBookTypeDropdownText(item),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
        value: bookFormat,
        onChanged: (value) =>
            _getBlocProvider(bookStatus).add(ChangeBookTypeEvent(value)),
      ),
    );
  }

  Widget _buildOnlyBooksWithAllTags(
    BookStatus bookStatus,
    bool filterTagsAsAnd,
  ) {
    return BlocSelector<LibraryCubit, LibraryState, List<String>>(
      selector: (state) => state.allTags,
      builder: (context, state) {
        if (state.isEmpty) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(cornerRadius),
              // border: Border.all(color: dividerColor),
            ),
            child: Row(
              children: [
                Switch.adaptive(
                  value: filterTagsAsAnd,
                  onChanged: (value) => _getBlocProvider(
                    bookStatus,
                  ).add(ChangeFilterTagsAsAnd(value)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    LocaleKeys.only_books_with_all_tags.tr(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBooksExceptTags(BookStatus bookStatus, bool filterOutTags) {
    return BlocSelector<LibraryCubit, LibraryState, List<String>>(
      selector: (state) => state.allTags,
      builder: (context, allTags) {
        if (allTags.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(cornerRadius),
              // border: Border.all(color: dividerColor),
            ),
            child: Row(
              children: [
                Switch.adaptive(
                  value: filterOutTags,
                  onChanged: (value) => _getBlocProvider(
                    bookStatus,
                  ).add(ChangeFilterOutTags(value)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    LocaleKeys.filter_out_selected_tags.tr(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<SortType> _getValidSortOptions(BookStatus bookStatus) {
  switch (bookStatus) {
    case BookStatus.finished:
      return [
        SortType.byTitle,
        SortType.byAuthor,
        SortType.byRating,
        SortType.byPages,
        SortType.byStartDate,
        SortType.byFinishDate,
        SortType.byPublicationYear,
        SortType.byDateAdded,
        SortType.byDateModified,
      ];
    case BookStatus.inProgress:
      return [
        SortType.byTitle,
        SortType.byAuthor,
        SortType.byPages,
        SortType.byStartDate,
        SortType.byPublicationYear,
        SortType.byDateAdded,
        SortType.byDateModified,
      ];
    case BookStatus.forLater:
      return [
        SortType.byTitle,
        SortType.byAuthor,
        SortType.byPages,
        SortType.byPublicationYear,
        SortType.byDateAdded,
        SortType.byDateModified,
      ];
    case BookStatus.unfinished:
      return [
        SortType.byTitle,
        SortType.byAuthor,
        SortType.byPages,
        SortType.byStartDate,
        SortType.byPublicationYear,
        SortType.byDateAdded,
        SortType.byDateModified,
      ];
  }
}

String _getSortDropdownText(SortType sortType) {
  switch (sortType) {
    case SortType.byTitle:
      return LocaleKeys.title.tr();
    case SortType.byAuthor:
      return LocaleKeys.author.tr();
    case SortType.byRating:
      return LocaleKeys.rating.tr();
    case SortType.byPages:
      return LocaleKeys.pages_uppercase.tr();
    case SortType.byStartDate:
      return LocaleKeys.start_date.tr();
    case SortType.byFinishDate:
      return LocaleKeys.finish_date.tr();
    case SortType.byPublicationYear:
      return LocaleKeys.enter_publication_year.tr();
    case SortType.byDateAdded:
      return LocaleKeys.date_added.tr();
    case SortType.byDateModified:
      return LocaleKeys.date_modified.tr();
  }
}

String _getBookTypeDropdownText(BookFormat? bookFormat) {
  if (bookFormat == null) return LocaleKeys.book_format_all.tr();
  switch (bookFormat) {
    case BookFormat.paperback:
      return LocaleKeys.book_format_paperback_plural.tr();
    case BookFormat.hardcover:
      return LocaleKeys.book_format_hardcover_plural.tr();
    case BookFormat.ebook:
      return LocaleKeys.book_format_ebook_plural.tr();
    case BookFormat.audiobook:
      return LocaleKeys.book_format_audiobook_plural.tr();
  }
}
