
import 'package:todo_app_local/core/routes/app_routes.dart';

import '../../features/todo/presentation/screens/initial_screen.dart';
import '../../features/todo/presentation/screens/main_screens/bottom_navigation_screen.dart';

class AppScreens {
  static final screens = {
    AppRoutes.initial: (context) => const InitialScreen(),
    AppRoutes.bottomNavigation: (context) => const BottomNavigationScreen(),
  };
}
