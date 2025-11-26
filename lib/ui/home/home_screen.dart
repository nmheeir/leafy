import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/books/books_screen.dart';
import 'package:leafy/ui/home/widgets/add_book_sheet.dart';
import 'package:leafy/ui/home/widgets/home_navigation_bar.dart';
import 'package:leafy/ui/home/widgets/multi_select_fab.dart';
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
        appBar: _buildAppBar(context),
        floatingActionButton: _buildFAB(context),
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
  }

  Widget _buildScaffoldBody() {
    return currentPageIndex == 0
        ? BooksScreen(
            bookListsOrder: BookStatus.values,
            onBookLongPress: (book) {},
            onBookTap: (book, heroTag) {},
          )
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
            icon: const Icon(Symbols.close, size: 18),
            onPressed: () {},
          ),
          Text(
            '${LocaleKeys.selected.tr()} ${multiSelectList.length}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

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

  Widget _buildFAB(
    BuildContext context, [
    List<int> multiSelectList = const [],
  ]) {
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
            searchInOpenLibrary: _searchInOpenLibrary,
            scanBarcode: _scanBarcode,
          );
        },
      );
    }
  }

  void _addBookManually() {
    context.push(
      Routes.bookEditor,
      extra: {'appBarTitle': 'Add New Book', 'initialBook': Book.empty()},
    );
  }

  void _searchInOpenLibrary() {}

  void _scanBarcode() {}

  Future<void> _invokeMenuOption(String choice) async {
    await Future.delayed(const Duration(milliseconds: 0));

    if (!mounted) return;

    if (currentPageIndex == 0) {
      if (choice == menuOptions[0]) {
        // openSortFilterSheet();
      } else if (choice == menuOptions[1]) {
        // goToDisplayScreen();
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
