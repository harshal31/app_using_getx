import 'package:app_using_getx/app/modules/detail_screen_module/binding/detail_screen_bindings.dart';
import 'package:app_using_getx/app/modules/home_screen/test_screen_page.dart';
import 'package:app_using_getx/app/modules/home_screen/widgets/home_screen_page.dart';

import '../../app/modules/detail_screen_module/detail_screen_page.dart';
import 'package:get/get.dart';

import '../modules/home_screen/binding/home_screen_bindings.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreenPage(),
        binding: HomeScreenBinding()),
    GetPage(
      name: Routes.homeDetailScreen,
      page: () => const DetailScreenPage(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.testScreen,
      page: () => const TestScreen(),
      binding: DetailScreenBinding(),
    )
  ];
}
