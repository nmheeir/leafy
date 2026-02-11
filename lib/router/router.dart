import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/book/book_screen.dart';
import 'package:leafy/ui/home/home_screen.dart';
import 'package:leafy/ui/reading_history/reading_history_screen.dart';
import 'package:leafy/ui/search/search_screen.dart';
import 'package:leafy/ui/search_gtd/search_gtd_screen.dart';
import 'package:leafy/ui/search_ol/search_ol_screen.dart';
import 'package:leafy/ui/settings/screens/ai_settings_screen.dart';
import 'package:leafy/ui/settings/screens/setting_accent_color_screen.dart';
import 'package:leafy/ui/settings/screens/setting_appearance_screen.dart';
import 'package:leafy/ui/settings/screens/setting_backup_restore_screen.dart';
import 'package:leafy/ui/settings/screens/setting_default_book_tag_screen.dart';
import 'package:leafy/ui/settings/screens/setting_download_mission_cover_screen.dart';
import 'package:leafy/ui/settings/screens/setting_epub_reader_screen.dart';
import 'package:leafy/ui/settings/screens/setting_notification_screen.dart';
import 'package:leafy/ui/settings/screens/settings_book_list_order_screen.dart';
import 'package:leafy/ui/settings/settings_screen.dart';
import 'package:leafy/ui/trash_screen/trash_screen.dart';
import 'package:leafy/ui/welcome/welcome_screen.dart';
import 'package:leafy/core/services/intro_service.dart';
import 'package:leafy/di/injection.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  redirect: (context, state) {
    final introService = getIt<IntroService>();
    final isFirstTime = introService.isFirstTime;
    final isWelcomeRoute = state.fullPath == Routes.welcome;

    if (isFirstTime && !isWelcomeRoute) {
      return Routes.welcome;
    }

    if (!isFirstTime && isWelcomeRoute) {
      return null;
    }

    return null;
  },
  // observers: [getIt<HistoryObserver>()],
  routes: [
    GoRoute(path: Routes.welcome, builder: (context, state) => WelcomeScreen()),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '${Routes.book}/:id',
      builder: (context, state) {
        final idStr = state.pathParameters['id'];
        final id = int.tryParse(idStr ?? '') ?? 0;

        Book? book;
        String heroTag = 'book_hero_$id'; // Default logic if not passed

        if (state.extra is Book) {
          book = state.extra as Book;
        } else if (state.extra is Map<String, dynamic>) {
          final map = state.extra as Map<String, dynamic>;
          book = map['book'] as Book?;
          heroTag = map['heroTag'] as String? ?? heroTag;
        }

        return BookScreen(heroTag: heroTag, bookId: id, initialBook: book);
      },
    ),
    GoRoute(path: Routes.search, builder: (context, state) => SearchScreen()),
    GoRoute(
      path: Routes.setting,
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(path: Routes.trash, builder: (context, state) => TrashScreen()),
    GoRoute(
      path: Routes.settingBackupRestore,
      builder: (context, state) => SettingBackupRestoreScreen(),
    ),
    GoRoute(
      path: Routes.settingBookListOrder,
      builder: (context, state) => SettingBookListOrderScreen(),
    ),
    GoRoute(
      path: Routes.settingAppearance,
      builder: (context, state) => SettingAppearanceScreen(),
    ),
    GoRoute(
      path: Routes.settingDownLoadMissingCover,
      builder: (context, state) => SettingDownloadMissionCoverScreen(),
    ),
    GoRoute(
      path: Routes.settingAccentColor,
      builder: (context, state) => SettingAccentColorScreen(),
    ),
    GoRoute(
      path: Routes.settingEpubReader,
      builder: (context, state) => SettingEpubReaderScreen(),
    ),
    GoRoute(
      path: Routes.searchOl,
      builder: (context, state) {
        // final status = state.extra as BookStatus? ?? BookStatus.finished;
        return SearchOLScreen();
      },
    ),
    GoRoute(
      path: Routes.settingDefautlBookTag,
      builder: (context, state) => SettingDefaultBookTagScreen(),
    ),
    GoRoute(
      path: Routes.searchGutendex,
      builder: (context, state) => SearchGtdScreen(),
    ),
    GoRoute(
      path: Routes.settingAiApi,
      builder: (context, state) => AISettingsScreen(),
    ),
    GoRoute(
      path: Routes.settingNotification,
      builder: (context, state) => const SettingNotificationScreen(),
    ),
    GoRoute(
      path: Routes.readingHistory,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final bookId = extra?['bookId'] as int?;
        final bookTitle = extra?['bookTitle'] as String? ?? 'Reading History';

        if (bookId == null) {
          return const Scaffold(
            body: Center(child: Text("Error: Book ID required")),
          );
        }

        return ReadingHistoryScreen(bookId: bookId, bookTitle: bookTitle);
      },
    ),
  ],
  // redirect: (context, state) {
  //   return Routes.welcome;
  // },
);
