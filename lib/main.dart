import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/locale/locale.dart';
import 'package:leafy/logic/cubit/book_cubit.dart';
import 'package:leafy/router/router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/date_symbol_data_local.dart';

late Directory appDocumentsDirectory;
late BookCubit bookCubit;
late DateFormat dateFormat;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  appDocumentsDirectory = await getApplicationDocumentsDirectory();

  final localeCodes = supportedLocales.map((e) => e.locale).toList();

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

  @override
  Widget build(BuildContext context) {
    return LeafyApp();
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
