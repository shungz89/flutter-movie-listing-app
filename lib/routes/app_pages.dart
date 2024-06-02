import 'package:get/get.dart';

import '../screens/details_page/details_page.dart';
import '../screens/details_page/details_page_binding.dart';
import '../screens/main_page/main_page.dart';
import '../screens/main_page/main_page_binding.dart';
import '../screens/splash/splash_binding.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/video_details_page/video_details_page.dart';
import '../screens/video_details_page/video_details_page_binding.dart';
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
    GetPage(
        name: AppRoutes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsPageBinding()),
    GetPage(
        name: AppRoutes.VIDEO_DETAILS,
        page: () => VideoDetailsPage(),
        binding: VideoDetailsPageBinding())
  ];
}
