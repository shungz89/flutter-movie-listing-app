import 'package:get/get.dart';

import '../screens/main_page/main_page.dart';
import '../screens/main_page/main_page_binding.dart';
import '../screens/splash/splash_binding.dart';
import '../screens/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.MAINPAGE,
      page: () => MainPage(),
      binding: MainPageBinding(),
    ),
  ];
}
