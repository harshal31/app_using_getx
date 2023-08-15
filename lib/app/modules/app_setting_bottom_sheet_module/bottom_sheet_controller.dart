import 'package:app_using_getx/app/data/preference.dart';
import 'package:app_using_getx/app/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/utilities.dart';

class BottomSheetController extends GetxController {
  final isDarkMode = false.obs;
  final currentLocales = supportedLanguages.obs;
  final isSwitchToLanguages = false.obs;

  @override
  void onReady() {
    super.onReady();
    updateThemeBasedOnPref();
    _updateUi();
  }

  void updateThemeBasedOnPref({bool? isDarkMode}) async {
    if (isDarkMode != null) {
      this.isDarkMode.value = isDarkMode;
      PrefHelper.setPrefBool(PrefKey.themePref, isDarkMode);
      Get.changeThemeMode(
        isDarkMode ? ThemeMode.dark : ThemeMode.light,
      );
    } else {
      this.isDarkMode.value = await PrefHelper.getPrefBool(PrefKey.themePref);
    }
  }

  void updateDeviceLocale(String locale) async {
    _updateUi(locale: locale);
    Get.updateLocale(Helper.getSelectedLocale(locale));
    PrefHelper.setPrefString(PrefKey.localePref, Helper.getStringLocaleAsFormat(locale));
  }

  void _updateUi({String? locale}) async {
    var mSavedLocale = locale ?? await PrefHelper.getPrefString(PrefKey.localePref);
    var savedLocale = Helper.getStringLocaleAsFormat(
        mSavedLocale.isEmpty ? Get.deviceLocale.toString() : mSavedLocale);
    for (int i = 0; i < currentLocales.length; ++i) {
      if (currentLocales[i].langCode == savedLocale) {
        currentLocales[i] = currentLocales[i].copyWith(isSelected: true);
      } else {
        currentLocales[i] = currentLocales[i].copyWith(isSelected: false);
      }
    }
    currentLocales.refresh();
  }

  void switchToMoreLanguages(bool value) {
    isSwitchToLanguages.value = value;
  }
}
