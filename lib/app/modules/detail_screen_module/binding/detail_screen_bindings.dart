import 'package:app_using_getx/app/modules/detail_screen_module/detail_screen_controller.dart';
import 'package:get/get.dart';

class DetailScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailScreenController());
  }
}
