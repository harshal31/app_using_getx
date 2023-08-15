import 'package:app_using_getx/app/modules/app_setting_bottom_sheet_module/bottom_sheet_controller.dart';
import 'package:app_using_getx/app/modules/app_setting_bottom_sheet_module/slide_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../translations/strings.dart';

class AppSettingBottomSheet extends GetView<BottomSheetController> {
  const AppSettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: GetX<BottomSheetController>(
        init: controller,
        builder: (logic) {
          return SlideWidget(
            key: ValueKey(controller.isSwitchToLanguages.value),
            child: controller.isSwitchToLanguages.value
                ? ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => controller.switchToMoreLanguages(false),
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.switchToMoreLanguages(false);
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 36,
                            ),
                          )
                        ],
                      ),
                      ...controller.currentLocales
                          .map(
                            (e) => SwitchListTile(
                              value: e.isSelected,
                              onChanged: (value) {
                                controller.updateDeviceLocale(
                                  e.langCode,
                                );
                              },
                              title: Text(
                                e.language,
                                style: context.textTheme.titleMedium,
                              ),
                            ),
                          )
                          .toList()
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.close,
                              size: 36,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SwitchListTile(
                        value: controller.isDarkMode.value,
                        onChanged: (value) =>
                            controller.updateThemeBasedOnPref(isDarkMode: value),
                        title: Row(
                          children: [
                            Icon(
                              controller.isDarkMode.value
                                  ? Icons.dark_mode
                                  : Icons.dark_mode_outlined,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              darkMode.tr,
                              style: context.theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            const Icon(
                              Icons.language_outlined,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              changeLanguage.tr,
                              style: context.theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                        onTap: () => controller.switchToMoreLanguages(true),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
