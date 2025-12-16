import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/default_book_format_cubit.dart';
import 'package:leafy/logic/cubit/display_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/logic/cubit/selected_book_cubit.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/books/books_screen.dart';
import 'package:leafy/ui/home/widgets/add_book_sheet.dart';
import 'package:leafy/ui/home/widgets/home_navigation_bar.dart';
import 'package:leafy/ui/home/widgets/multi_select_fab.dart';
import 'package:leafy/ui/home/widgets/sort_bottom_sheet.dart';
import 'package:leafy/ui/statistics/statistics_screen.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  late List<String> menuOptions;
  late double appBarHeight;

  void _generateMenuOptions() {
    menuOptions = [];

    if (currentPageIndex == 0) {
      menuOptions.add(LocaleKeys.sort_filter.tr());
      menuOptions.add(LocaleKeys.display.tr());
    }
    menuOptions.add(LocaleKeys.settings.tr());
  }

  // BUG: Luồng điều hướng bị trùng route search
  // Steps:
  // 1. Từ Home → Search OL
  // 2. Add Book → mở Book Editor → Save
  // 3. Điều hướng về Book Screen
  // 4. Nhấn Back → quay về Home
  // 5. Từ Home nhấn icon Search
  //
  // Expected:
  // Stack chỉ có 1 route search
  //
  // Actual:
  // Navigation stack bị dư route:
  // Index 0: /home
  // Index 1: /search-ol
  // Index 2: /search
  void __goToSearchInUserBooksPage() {
    context.push(Routes.search);
  }

  @override
  void initState() {
    super.initState();
    appBarHeight = AppBar().preferredSize.height;
  }

  @override
  Widget build(BuildContext context) {
    _generateMenuOptions();

    return BlocBuilder<SelectedBooksCubit, List<int>>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              return;
            }

            if (currentPageIndex == 0) {
              // context.read<SelectedBooksCubit>().resetSelection();
            } else {
              setState(() {
                currentPageIndex = 0;
              });
            }
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: true,
            appBar: state.isNotEmpty
                ? _buildMultiSelectAppBar(context, state)
                : _buildAppBar(context),
            floatingActionButton: _buildFAB(context, state),
            body: _buildScaffoldBody(),
            bottomNavigationBar: HomeNavigationBar(
              currentIndex: currentPageIndex,
              onTap: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildScaffoldBody() {
    return currentPageIndex == 0
        ? BooksScreen()
        : currentPageIndex == 1
        ? const StatisticsScreen()
        : const SizedBox.shrink();
  }

  AppBar _buildMultiSelectAppBar(
    BuildContext context,
    List<int> multiSelectList,
  ) {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.xmark, size: 18),
            onPressed: () {
              context.read<SelectedBooksCubit>().resetSelection();
            },
          ),
          Text(
            '${LocaleKeys.selected.tr()} ${multiSelectList.length}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //TODO: change to SliverAppBar if can
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: const Row(
        children: [
          Text(
            Constants.appName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        currentPageIndex == 0
            ? IconButton(
                onPressed: __goToSearchInUserBooksPage,
                icon: const Icon(Icons.search),
              )
            : const SizedBox(),
        currentPageIndex == 0
            ? BlocBuilder<DisplayCubit, DisplayState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<DisplayCubit>().setDisplayType(
                        state.type == DisplayType.list
                            ? DisplayType.grid
                            : DisplayType.list,
                      );
                    },
                    icon: Icon(
                      state.type == DisplayType.grid
                          ? Icons.grid_view
                          : Icons.list,
                    ),
                  );
                },
              )
            : const SizedBox(),
        //TODO: add prefix icon
        PopupMenuButton<String>(
          onSelected: (_) {},
          itemBuilder: (_) {
            return menuOptions.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
                onTap: () => _invokeMenuOption(choice),
              );
            }).toList();
          },
        ),
      ],
    );

    return Platform.isAndroid
        ? appBar
        : PreferredSize(
            preferredSize: Size(double.infinity, appBarHeight),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: appBar,
              ),
            ),
          );
  }

  Widget _buildFAB(BuildContext context, List<int> multiSelectList) {
    return currentPageIndex != 0
        ? const SizedBox.shrink()
        : multiSelectList.isNotEmpty
        ? MultiSelectFAB()
        : FloatingActionButton(
            onPressed: _onFabPressed,
            child: const Icon(Symbols.add),
          );
  }

  void _onFabPressed() {
    if (Platform.isIOS) {
      showCupertinoModalBottomSheet(
        context: context,
        expand: false,
        builder: (_) {
          return AddBookSheet(
            addManually: _addBookManually,
            searchInGutendex: _searchInGutendexLibrary,
            searchInOpenLibrary: _searchInOpenLibrary,
            scanBarcode: _scanBarcode,
          );
        },
      );
    } else if (Platform.isAndroid) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return AddBookSheet(
            addManually: _addBookManually,
            searchInGutendex: _searchInGutendexLibrary,
            searchInOpenLibrary: _searchInOpenLibrary,
            scanBarcode: _scanBarcode,
          );
        },
      );
    }
  }

  void _setEmptyBookForEditorScreen() {
    final status = BookStatus.finished;
    final bookFormat = context.read<DefaultBookFormatCubit>().state;

    context.read<EditBookCubit>().setBook(
      Book.empty(status: status, bookFormat: bookFormat),
    );
  }

  void _addBookManually() {
    _setEmptyBookForEditorScreen();
    context.push(
      Routes.bookEditor,
      extra: {'appBarTitle': 'Add New Book', 'initialBook': Book.empty()},
    );
  }

  void _searchInOpenLibrary() {
    _setEmptyBookForEditorScreen();
    context.push(Routes.searchOl);
  }

  void _searchInGutendexLibrary() {
    _setEmptyBookForEditorScreen();
    context.push(Routes.searchGutendex);
  }

  void _scanBarcode() {}

  void _openSortFilterSheet() {
    FocusManager.instance.primaryFocus?.unfocus();

    showModalBottomSheet(
      context: context,
      builder: (context) => SortBottomSheet(),
    );
  }

  Future<void> _invokeMenuOption(String choice) async {
    await Future.delayed(const Duration(milliseconds: 0));

    if (!mounted) return;

    if (currentPageIndex == 0) {
      if (choice == menuOptions[0]) {
        _openSortFilterSheet();
      } else if (choice == menuOptions[1]) {
        // goToDisplayScreen();
        //TODO: show bottom sheet instead of goToDisplayScreen
      } else if (choice == menuOptions[2]) {
        goToSettingsScreen();
      }
    } else if (currentPageIndex == 1) {
      if (choice == menuOptions[0]) {
        goToSettingsScreen();
      }
    }
  }

  void goToSettingsScreen() {
    FocusManager.instance.primaryFocus?.unfocus();

    context.push(Routes.setting);
  }
}
