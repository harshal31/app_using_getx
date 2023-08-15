import 'package:app_using_getx/app/data/network/rest_api_call_provider.dart';
import 'package:app_using_getx/app/modules/detail_screen_module/detail_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TestScreen extends GetView<DetailScreenController> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Rest api hash code ${Get.find<RestApiCallProvider>().hashCode} ${controller.obj}");
    return Text("Test screen");
  }
}
