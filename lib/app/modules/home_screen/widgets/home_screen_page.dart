import 'package:app_using_getx/app/data/network/rest_api_base_domain.dart';
import 'package:app_using_getx/app/data/network/rest_api_call_provider.dart';
import 'package:app_using_getx/app/modules/app_setting_bottom_sheet_module/app_setting_bottom_sheet.dart';
import 'package:app_using_getx/app/modules/home_screen/widgets/home_screen_list_item.dart';
import 'package:app_using_getx/app/translations/strings.dart';
import 'package:app_using_getx/utilities/server_error_handling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_using_getx/app/modules/home_screen/controller/home_screen_controller.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Rest api hash code ${Get.find<RestApiCallProvider>().hashCode}");
    return Scaffold(
      appBar: AppBar(
        title: Text(home.tr),
        actions: [
          IconButton(
            onPressed: () => _openSettingsBottomSheet(context),
            icon: const Icon(
              Icons.settings,
              size: 26,
            ),
          ),
        ],
      ),
      body: Obx(() {
        final controller = Get.find<HomeScreenController>();
        final response = controller.response.value;
        if (response is! Invalid) {
          return ServerErrorHandling(response);
        } else {
          if (controller.profiles.isEmpty) {
            return Center(
              child: Text(noProfilePresentMsg.tr),
            );
          } else {
            return ListView.builder(
              itemCount: controller.profiles.length,
              itemBuilder: (ctx, index) =>
                  HomeScreenListItem(user: controller.profiles[index], index: index),
            );
          }
        }
      }),
    );
  }

  void _openSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const AppSettingBottomSheet(),
      elevation: 6.0,
    );
  }
}
