import 'package:go_router/go_router.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/home/home_screen.dart';
import 'package:leafy/ui/search/search_screen.dart';
import 'package:leafy/ui/search_gtd/search_gtd_screen.dart';
import 'package:leafy/ui/search_ol/search_ol_screen.dart';
import 'package:leafy/ui/settings/screens/setting_accent_color_screen.dart';
import 'package:leafy/ui/settings/screens/setting_appearance_screen.dart';
import 'package:leafy/ui/settings/screens/setting_backup_restore_screen.dart';
import 'package:leafy/ui/settings/screens/setting_default_book_tag_screen.dart';
import 'package:leafy/ui/settings/screens/setting_download_mission_cover_screen.dart';
import 'package:leafy/ui/settings/screens/setting_epub_reader_screen.dart';
import 'package:leafy/ui/settings/screens/settings_book_list_order_screen.dart';
import 'package:leafy/ui/settings/settings_screen.dart';
import 'package:leafy/ui/trash_screen/trash_screen.dart';
import 'package:leafy/ui/welcome/welcome_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  // observers: [getIt<HistoryObserver>()],
  routes: [
    GoRoute(path: Routes.welcome, builder: (context, state) => WelcomeScreen()),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
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
  ],
  // redirect: (context, state) {
  //   return Routes.welcome;
  // },
);
