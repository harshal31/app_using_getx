import 'package:app_using_getx/app/data/network/rest_api_call_provider.dart';
import 'package:get/get.dart';

//This root level binding so these instance will available throughout application
class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestApiCallProvider());
  }
}
