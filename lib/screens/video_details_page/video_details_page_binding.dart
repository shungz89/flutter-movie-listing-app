import 'package:get/get.dart';

import 'video_details_page_controller.dart';

class VideoDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<VideoDetailsPageController>(
        () => VideoDetailsPageController(apiRepository: Get.find()));
  }
}
