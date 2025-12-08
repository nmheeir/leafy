import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:leafy/logic/cubit/book_tab_index_cubit.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/logic/cubit/default_book_format_cubit.dart';
import 'package:leafy/logic/cubit/default_book_tag_cubit.dart';
import 'package:leafy/logic/cubit/display_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cover_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/logic/cubit/selected_book_cubit.dart';
import 'package:leafy/router/router.dart';
import 'package:path_provider/path_provider.dart';

late Directory appDocumentsDirectory;
late Directory appTempDirectory;
late BookCubit bookCubit;
late DateFormat dateFormat;
late GlobalKey<ScaffoldMessengerState> snackbarKey;
final _router = router();

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
      BlocProvider(create: (context) => DefaultBookTagCubit()),
      BlocProvider(create: (context) => BookTabIndexCubit()),

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
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SetThemeState) {
            return LeafyApp(themeState: state);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class LeafyApp extends StatefulWidget {
  const LeafyApp({super.key, required this.themeState});

  final SetThemeState themeState;

  @override
  State<LeafyApp> createState() => _LeafyAppState();
}

class _LeafyAppState extends State<LeafyApp> {
  @override
  Widget build(BuildContext context) {
    _initializeDateFormat();

    final localizationsDelegates = [...context.localizationDelegates];

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        final themeMode = widget.themeState.themeMode;

        final lightColorScheme = ColorScheme.fromSeed(
          seedColor: widget.themeState.useMaterialYou && lightDynamic != null
              ? lightDynamic.primary
              : widget.themeState.primaryColor,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
          brightness: Brightness.light,
        );

        final lightTheme =
            ThemeData(
              colorScheme: lightColorScheme,
              brightness: Brightness.light,
              fontFamily: widget.themeState.fontFamily,
            ).copyWith(
              scaffoldBackgroundColor: lightColorScheme.surfaceContainerLowest,
              appBarTheme: AppBarTheme(
                backgroundColor: lightColorScheme.surfaceContainerLowest,
              ),
              navigationBarTheme: NavigationBarThemeData(
                backgroundColor: lightColorScheme.surfaceContainerLow,
              ),
            );

        final darkColorScheme = ColorScheme.fromSeed(
          seedColor: widget.themeState.useMaterialYou && darkDynamic != null
              ? darkDynamic.primary
              : widget.themeState.primaryColor,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
          brightness: Brightness.dark,
          surface: widget.themeState.amoledDark ? Colors.black : null,
          surfaceContainer: widget.themeState.amoledDark ? Colors.black : null,
        );

        final darkTheme =
            ThemeData(
              colorScheme: darkColorScheme,
              brightness: Brightness.dark,
              fontFamily: widget.themeState.fontFamily,
            ).copyWith(
              scaffoldBackgroundColor: widget.themeState.amoledDark
                  ? Colors.black
                  : darkColorScheme.surfaceContainerLowest,
              appBarTheme: AppBarTheme(
                backgroundColor: widget.themeState.amoledDark
                    ? Colors.black
                    : darkColorScheme.surfaceContainerLowest,
              ),
              navigationBarTheme: NavigationBarThemeData(
                backgroundColor: widget.themeState.amoledDark
                    ? Colors.black
                    : darkColorScheme.surfaceContainerLow,
              ),
            );

        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            statusBarBrightness: themeMode == ThemeMode.system
                ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark
                : themeMode == ThemeMode.dark
                ? Brightness.light
                : Brightness.dark,
            statusBarIconBrightness: themeMode == ThemeMode.system
                ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark
                : themeMode == ThemeMode.dark
                ? Brightness.light
                : Brightness.dark,
            systemNavigationBarIconBrightness: themeMode == ThemeMode.system
                ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark
                : themeMode == ThemeMode.dark
                ? Brightness.light
                : Brightness.dark,
          ),
          child: MaterialApp.router(
            routerConfig: _router,
            title: Constants.appName,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            scaffoldMessengerKey: snackbarKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        );
      },
    );
  }
}

Future _initializeDateFormat() async {
  await initializeDateFormatting();
  dateFormat = DateFormat.yMMMd();
}
