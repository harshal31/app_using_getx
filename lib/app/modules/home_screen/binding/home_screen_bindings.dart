import 'package:app_using_getx/app/data/network/rest_api_call_provider.dart';
import 'package:app_using_getx/app/modules/app_setting_bottom_sheet_module/bottom_sheet_controller.dart';
import 'package:app_using_getx/app/modules/home_screen/controller/home_page_repository.dart';
import 'package:app_using_getx/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepository());

    Get.lazyPut(() => HomeScreenController(Get.find<HomeRepository>()));

    Get.lazyPut(() => BottomSheetController());
  }
}
