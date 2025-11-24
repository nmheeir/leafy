import 'package:go_router/go_router.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/home/home_screen.dart';
import 'package:leafy/ui/welcome/welcome_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.welcome,
  routes: [
    GoRoute(path: Routes.welcome, builder: (context, state) => WelcomeScreen()),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
  ],
  // redirect: (context, state) {
  //   return Routes.welcome;
  // },
);
