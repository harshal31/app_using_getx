import 'dart:ui';

import 'package:get/get.dart';
import '../../utilities/utilities.dart';

class AppSettings {
  final bool isDarkMode;
  final Locale locale;

  AppSettings(this.isDarkMode, this.locale);

  static AppSettings getAppSetting(bool isDarkMode, String savedLocale) {
    var selectedLocale =
        savedLocale.isEmpty ? Get.deviceLocale! : Helper.getSelectedLocale(savedLocale);
    return AppSettings(isDarkMode, selectedLocale);
  }
}
