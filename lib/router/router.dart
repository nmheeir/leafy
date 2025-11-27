import 'package:go_router/go_router.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/book_editor/book_editor_screen.dart';
import 'package:leafy/ui/home/home_screen.dart';
import 'package:leafy/ui/search/search_screen.dart';
import 'package:leafy/ui/settings/screens/setting_accent_color_screen.dart';
import 'package:leafy/ui/settings/screens/setting_appearance_screen.dart';
import 'package:leafy/ui/settings/screens/setting_backup_restore_screen.dart';
import 'package:leafy/ui/settings/screens/setting_download_mission_cover_screen.dart';
import 'package:leafy/ui/settings/screens/settings_book_list_order_screen.dart';
import 'package:leafy/ui/settings/settings_screen.dart';
import 'package:leafy/ui/trash_screen/trash_screen.dart';
import 'package:leafy/ui/welcome/welcome_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(path: Routes.welcome, builder: (context, state) => WelcomeScreen()),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    GoRoute(path: Routes.search, builder: (context, state) => SearchScreen()),
    GoRoute(
      path: Routes.bookEditor,
      builder: (context, state) {
        // final args = state.extra as Map<String, dynamic>;
        // final appBarTitle = args['appBarTitle'] as String;
        // final initialBook = args['initialBook'] as Book;

        return BookEditorScreen(
          appBarTitle: 'Add Book',
          // initialBook: initialBook,
        );
      },
    ),
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
      builder: (context, state) => SettingsBookListOrderScreen(),
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
  ],
  // redirect: (context, state) {
  //   return Routes.welcome;
  // },
);
