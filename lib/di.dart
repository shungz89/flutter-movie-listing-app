import 'package:get/get.dart';


class DenpendencyInjection {
  static Future<void> init() async {

    ///Supposed to include this, but no in this sample App
    // // await Get.putAsync(() => StorageService().initStorage());
    // await Get.put(StorageService()).initStorage();
    //
    // ///Init EventBus when we initialize it
    // await Get.put(EventBusService().onInit());
  }
}
