import 'package:app_using_getx/app/data/app_level_binding/root_bindings.dart';
import 'package:app_using_getx/app/data/app_setting.dart';
import 'package:app_using_getx/app/initialized_app_dependencies/initialized_app_level_dependencies.dart';
import 'package:app_using_getx/app/routes/app_pages.dart';
import 'package:app_using_getx/app/theme/app_theme.dart';
import 'package:app_using_getx/app/translations/app_translations.dart';
import 'package:app_using_getx/app/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  AppSettings appSettings = await initializedAppDependencies();
  runApp(
    MyApp(appSettings),
  );
}

class MyApp extends StatelessWidget {
  final AppSettings appSettings;

  const MyApp(this.appSettings, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: home.tr,
      locale: appSettings.locale,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPages.pages,
      translations: AppTranslation(),
      initialRoute: Routes.homeScreen,
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      initialBinding: RootBindings(),
      themeMode: appSettings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
