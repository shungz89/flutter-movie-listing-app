import 'package:get/get.dart';

import 'main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(
      () => MainPageController(apiRepository: Get.find()),
    );
  }
}
