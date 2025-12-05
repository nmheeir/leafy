import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/locale/locale.dart';
import 'package:leafy/logic/bloc/open_lib_search/open_lib_search_bloc.dart';
import 'package:leafy/logic/bloc/rating_type/rating_type_bloc.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_bloc.dart';
import 'package:leafy/logic/bloc/theme/theme_bloc.dart';
import 'package:leafy/logic/cubit/book_cubit.dart';
import 'package:leafy/logic/cubit/book_list_order_cubit.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/logic/cubit/default_book_format_cubit.dart';
import 'package:leafy/logic/cubit/display_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/logic/cubit/selected_book_cubit.dart';
import 'package:leafy/router/router.dart';
import 'package:path_provider/path_provider.dart';

late Directory appDocumentsDirectory;
late Directory appTempDirectory;
late BookCubit bookCubit;
late DateFormat dateFormat;
late GlobalKey<ScaffoldMessengerState> snackbarKey;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  appDocumentsDirectory = await getApplicationDocumentsDirectory();
  appTempDirectory = await getTemporaryDirectory();

   snackbarKey = GlobalKey<ScaffoldMessengerState>();

  final localeCodes = supportedLocales.map((e) => e.locale).toList();

  bookCubit = BookCubit();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );

  runApp(
    EasyLocalization(
      supportedLocales: localeCodes,
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  dynamic _listOfBlocProviders(BuildContext context) {
    final bookProviders = [
      BlocProvider(create: (context) => EditBookCubit()),
      BlocProvider(create: (context) => BookCubit()),
      BlocProvider(create: (context) => CurrentBookCubit()),
      BlocProvider(create: (context) => EditBookCoverCubit()),
      BlocProvider(create: (context) => BookListsOrderCubit()),
      BlocProvider(create: (context) => DisplayCubit()),
      BlocProvider(create: (context) => SelectedBooksCubit()),
      BlocProvider(create: (context) => DefaultBookFormatCubit()),

      //Sort
      BlocProvider(create: (_) => SortFinishedBooksBloc()),
      BlocProvider(create: (_) => SortInProgressBooksBloc()),
      BlocProvider(create: (_) => SortForLaterBooksBloc()),
      BlocProvider(create: (_) => SortUnfinishedBooksBloc()),
      BlocProvider(create: (_) => RatingTypeBloc()),
      BlocProvider(create: (_) => ThemeBloc()),
      BlocProvider(create: (_) => OpenLibSearchBloc()),
    ];

    return [...bookProviders];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _listOfBlocProviders(context),
      child: LeafyApp(),
    );
  }
}

class LeafyApp extends StatefulWidget {
  const LeafyApp({super.key});

  @override
  State<LeafyApp> createState() => _LeafyAppState();
}

class _LeafyAppState extends State<LeafyApp> {
  @override
  Widget build(BuildContext context) {
    _initializeDateFormat();

    final localizationsDelegates = [...context.localizationDelegates];

    return MaterialApp.router(
      routerConfig: router(),
      title: Constants.appName,
      scaffoldMessengerKey: snackbarKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

Future _initializeDateFormat() async {
  await initializeDateFormatting();
  dateFormat = DateFormat.yMMMd();
}
