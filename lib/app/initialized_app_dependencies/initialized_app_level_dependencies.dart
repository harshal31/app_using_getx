import 'package:app_using_getx/app/data/app_setting.dart';
import 'package:app_using_getx/app/data/preference.dart';
import 'package:flutter/material.dart';

Future<AppSettings> initializedAppDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDarkMode = await PrefHelper.getPrefBool(PrefKey.themePref);
  final savedLocale = await PrefHelper.getPrefString(PrefKey.localePref);
  return AppSettings.getAppSetting(isDarkMode, savedLocale);
}
