import 'package:get/get.dart';

import '../../routes/app_routes.dart';

//User this library if we need to use shared preferences
// import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(milliseconds: 300));

    Get.offAndToNamed(AppRoutes.MAINPAGE);
  }
}
