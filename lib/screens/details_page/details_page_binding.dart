import 'package:get/get.dart';

import 'details_page_controller.dart';

class DetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<DetailsPageController>(
        () => DetailsPageController(apiRepository: Get.find()));
  }
}
